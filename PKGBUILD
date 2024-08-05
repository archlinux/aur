pkgname=mingw-w64-abseil-cpp
pkgver=20240722.0
pkgrel=1
pkgdesc='Collection of C++ library code designed to augment the C++ standard library (mingw-w64)'
arch=('any')
url='https://abseil.io'
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/abseil/abseil-cpp/archive/$pkgver/abseil-cpp-$pkgver.tar.gz")
sha256sums=('f50e5ac311a81382da7fa75b97310e4b9006474f9560ac46f54a9967f07d4ae3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/abseil-cpp-$pkgver"
}

build() {
  cd "${srcdir}/abseil-cpp-$pkgver"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    make -C build-${_arch}
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
