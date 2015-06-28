# Contributor: mickele
pkgname=parmetis3
pkgver=3.2.0
pkgrel=3
pkgdesc="A parallel graph partitioning library"
url="http://glaros.dtc.umn.edu/gkhome/metis/parmetis/overview"
arch=('i686' 'x86_64')
provides=('metis4')
conflicts=('metis4')
license="custom"
depends=(openmpi)
makedepends=()
source=("http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/ParMetis-${pkgver}.tar.gz" "cmake.tar.gz" "idxtype.h" "parmetis-idxtype.diff" "metis-idxtype.diff")

build() {
  cd ${srcdir}

  msg "Copying CMake files..."
  tar -zxvf cmake.tar.gz
  cp ${srcdir}/cmake/CMakeLists.txt          ${srcdir}/ParMetis-${pkgver}/
  cp ${srcdir}/cmake/METISLib/CMakeLists.txt      ${srcdir}/ParMetis-${pkgver}/METISLib
  cp ${srcdir}/cmake/ParMETISLib/CMakeLists.txt      ${srcdir}/ParMetis-${pkgver}/ParMETISLib
  cp ${srcdir}/cmake/Programs/CMakeLists.txt ${srcdir}/ParMetis-${pkgver}/Programs

  cd "$srcdir/ParMetis-${pkgver}"

  msg "Running CMake..."
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..

  msg "Compiling METIS..."
  make
}

package () {
  cd "$srcdir/ParMetis-${pkgver}/build"

  msg "Installing..."
  make install DESTDIR=${pkgdir}
  
  install -m644 -D "${srcdir}/idxtype.h" "${pkgdir}/usr/include/parmetis-3"
  cd "${pkgdir}/usr/include/parmetis-3"
  patch parmetis.h < "${srcdir}/parmetis-idxtype.diff"
  cd "${pkgdir}/usr/include/metis-4"
  patch metis.h < "${srcdir}/metis-idxtype.diff"
  
  sed -e "s|4.0|4.0.3|" -i "${pkgdir}/usr/include/metis-4/defs.h"

  # Install license
  install -m644 -D "${srcdir}/ParMetis-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('d97fea8c8776e1f9340ff90d9992e929'
         '40fee35e3718a064948b355324bfb9a4'
         'd9c5658f5868f747f5d0a5b44d314220'
         '3ce21d0b403b702887d6496e0230f744'
         '57a76a09ad66b05eb9abe4474c5ac9b3')
