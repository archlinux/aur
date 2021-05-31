# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Experimental, scalable, high performance HTTP server'
pkgname=lwan
pkgver=0.3
pkgrel=1
arch=(x86_64)
license=(GPL)
url=https://lwan.ws
depends=(brotli zstd jemalloc)
makedepends=(cmake ninja clang)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lpereira/lwan/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a470097401d9aa097414706ebbff4f7a280bbf694a26c38f8169f03a98d73eac244e1ada6d0be1922f86318215ac47703b4b9ee773c7a4cfa898916deb819378')

build () {
	rm -rf build

	# GCC 11 crashes during build, so use Clang instead.
	CC=clang \
	cmake -S"${pkgname}-${pkgver}" -Bbuild -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DUSE_ALTERNATIVE_MALLOC=jemalloc

	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --install build
}
