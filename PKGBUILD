
pkgname=mingw-w64-intel-tbb
pkgver=2020.1
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='http://www.threadingbuildingblocks.org/'
license=('APACHE')
source=(https://github.com/intel/tbb/archive/v$pkgver.tar.gz)
sha256sums=('7c96a150ed22bc3c6628bc3fef9ed475c00887b26d37bca61518d76a56510971')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/tbb-${pkgver}
  curl -L https://raw.githubusercontent.com/wjakob/tbb/master/CMakeLists.txt -o CMakeLists.txt
  curl -L https://raw.githubusercontent.com/wjakob/tbb/master/build/version_string.ver.in -o build/version_string.ver.in

  # https://github.com/wjakob/tbb/pull/62
  sed -i "57ilist(REMOVE_ITEM tbb_src \${CMAKE_CURRENT_SOURCE_DIR}/src/tbb/tbb_bind.cpp)" CMakeLists.txt
}

build() {
  cd "$srcdir"/tbb-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DTBB_BUILD_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/tbb-${pkgver}/build-${_arch}
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

