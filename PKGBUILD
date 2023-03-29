# Maintainer: Nicolas Geniteau <nicolas.geniteau@gmail.com>
pkgname=someblocks-git
pkgver=1.0.1.r0.28d7e79
pkgrel=3
pkgdesc="dwm-like bar for dwl"
arch=('x86_64')
url="https://git.sr.ht/~raphi/someblocks"
license=('ISC')
depends=('somebar')
makedepends=('git' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://git.sr.ht/~raphi/someblocks" "someblocks.service" "blocks.h")
sha256sums=('SKIP' '19c7f77354377f8cb767e6e1916ea7a65f7af23de992ba359527cd5b5431c126' 'SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# Use a custom blocks.h if the file is not empty
	if [ -s "$srcdir/blocks.h" ]; then
		cp -f "$srcdir/blocks.h" blocks.h
	fi
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir/" PREFIX=/usr make install
	install -Dm644  $srcdir/someblocks.service ${pkgdir}/usr/lib/systemd/user/someblocks.service
}
