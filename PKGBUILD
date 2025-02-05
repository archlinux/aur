# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Experimental, scalable, high performance HTTP server'
pkgname=lwan
pkgver=0.6
pkgrel=2
arch=(x86_64)
license=(GPL-2.0-only)
url=https://lwan.ws
depends=(brotli zstd mimalloc luajit)
makedepends=(cmake ninja clang lld)
options=(staticlibs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lpereira/lwan/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7edc439fe03ed7edc575d6a344b7cae766b87eff446ad5b50bc96bc7ce3b470ffcb94e401057af79f721c9575307c8dcdb1048ea45bab9b7721ac9f15e7def40')

build () {
	rm -rf build

	CC=clang CXX=clang++ LDFLAGS=-fuse-ld=lld \
	cmake -S"${pkgname}-${pkgver}" -Bbuild -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
		-DUSE_ALTERNATIVE_MALLOC=mimalloc

	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --install build
}
