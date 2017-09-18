
pkgname=mingw-w64-intel-tbb
pkgver=2018_20170726
_pkgver=2018
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='http://www.threadingbuildingblocks.org/'
license=('APACHE')
source=("https://github.com/01org/tbb/archive/${_pkgver}.tar.gz")
sha1sums=('e54de69981905ad69eb9cf0226b9bf5f9a4ba065')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/tbb-${_pkgver}
  curl -L https://raw.githubusercontent.com/wjakob/tbb/master/CMakeLists.txt -o CMakeLists.txt
  curl -L https://raw.githubusercontent.com/wjakob/tbb/master/build/version_string.ver.in -o build/version_string.ver.in
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
  for _arch in ${_architectures}; do
    cd "$srcdir"/tbb-${_pkgver}/build-${_arch}
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

