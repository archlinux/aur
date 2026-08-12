pkgname=mingw-w64-scotch
pkgver=7.0.13
pkgrel=1
pkgdesc="Software package and libraries for graph, mesh and hypergraph partitioning, static mapping, and sparse matrix block ordering (mingw-w64)"
arch=('any')
url="https://gitlab.inria.fr/scotch/scotch"
depends=('mingw-w64-bzip2' 'mingw-w64-zlib' 'mingw-w64-xz')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine')
options=('staticlibs' '!buildflags' '!strip')
license=('custom:CeCILL-C')
source=("https://gitlab.inria.fr/scotch/scotch/-/archive/v${pkgver}/scotch-v${pkgver}.tar.gz")
sha256sums=('6457d1f177fce9c07324b8c57ad1086402b0e61bd9ecf5c30b2b481944ea8fe7')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare () {
  cd "${srcdir}/scotch-v${pkgver}"
  sed -i "s|COMMAND \$<TARGET_FILE:dummysizes>|COMMAND \${CMAKE_CROSSCOMPILING_EMULATOR} \$<TARGET_FILE:dummysizes>|g" src/libscotch*/CMakeLists.txt
  sed -i "s|\$<TARGET_FILE:dummysizes>|\${CMAKE_CROSSCOMPILING_EMULATOR} \$<TARGET_FILE:dummysizes>|g" src/check/CMakeLists.txt
  sed -i "s|COMMAND \$<TARGET_FILE:gdump>|COMMAND \${CMAKE_CROSSCOMPILING_EMULATOR} \$<TARGET_FILE:gdump>|g" src/check/CMakeLists.txt
  echo "target_link_libraries(scotch PUBLIC scotcherr)" >> src/libscotch/CMakeLists.txt
}

build() {
  cd "${srcdir}/scotch-v${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_PTSCOTCH=OFF -DINSTALL_METIS_HEADERS=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/scotch-v${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
