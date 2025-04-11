# Maintainer: Lenn <huangyanjie@huangyanjie.com>
pkgname=ishell-pro-desktop
pkginstallname=ishell-pro
pkgver=2.0.5
pkgrel=1
pkgdesc="基于flutter的轻量级功能强大的SSH客户端"
arch=('x86_64')
url="https://www.ishell.cc/en"
license=('unknow')
depends=(
	'gtk3'
	'libayatana-appindicator'
	'glibc'
	'gcc-libs'
	'pango'
	'cairo'
	'glib2'
	'libx11'
	'libxcb'
	'zlib'
	'libpng'
	'freetype2'
	'harfbuzz'
	'atk'
	'libepoxy'
	
)
optdepends=(
	'xclip: 剪贴板支持'
	'libnotify: 桌面通知'
	'libappindicator-gtk3: 系统托盘支持'
	'libxtst: 屏幕截图增强'
)
source=("https://down.ishell.cc/ishell_linux_2.0.5.zip")
sha256sums=('3f98cf9af95200d647ee8f61a885bd800b360254141191f45cf8a0a7660b9215')

prepare(){

	if [! -f "$srcdir/ishell_pro"]; then
		error "Main executable ishell_pro not found in the source!"
		return 1
	fi
}

package() {
  install -dm755 "$pkgdir/opt/$pkginstallname"
  #install -dm755 "$pkgdir/usr/bin"

  # 复制全部文件到 /opt
  cp -r --no-preserve=ownership --preserve=mode \
	  "$srcdir"/bundle/{data,ishell_pro,lib} \
	  "$pkgdir/opt/$pkginstallname"

  install -Dm755 /dev/null "$pkgdir/usr/bin/$pkginstallname"
  cat > "$pkgdir/usr/bin/$pkginstallname" <<EOF
#!/bin/sh
cd /opt/$pkginstallname
exec ./ishell_pro "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkginstallname"


  install -Dm644 /dev/null "$pkgdir/usr/share/applications/$pkginstallname.desktop"
  cat > "$pkgdir/usr/share/applications/$pkginstallname.desktop" <<EOF
[Desktop Entry]
Name=iShell Pro
Comment=Modern Flutter-based SSH client
Exec=$pkginstallname
Icon=/opt/$pkginstallname/data/flutter_assets/static/img/new_logo_black_512.png
Terminal=false
Type=Application
Categories=Utility;TerminalEmulator;
StartupWMClass=ishell_pro
EOF
	if [-f "$srcdir/data/flutter_assets/static/img/new_logo_black_512.png"]; then
		install -Dm644 "$srcdir/data/flutter_assets/static/img/new_logo_black_512.png $pkgdir/usr/share/pixmaps/$pkginstallname.png" 
	fi
}
