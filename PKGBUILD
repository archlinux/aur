pkgname=moonasst
pkgver=1.0.0
pkgrel=1
pkgdesc="Moonasst Qt application"
arch=('x86_64')
url="https://github.com/nemozz-hz/moonasst"
license=('MIT' 'GPL' 'LGPL')
depends=('qt6-base' 'qt6-quicktimeline' 'qt6-webengine')
makedepends=()
source=("https://github.com/nemozz-hz/moonasst/archive/v$pkgver.tar.gz")
sha256sums=('c440e4bbb887ad731f153c3cfb6c72e756c9aeaf1aea3d9c52bc40ab47c4d3a9')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	# 检查二进制文件是否存在
	if [ ! -f "moonasst" ]; then
		echo "错误: 找不到moonasst二进制文件"
		echo "请确保在GitHub仓库的根目录中有moonasst可执行文件"
		exit 1
	fi
	
	# 检查二进制文件是否可执行
	if [ ! -x "moonasst" ]; then
		echo "警告: moonasst文件不可执行，正在设置执行权限"
		chmod +x moonasst
	fi
	
	# 创建目标目录
	install -dm755 "$pkgdir/opt/exec"
	
	# 安装二进制文件
	install -Dm755 moonasst "$pkgdir/opt/exec/moonasst"
	
	# 设置正确的权限（可读可写可执行）
	chmod 755 "$pkgdir/opt/exec/moonasst"
	
	# 创建桌面文件
	install -dm755 "$pkgdir/usr/share/applications"
	cat > "$pkgdir/usr/share/applications/moonasst.desktop" << EOF
[Desktop Entry]
Name=Moonasst
Comment=Moonasst Qt application
Exec=/opt/exec/moonasst
Icon=moonasst
Terminal=false
Type=Application
Categories=Utility;
StartupWMClass=moonasst
EOF
	
	# 如果有图标文件，安装图标
	if [ -f "icons/moonasst.png" ]; then
		install -Dm644 icons/moonasst.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/moonasst.png"
	elif [ -f "moonasst.png" ]; then
		install -Dm644 moonasst.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/moonasst.png"
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
sudo rm -f /usr/share/icons/hicolor/48x48/apps/moonasst.png
sudo rm -rf /opt/exec/moonasst
echo "moonasst已卸载"
EOF
	chmod +x "$pkgdir/opt/exec/uninstall-moonasst.sh"
} 
