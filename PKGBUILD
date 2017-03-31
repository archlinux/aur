
pkgname=mingw-w64-intel-tbb
pkgver=2017_20161128
_pkgver=2017_U5
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='http://www.threadingbuildingblocks.org/'
license=('APACHE')
source=("https://github.com/01org/tbb/archive/${_pkgver}.tar.gz"
        "https://raw.githubusercontent.com/wjakob/tbb/master/CMakeLists.txt"
        "https://raw.githubusercontent.com/wjakob/tbb/master/build/version_string.ver.in")
sha1sums=('26f720729d322913912e99d1e4a36bd10625d3ca'
          'SKIP'
          'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/tbb-${_pkgver}
  cp "$srcdir"/CMakeLists.txt .
  cp "$srcdir"/version_string.ver.in build
}

build() {
  cd "$srcdir"/tbb-${_pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DTBB_BUILD_TESTS=OFF ..
    make
    popd
  done
}

package() {
  cd "$srcdir"/tbb-${_pkgver}
  for _arch in ${_architectures}; do
    cd "$srcdir"/tbb${pkgver/\./}oss/build-${_arch}
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

