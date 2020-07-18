# Maintainer: Bruce Zhang
pkgname=lanzou-gui
pkgver=0.3.2
pkgrel=2
pkgdesc='蓝奏云 | 蓝奏云客户端 | 蓝奏网盘 GUI版本'
arch=('x86_64' 'i686')
url="https://github.com/rachpt/$pkgname"
license=('MIT')
depends=('python-pyqtwebengine' 'python-requests-toolbelt')
options=('!strip')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/rachpt/$pkgname/archive/v$pkgver.tar.gz"
	'normalize.patch'
)
sha256sums=('0a7e1e2ac4bea2117fc8650f8502bea631487f7e40f1f624bd2d61cd6702e688'
            '358918cb6098c1077cf8532c8821b223129b5fe28ddc84389c3a1a2920c396c1')

_dir="/opt/$pkgname"

prepare() {
	patch "$pkgname-$pkgver/lanzou/debug.py" < normalize.patch
	echo "#!/usr/bin/env bash
exec python $_dir/main.py" > "$pkgname.sh"
	echo "[Desktop Entry]
Type=Application
Name=Lanzou Cloud GUI
Name[zh_CN]=蓝奏云 GUI
Comment=Lanzou Cloud GUI Client
Comment[zh_CN]=蓝奏云 | 蓝奏云客户端 | 蓝奏网盘 GUI版本
Exec=$pkgname
Icon=lanzou-gui
Categories=Network;
Terminal=false
StartupNotify=true
StartupWMClass=Lanzou GUI" > "$pkgname.desktop"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/$_dir"
	cp main.py "$pkgdir/$_dir/"
	cp -r lanzou "$pkgdir/$_dir/"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
