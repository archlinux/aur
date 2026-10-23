pkgname=mingw-w64-agrum
pkgver=3.3.0
pkgrel=1
pkgdesc="C++ Bayesian networks library (mingw-w64)"
license=('LGPL')
arch=('any')
url="http://agrum.gitlab.io/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('edc12e55ee0ce7b30b2e7addcd5552f5de72b0d807004110f41fdf2c403d8dc0')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare () {
  cd aGrUM-$pkgver
}

build() {
  cd aGrUM-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_UNITY_BUILD=ON -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir/aGrUM-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

