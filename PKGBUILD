pkgname=mingw-w64-abseil-cpp
pkgver=20240116.2
pkgrel=1
pkgdesc='Collection of C++ library code designed to augment the C++ standard library (mingw-w64)'
arch=('any')
url='https://abseil.io'
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/abseil/abseil-cpp/archive/$pkgver/abseil-cpp-$pkgver.tar.gz")
sha256sums=('733726b8c3a6d39a4120d7e45ea8b41a434cdacde401cba500f14236c49b39dc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/abseil-cpp-$pkgver"
  curl -L https://github.com/abseil/abseil-cpp/pull/1536.patch | patch -p1
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
