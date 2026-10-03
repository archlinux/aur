pkgname=mingw-w64-scip
pkgver=10.1.0
pkgrel=1
pkgdesc="Solving Constraint Integer Programs (mingw-w64)"
arch=('any')
url='https://www.scipopt.org/'
license=(Apache-2.0)
depends=('mingw-w64-bliss' 'mingw-w64-gmp' 'mingw-w64-mpfr' 'mingw-w64-onetbb' 'mingw-w64-papilo' 'mingw-w64-readline' 'mingw-w64-soplex' 'mingw-w64-zlib' 'mingw-w64-coin-or-ipopt')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/scipopt/scip/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a56b2fa179af35431ca7c3e12ecb7aad3cba8eb08011cacf2b813f8042c07c1')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd "${srcdir}/scip-${pkgver}"
}

build() {
  cd "${srcdir}/scip-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DZIMPL=OFF -DSYM=bliss -DBUILD_TESTING=OFF -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "${srcdir}/scip-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
