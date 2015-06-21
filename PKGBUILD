# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: jedbrown
# Contributor: mickele
# Contributor: gborzi
# Contributor: abenson

pkgname=metis4
pkgver=4.0.3
pkgrel=2
pkgdesc="METIS is a set of serial programs for partitioning graphs, partitioning finite element meshes, and producing fill reducing orderings for sparse matrices."
url="http://glaros.dtc.umn.edu/gkhome/metis/metis/overview"
license="custom"
depends=()
makedepends=(make gcc cmake patch)
provides=()
conflicts=()
replaces=()
backup=()
install=${pkgname}.install
arch=('i686' 'x86_64')

source=("http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/OLD/metis-${pkgver}.tar.gz"
        "cmake.tar.gz"
        "mtest.c.patch"
        "proto.h.patch")

md5sums=('d3848b454532ef18dc83e4fb160d1e10'
         'abd46399444a8d50f7a3873262a3eebf'
         'f37ee4a31911a5a9079e971e67b039e9'
         'b116697d7050eba7fb3e6768a6fedc07')

build() {
  cd ${srcdir}

  msg "Copying CMake files..."
  tar -zxvf cmake.tar.gz
  cp ${srcdir}/cmake/CMakeLists.txt          ${srcdir}/metis-${pkgver}/
  cp ${srcdir}/cmake/Lib/CMakeLists.txt      ${srcdir}/metis-${pkgver}/Lib
  cp ${srcdir}/cmake/Programs/CMakeLists.txt ${srcdir}/metis-${pkgver}/Programs
  cp ${srcdir}/cmake/Test/CMakeLists.txt     ${srcdir}/metis-${pkgver}/Test

  cd ${srcdir}/metis-${pkgver}
  msg "Patching mtest.c for unit tests..."
  patch -p1 < ../mtest.c.patch
  msg "Patching proto.h for unit tests..."
  patch -p1 < ../proto.h.patch

  msg "Running CMake..."
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..

  msg "Compiling METIS..."
  make
}

check() {
  msg "Running unit tests..."
  cd ${srcdir}/metis-${pkgver}/build/Test
  ./mtest ${srcdir}/metis-${pkgver}/Graphs/*.graph
}

package() {
  cd ${srcdir}/metis-${pkgver}/build

  msg "Installing..."
  make install DESTDIR=${pkgdir}

  # Install license
  install -m644 -D ${srcdir}/metis-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
