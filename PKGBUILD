# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Based on AUR3 PKGBUILD by Ken Tossell <ken@tossell.net>

pkgname=libuvc-git
pkgver=0.0.7.r2.g047920b
pkgrel=1
pkgdesc="a cross-platform library for USB video devices"
arch=('x86_64')
url='https://libuvc.github.io/libuvc/'
license=('BSD-3-Clause')
depends=('libusb' 'libjpeg')
makedepends=('cmake' 'git')
source=(git+https://github.com/libuvc/libuvc.git)
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
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
}

build() {
	make -C "$srcdir/build"
}

package() {
	make -C "$srcdir/build" DESTDIR="${pkgdir}" install
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/libuvc/LICENSE.txt"
}
