# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Daniel Kirchner <daniel at ekpyron dot org>

pkgname=mingw-w64-freetype2
pkgver=2.6
pkgrel=1
pkgdesc="TrueType font rendering library (mingw-w64)"
arch=('any')
url="http://www.freetype.org/"
license=('GPL')
depends=(mingw-w64-zlib mingw-w64-crt)
makedepends=(mingw-w64-gcc mingw-w64-configure)
provides=(mingw-w64-freetype)
replaces=(mingw-w64-freetype)
source=(http://download.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.gz)
options=(!strip !buildflags !libtool staticlibs)
sha512sums=('fd0337b2cdf4e1a3a79fc8bd55a572b7276a7d8b6897cbfe6c04a2c03672fd835f51d7b986e44731edbdda42cb10e69eb56d5b1a32f9acf95224171f6d86259f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/freetype-${pkgver}/build-${_arch}"
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    ${_arch}-configure --with-zlib=/usr/${_arch} --without-png
    make
  done
}

package () {
  for _arch in ${_architectures}; do
  	cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
  	make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/share/"
  	${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  	${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
