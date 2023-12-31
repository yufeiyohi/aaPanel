#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

# aapanel降级脚本

panel_path='/www/server/panel'

if [ ! -d $panel_path ];then
echo "当前未安装aapanel面板!"
exit 0;
fi

base_dir=$(cd "$(dirname "$0")";pwd)
if [ $base_dir = $panel_path ];then
echo "不能在面板根目录执行降级命令!"
exit 0;
fi

if [ ! -d $base_dir/class ];then
echo "没有找到降级文件!"
exit 0;
fi

rm -f $panel_path/*.pyc $panel_path/class/*.pyc
\cp -r -f $base_dir/. $panel_path/
/etc/init.d/bt restart
echo "===================================="
echo "已完成降级!"