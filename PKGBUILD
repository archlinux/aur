pkgname=mingw-w64-metis
pkgver=5.2.1
pkgrel=3
pkgdesc='Serial Graph Partitioning and Fill-reducing Matrix Ordering (mingw-w64)'
url="https://github.com/KarypisLab/METIS"
license=('Apache')
depends=('mingw-w64-gklib')
makedepends=('mingw-w64-cmake')
arch=('any')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/KarypisLab/METIS/archive/v${pkgver}.tar.gz")
sha256sums=('1a4665b2cd07edc2f734e30d7460afb19c1217c2547c2ac7bf6e1848d50aff7a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd METIS-$pkgver
  sed -i "s|//#define IDXTYPEWIDTH 32|#define IDXTYPEWIDTH 32|g" include/metis.h
  sed -i "s|//#define REALTYPEWIDTH 32|#define REALTYPEWIDTH 64|g" include/metis.h
  mkdir -p build/xinclude build/windows
  touch build/xinclude/CMakeLists.txt
  cp include/metis.h build/xinclude
  cp include/CMakeLists.txt build/xinclude
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-metis/0003-WIN32-Install-RUNTIME-to-bin.patch | patch -p1
  sed -i '/add_subdirectory("programs")/d' CMakeLists.txt
  echo "target_link_libraries(metis GKlib)" >> libmetis/CMakeLists.txt
  sed -i "s|march=native|march=nocona|g" conf/gkbuild.cmake
  sed -i "s|VERSION 2.8|VERSION 3.5|g" CMakeLists.txt
}

build() {
  cd "${srcdir}"/METIS-$pkgver
  for _arch in ${_architectures}; do
    for _shared in OFF ON; do
      ${_arch}-cmake -B build-${_arch}-${_shared} -DSHARED=${_shared}
      make -C build-${_arch}-${_shared}
    done
  done
}

package() {
  for _arch in ${_architectures}; do
    for _shared in OFF ON; do
      make install -C "${srcdir}"/METIS-$pkgver/build-${_arch}-${_shared} DESTDIR="${pkgdir}"
    done
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a  
  done
}
