# Maintainer: Xentec <artificial.i7 at gmail dot com>

pkgname=cppformat-git
pkgver=1.1.0.r202.g8949a2e
pkgrel=1
pkgdesc="Small, safe and fast formatting library for C++"
arch=('i686' 'x86_64')
url="http://cppformat.github.io"
license=('BSD')
depends=('gcc-libs')
conflicts=('cppformat')
makedepends=('cmake' 'git')
source=("$pkgname"::'git+https://github.com/cppformat/cppformat')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	mkdir -p build && cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=1 \
		-Wno-dev \
		..
	make
}

check() {
	cd "$pkgname"
	cd build

	make test
}

package() {
	cd "$pkgname"

	install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 format.h "${pkgdir}/usr/include/format.h"

	cd build

	install -D -m755 libformat.so "$pkgdir/usr/lib/libformat.so"
}

