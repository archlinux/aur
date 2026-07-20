pkgname=mingw-w64-onetbb
pkgver=2023.1.0
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='https://oneapi-src.github.io/oneTBB/'
license=('Apache')
source=(https://github.com/oneapi-src/oneTBB/archive/v$pkgver.tar.gz)
sha256sums=('191288b52e1e6b17198000b64d77d194bb65e791be46ebc606e9b091781e2070')

_architectures=${MINGW_W64_QT6_ARCHS:-x86_64-w64-mingw32}

prepare () {
  cd "$srcdir"/oneTBB-${pkgver}
}

build() {
  cd "$srcdir"/oneTBB-${pkgver}
  for _arch in ${_architectures}; do
    CXXFLAGS="-U_GLIBCXX_ASSERTIONS" ${_arch}-cmake -DTBB_TEST=OFF -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir"/oneTBB-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

