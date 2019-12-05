# Maintainer: Bruce Zhang
_name=xmind-zen
pkgname="$_name-electron"
pkgver=10.0.0
release_date=201911260056
pkgrel=2
pkgdesc="XMind - The most popular mind mapping software"
arch=('x86_64')
url="https://www.xmind.net/zen/"
license=('custom')
depends=('electron5')
provides=("$_name" xmind)
conflicts=("$_name" xmind)
source=("$_name-$pkgver-$release_date.orig.rpm::https://dl3.xmind.net/XMind-ZEN-for-Linux-x86-64bit-$pkgver-$release_date.rpm")
sha256sums=('1821384afb6b0cf9f80eba7e7c529a4754ce59b3d192af16d173b9a317730131')

prepare() {
	cd "$srcdir"
	echo "#!/bin/env sh
exec electron5 /usr/share/XMind/app.asar \$@
" > "$srcdir/XMind.sh"
	sed -i 's/^Exec=/Exec=XMind %U/' "$srcdir/usr/share/applications/XMind.desktop"
}

package() {
	cd "$srcdir/usr/share"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/{}" \;
	install -Dm755 "$srcdir/XMind.sh" "$pkgdir/usr/bin/XMind"

	cd "$srcdir/opt/XMind ZEN/resources"
	install -Dm644 app.asar "$pkgdir/usr/share/XMind/app.asar"

	cd app.asar.unpacked
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/XMind/app.asar.unpacked/{}" \;
}
