pkgname=moonasst
pkgver=1.0.2
pkgrel=1
pkgdesc="Moonasst Qt application"
arch=('x86_64')
url="https://gitee.com/nemozz-hz/moonasst"
license=('MIT' 'GPL' 'LGPL')
depends=('qt6-base' 'qt6-quicktimeline' 'qt6-webengine' 'qt6-svg' 'vulkan-headers')
makedepends=()
options=('strip' '!debug')
source=("https://gitee.com/nemozz-hz/moonasst/repository/archive/v$pkgver.tar.gz")
sha256sums=('8669b3fa4752d6459f817b9664c4e7ff195484b93dd75431030ab30b9bfb5671')

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	
	# 检查moonasst二进制文件是否存在
	if [ ! -f "moonasst" ]; then
		echo "错误: 找不到moonasst二进制文件"
		echo "请确保在Gitee仓库的根目录中有moonasst可执行文件"
		exit 1
	fi
	
	# 检查moonasst二进制文件是否可执行
	if [ ! -x "moonasst" ]; then
		echo "警告: moonasst文件不可执行，正在设置执行权限"
		chmod +x moonasst
	fi
	
	# 检查moonlight二进制文件是否存在
	if [ ! -f "moonlight" ]; then
		echo "错误: 找不到moonlight二进制文件"
		echo "请确保在Gitee仓库的根目录中有moonlight可执行文件"
		exit 1
	fi
	
	# 检查moonlight二进制文件是否可执行
	if [ ! -x "moonlight" ]; then
		echo "警告: moonlight文件不可执行，正在设置执行权限"
		chmod +x moonlight
	fi
	
	# 创建目标目录
	install -dm775 "$pkgdir/opt/exec"
	install -dm777 "$pkgdir/opt/exec/config"
	install -dm777 "$pkgdir/opt/exec/Moonlight Game Streaming Project"
	
	# 安装二进制文件
	install -Dm755 moonasst "$pkgdir/opt/exec/moonasst"
	install -Dm755 moonlight "$pkgdir/opt/exec/moonlight"
	
	# 设置正确的权限（可读可写可执行）
	chmod 755 "$pkgdir/opt/exec/moonasst"
	chmod 755 "$pkgdir/opt/exec/moonlight"
	
	# 安装moonlight配置文件
	if [ -f "Moonlight.ini" ]; then
		install -Dm777 Moonlight.ini "$pkgdir/opt/exec/Moonlight Game Streaming Project/Moonlight.ini"
	fi
	
	# 创建桌面文件
	install -dm755 "$pkgdir/usr/share/applications"
	cat > "$pkgdir/usr/share/applications/moonasst.desktop" << EOF
[Desktop Entry]
Name=Moonasst
Comment=Moonasst Qt application
Exec=/opt/exec/moonasst server="http://wst.needleos.com"
Icon=/usr/share/icons/moonasst.png
Terminal=false
Type=Application
Categories=Utility;
StartupWMClass=moonasst
EOF
	
	# 如果有图标文件，安装图标
	if [ -f "moonasst.png" ]; then
		install -Dm644 moonasst.png "$pkgdir/usr/share/icons/moonasst.png"
	fi
		
	# 创建符号链接到/usr/bin（让用户可以直接运行moonasst命令）
	install -dm755 "$pkgdir/usr/bin"
	ln -sf /opt/exec/moonasst "$pkgdir/usr/bin/moonasst"
	
	# 创建卸载脚本（可选）
	cat > "$pkgdir/opt/exec/uninstall-moonasst.sh" << 'EOF'
#!/bin/bash
echo "正在卸载moonasst..."
sudo rm -f /usr/bin/moonasst
sudo rm -f /usr/share/applications/moonasst.desktop
sudo rm -f /usr/share/icons/moonasst.png
sudo rm -rf /opt/exec
echo "moonasst已卸载"
EOF
	chmod +x "$pkgdir/opt/exec/uninstall-moonasst.sh"
} 
