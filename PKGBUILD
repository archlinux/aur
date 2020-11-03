pkgname=mingw-w64-tbb
pkgver=2020.3
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
replaces=('mingw-w64-intel-tbb')
conflicts=('mingw-w64-intel-tbb')
provides=('mingw-w64-intel-tbb')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='https://github.com/oneapi-src/oneTBB'
license=('APACHE')
source=(https://github.com/oneapi-src/oneTBB/archive/v$pkgver.tar.gz)
sha256sums=('ebc4f6aa47972daed1f7bf71d100ae5bf6931c2e3144cf299c8cc7d041dca2f3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/oneTBB-${pkgver}
  curl -L https://raw.githubusercontent.com/wjakob/tbb/master/CMakeLists.txt -o CMakeLists.txt
  curl -L https://raw.githubusercontent.com/wjakob/tbb/master/build/version_string.ver.in -o build/version_string.ver.in
}

build() {
  cd "$srcdir"/oneTBB-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DTBB_BUILD_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/oneTBB-${pkgver}/build-${_arch}
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

