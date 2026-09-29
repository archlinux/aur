pkgname=mingw-w64-soplex
pkgver=8.1.0
pkgrel=1
pkgdesc="Sequential object-oriented simPlex (mingw-w64)"
arch=('any')
url='https://www.scipopt.org/'
license=(Apache-2.0)
depends=('mingw-w64-gmp' 'mingw-w64-mpfr' 'mingw-w64-onetbb' 'mingw-w64-papilo' 'mingw-w64-zlib' )
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/scipopt/soplex/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5aad34f158d251549e2aadbfbef706629f38652fcd027c12b0a8b2d3c8ff0719')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd "${srcdir}/soplex-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "${srcdir}/soplex-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

