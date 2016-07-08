# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor (.desktop-file and icon): Nascher <kevin at nascher dot org>

pkgname=goatattack
pkgver=0.4.3
pkgrel=2
pkgdesc="A fast-paced multiplayer pixel art shooter game."
arch=("any")
url="http://www.goatattack.net/"
license=('GPL')
depends=("sdl2" "libpng" "sdl2_mixer")
makedepends=('gendesk')
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz" 'http://goatattack.net/images/goat_logo.png')
md5sums=('4bffb9a8010cde124dbc60857dcb5ae3' '7d7e98bfbe7dc77c08c71c79b99e925a')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# generate .desktop-file
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Goat Attack" --exec "$pkgname" --categories "Game"

	autoreconf -i
	./configure --prefix=/usr --enable-map-editor
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make check
}

package() {
	cd "$srcdir"
	# install icon
	install -Dm644 "goat_logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	cd "$pkgname-$pkgver"
	# install .desktop-file
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	make DESTDIR="$pkgdir/" install
}