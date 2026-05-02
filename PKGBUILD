pkgname=mingw-w64-onetbb
pkgver=2023.0.0
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='https://oneapi-src.github.io/oneTBB/'
license=('Apache')
source=(https://github.com/oneapi-src/oneTBB/archive/v$pkgver.tar.gz)
sha256sums=('f8767b971ec6aea25dde58ae0f593e94e7aa75a739a86f67967012f69e2199b1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/oneTBB-${pkgver}
}

build() {
  cd "$srcdir"/oneTBB-${pkgver}
  for _arch in ${_architectures}; do
    CXXFLAGS="-U_GLIBCXX_ASSERTIONS" ${_arch}-cmake -DTBB_TEST=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/oneTBB-${pkgver}/build-${_arch}
    make install DESTDIR="${pkgdir}"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

