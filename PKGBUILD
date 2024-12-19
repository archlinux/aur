# Maintainer: Meriel Luna Mittelbach <lunarlambda@gmail.com>
pkgname=blaustahl-git
pkgver=r32.69a93f8
pkgrel=1
pkgdesc="blaustahl utility"
arch=('x86_64')
url="https://github.com/machdyne/blaustahl"
license=('MIT')
depends=('libusb>=1', 'libusb<2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!debug)
source=('git+https://github.com/machdyne/blaustahl')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	# NOTE: invoking GCC directly as upstream `Makefile` doesn't use CFLAGS/LDFLAGS
	gcc $CFLAGS -Wall -DBACKEND_LIBUSB $LDFLAGS sw/bs.c -lusb-1.0 -o blaustahl
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D blaustahl "$pkgdir/usr/bin"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}"
}
