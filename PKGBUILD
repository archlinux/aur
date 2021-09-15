# Maintainer: xmengnet <794508986@qq.com>
pkgname=aria2-config-script
pkgver=0.2
pkgrel=2
pkgdesc="一个自动配置Aria2的脚本，自动创建、启动服务，可直接搭配浏览器插件使用。"
arch=(any)
license=('GPL')
depends=('aria2')


package() {
user=`whoami`
#开始安装
file=${pkgdir}/etc/aria2
service_path=${pkgdir}/etc/systemd/system/
service=$service_path/aria2.service
file_session=$file/aria2.session
file_conf=$file/aria2.conf
userpath=/home/$user/Downloads
if [ ! -d "$file" ]; then
     echo "创建目录 $file"
     mkdir -p $file
     echo "创建文件 $file_session"
     touch $file_session
     echo "创建文件 $file_conf"
     touch $file_conf
     chmod 755 $file_session
     chmod 755 $file_conf
     echo "写入默认配置信息..."
     echo "#＝＝＝＝＝＝＝＝＝文件保存目录自行修改">> $file_conf
     echo "#username根据实际情况修改">> $file_conf
     echo "dir=$userpath">> $file_conf
     echo "disable-ipv6=true">> $file_conf
     echo "">> $file_conf
     echo "#打开rpc的目的是为了给web管理端用">> $file_conf
     echo "enable-rpc=true">> $file_conf
     echo "rpc-allow-origin-all=true">> $file_conf
     echo "rpc-listen-all=true">> $file_conf
     echo "#rpc-listen-port=6800">> $file_conf
     echo "#断点续传">> $file_conf
     echo "continue=true">> $file_conf
     echo "input-file=$file_session">> $file_conf
     echo "save-session=$file_session">> $file_conf
     echo "">> $file_conf
     echo "#最大同时下载任务数">> $file_conf
     echo "max-concurrent-downloads=20">> $file_conf
     echo "save-session-interval=120">> $file_conf
     echo "">> $file_conf
     echo "# Http/FTP 相关">> $file_conf
     echo "connect-timeout=120">> $file_conf
     echo "#lowest-speed-limit=10K">> $file_conf
     echo "#同服务器连接数">> $file_conf
     echo "max-connection-per-server=10">> $file_conf
     echo "#max-file-not-found=2">> $file_conf
     echo "#最小文件分片大小, 下载线程数上限取决于能分出多少片, 对于小文件重要">> $file_conf
     echo "min-split-size=10M">> $file_conf
     echo "#单文件最大线程数, 路由建议值: 5">> $file_conf
     echo "split=10">> $file_conf
     echo "check-certificate=false">> $file_conf
     echo "#http-no-cache=true">> $file_conf
fi
if [ ! -d "$service" ]; then
	echo "创建目录 $service_path"
    	mkdir -p $service_path
    	echo "创建服务 $service"
    	touch $service
	echo "[Unit]" >> $service
	echo "Description=Aria2c Service" >> $service
	echo "After=network-online.target" >> $service
	echo "Wants=network-online.target" >> $service

	echo "[Service]" >> $service
	echo "Type=simple" >> $service
	echo "ExecStart=/usr/bin/aria2c --conf-path=/etc/aria2/aria2.conf" >> $service
	echo "ExecStop=/bin/killall aria2c" >> $service
	echo "Restart=always" >> $service
	echo "StandOutput=syslog" >> $service

	echo "StandError=inherit" >> $service

	echo "[Install]" >> $service
	echo "WantedBy=multi-user.target"  >> $service
fi
	chmod 755 $service

   	echo "请自行修改/etc/aria2/aria2.conf 里面的下载位置"
	echo "然后使用 ‘sudo systemctl enable --now aria2c’ 设置开机自启并且现在启动"
	
}
