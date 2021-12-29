# Maintainer: Bruce Zhang
pkgname="xmind-electron"
pkgver=11.1.2
release_date=202111151820
pkgrel=1
pkgdesc="XMind - The most popular mind mapping software"
arch=('x86_64')
url="https://www.xmind.net/desktop/"
license=('custom: XMind')
depends=('electron13')
source=(
	"$pkgname-$pkgver-$release_date.orig.rpm::https://dl3.xmind.net/XMind-for-Linux-x86-64bit-$pkgver-$release_date.rpm"
)
sha256sums=('7aa30e4d8e5c9cd1e4e48f88fdccaaebba4befd700969da57ee776a9c4244a00')

prepare() {
	cd "$srcdir"
	echo "#!/bin/env sh
exec electron13 /usr/share/xmind/app.asar \$@
" > "$srcdir/xmind.sh"
	sed -i 's/^Exec=/Exec=xmind %U/' "$srcdir/usr/share/applications/xmind.desktop"
}

package() {
	cd "$srcdir/usr/share"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/{}" \;
	install -Dm755 "$srcdir/xmind.sh" "$pkgdir/usr/bin/xmind"

	cd "$srcdir/opt/XMind/resources"
	install -Dm644 app.asar "$pkgdir/usr/share/xmind/app.asar"

	cd app.asar.unpacked
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/xmind/app.asar.unpacked/{}" \;
}
