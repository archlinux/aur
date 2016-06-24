
pkgname=mingw-w64-intel-tbb
pkgver=4.4_20160413
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='http://www.threadingbuildingblocks.org/'
license=('GPL')
source=("http://threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb${pkgver/\./}oss_src.tgz"
        "https://raw.githubusercontent.com/wjakob/tbb/master/CMakeLists.txt"
        "https://raw.githubusercontent.com/wjakob/tbb/master/build/version_string.ver.in")
sha1sums=('SKIP'
          'SKIP'
          'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/tbb${pkgver/\./}oss
  cp "$srcdir"/CMakeLists.txt .
  cp "$srcdir"/version_string.ver.in build
}

build() {
  cd "$srcdir"/tbb${pkgver/\./}oss
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  cd "$srcdir"/tbb${pkgver/\./}oss
  for _arch in ${_architectures}; do
    cd "$srcdir"/tbb${pkgver/\./}oss/build-${_arch}
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
