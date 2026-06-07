pkgname=mingw-w64-abseil-cpp
pkgver=20260107.1
pkgrel=2
pkgdesc='Collection of C++ library code designed to augment the C++ standard library (mingw-w64)'
arch=('any')
url='https://abseil.io'
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/abseil/abseil-cpp/archive/$pkgver/abseil-cpp-$pkgver.tar.gz")
sha256sums=('4314e2a7cbac89cac25a2f2322870f343d81579756ceff7f431803c2c9090195')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/abseil-cpp-$pkgver"
}

build() {
  cd "${srcdir}/abseil-cpp-$pkgver"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_CXX_STANDARD=17 -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir"/abseil-cpp-$pkgver
  for _arch in $_architectures; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
