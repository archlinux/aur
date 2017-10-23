# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Based on AUR3 PKGBUILD by Ken Tossell <ken@tossell.net>

pkgname=libuvc-git
pkgver=0.0.6.r6.g77b43d6
pkgrel=1
pkgdesc="a cross-platform library for USB video devices"
arch=('i686' 'x86_64')
url="https://int80k.com/libuvc/"
license=('BSD')
depends=('libusb' 'libjpeg')
makedepends=('cmake' 'git')
source=(git+https://git@github.com/ktossell/libuvc.git)
sha256sums=('SKIP')
conflicts=('libuvc')
provides=('libuvc')

pkgver() {
	cd "$srcdir/libuvc"
	git describe --long --tags | sed -E 's/v([^-]*)-([^-]*-g)/\1-r\2/;s/-/./g'
}

prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"

	cmake "$srcdir/libuvc" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib
}

build() {
	make -C "$srcdir/build"
}

package() {
	make -C "$srcdir/build" DESTDIR="${pkgdir}" install
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/libuvc/LICENSE.txt"
}
