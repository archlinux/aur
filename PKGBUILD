# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=dune-pdelab
_tarver=2.7
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=3
pkgdesc="New generalized discretization module for a wide range of discretization methods"
arch=('x86_64')
url="https://www.dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=('dune-functions>=2.7' 'dune-alugrid>=2.7' 'superlu' 'arpackpp' 'suitesparse' 'dune-alugrid>=2.8.0' 'parmetis' 'scotch')
makedepends=('doxygen' 'graphviz' 'eigen')
optdepends=(
  'texlive-core: Type setting system'
  'biber: A Unicode-capable BibTeX replacement for biblatex users'
  'doxygen: Generate the class documentation from C++ sources'
  'eigen: Lightweight C++ template library for vector and matrix math'
  'dune-alugrid: for creation ALUGrid from gmsh file'
  'dune-multidomaingrid: for Multiple-Domain Grid Function Space test for Poisson')
source=(https://gitlab.dune-project.org/pdelab/${pkgname}/-/archive/releases/${_tar})
sha512sums=('f080d6ac1cec818c92629cffbf6e6ae17dc8a8c7121a5d72e98e4fea1320ab4d331d77faeabc6ef4aac14d06fd5f834eaa7ea4e9520afc51f213a877d7f1f47d')

prepare() {
  sed -i 's/^Version: '"${pkgver}"'-git/Version: '"${pkgver}"'/' ${pkgname}-releases-${_tarver}/dune.module
}

build() {
  cmake \
    -S ${pkgname}-releases-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Vc=TRUE \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-releases-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgdir}/usr/share/dune/cmake/modules"
  rm CorrectWindowsPaths.cmake FindPETSc.cmake FindPackageMultipass.cmake ResolveCompilerPaths.cmake
  find "${pkgdir}" -type d -empty -delete
}
