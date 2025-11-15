# Maintainer: alpheratz0 <alpheratz99@protonmail.com>
pkgname=opilion
pkgver=1.2.0
pkgrel=1
pkgdesc='PulseAudio volume manager for X11 with vim-like keybindings'
arch=(x86_64)
url='https://github.com/alpheratz0/opilion'
license=(GPL2)
depends=(
	libxcb
	xcb-util-image
	xcb-util-keysyms
	xcb-util-cursor
	libpulse
	pixman
	fcft
	terminus-font
	tllist
)
makedepends=(pkgconf git wget)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0300821811fd552206bc970554433d34299eebc1f67514647c679084e19d674e')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -Ei 's|^PREFIX = .*|PREFIX = /usr|' config.mk
	sed -Ei 's/^CFLAGS =/CFLAGS +=/' config.mk
	sed -Ei 's/^LDFLAGS =/LDFLAGS +=/' config.mk
	sed -Ei 's/(^|[[:space:]])-Os($|[[:space:]])/\1\2/g' config.mk
	sed -Ei 's/(^|[[:space:]])-s($|[[:space:]])/\1\2/g' config.mk
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
