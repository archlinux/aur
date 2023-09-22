pkgname=mingw-w64-abseil-cpp
pkgver=20230802.1
pkgrel=1
pkgdesc='Collection of C++ library code designed to augment the C++ standard library (mingw-w64)'
arch=('any')
url='https://abseil.io'
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/abseil/abseil-cpp/archive/$pkgver/abseil-cpp-$pkgver.tar.gz")
sha256sums=('987ce98f02eefbaf930d6e38ab16aa05737234d7afbab2d5c4ea7adbe50c28ed')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/abseil-cpp-$pkgver"
  # add ABSL_FORCE_WAITER_MODE=4 for https://github.com/abseil/abseil-cpp/issues/1510
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CXXFLAGS="-DABSL_FORCE_WAITER_MODE=4" ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/abseil-cpp-$pkgver/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
