pkgname=mingw-w64-abseil-cpp
pkgver=20260817.0
pkgrel=1
pkgdesc='Collection of C++ library code designed to augment the C++ standard library (mingw-w64)'
arch=('any')
url='https://abseil.io'
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/abseil/abseil-cpp/archive/$pkgver/abseil-cpp-$pkgver.tar.gz")
sha256sums=('f7e05179df39c45434cad433f5783840bb3788ef322976f9138bc6b72b3a107d')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd "${srcdir}/abseil-cpp-$pkgver"
  # absl/time/internal/cctz/src/time_zone_info.cc:416:40: error: 'O_NONBLOCK' was not declared in this scope
  curl -L https://github.com/google/cctz/pull/372.patch | patch -p1 -d absl/time/internal/cctz
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
