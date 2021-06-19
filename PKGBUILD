# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Andrew Sun <adsun701@gmail.com>
pkgname=mingw-w64-jansson
pkgver=2.13.1
pkgrel=1
pkgdesc="C library for encoding, decoding and manipulating JSON data (mingw-w64)"
arch=(any)
url="http://www.digip.org/jansson/"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.digip.org/jansson/releases/jansson-${pkgver}.tar.gz")
sha512sums=('e32be6665e41cf1763608c2f1ac4ce0824d4d7ffa5f4a5824cefde279250fdd399d49ba93d8894e16a473731f629b846554654347f027ca9a0a96ed047f10192')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "${srcdir}/jansson-${pkgver}"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure ..
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/jansson-${pkgver}/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
	done
}
