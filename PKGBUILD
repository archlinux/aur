pkgname=mingw-w64-scotch
pkgver=7.0.3
pkgrel=1
pkgdesc="network Common Data Form interface for array-oriented data access and corresponding library (mingw-w64)"
arch=('any')
url="https://www.unidata.ucar.edu/software/netcdf/"
depends=('mingw-w64-bzip2' 'mingw-w64-zlib' 'mingw-w64-xz')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
license=('custom')
source=("https://github.com/Unidata/netcdf-c/archive/v${pkgver}.tar.gz")
sha256sums=('9f4cb864f3ab54adb75409984c6202323d2fc66c003e5308f3cdf224ed41c0a6')
source=("https://gitlab.inria.fr/scotch/scotch/-/archive/v${pkgver}/scotch-v${pkgver}.tar.gz")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/scotch-v${pkgver}"
  sed -i "s|COMMAND \$<TARGET_FILE:dummysizes>|COMMAND \${CMAKE_CROSSCOMPILING_EMULATOR} \$<TARGET_FILE:dummysizes>|g" src/libscotch*/CMakeLists.txt 
  echo "target_link_libraries(scotch PUBLIC scotcherr)" >> src/libscotch/CMakeLists.txt
  sed -i "s|LIBRARY DESTINATION lib|LIBRARY DESTINATION lib RUNTIME DESTINATION bin|g" src/libscotch/CMakeLists.txt src/esmumps/CMakeLists.txt
}

build() {
  cd "${srcdir}/scotch-v${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DENABLE_TESTS=OFF -DBUILD_UTILITIES=OFF -DBUILD_PTSCOTCH=OFF ..
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/scotch-v${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/man
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
