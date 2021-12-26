# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgbase=dune-fem
pkgname=(${pkgbase} python-${pkgbase})
_tarver=v2.8.0.5
_tar="${_tarver}/${pkgbase}-${_tarver}.tar.gz"
pkgver=${_tarver/v/}
pkgrel=1
pkgdesc="A discretization module providing an implementation of mathematical abstractions to solve PDEs on parallel computers including local grid adaptivity, dynamic load balancing, and higher order discretization schemes"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgbase}"
license=('GPL2')
makedepends=('dune-alugrid>=2.8.0' 'suitesparse' 'dune-istl>=2.8.0' 'dune-localfunctions>=2.8.0' 'doxygen' 'graphviz' 'python-ufl' 'python-setuptools')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'eigen: Lightweight C++ template library for vector and matrix math'
  'papi: for events supported'
  'dune-spgrid: for implement structured, parallel grid'
  'dune-polygongrid: for implement DUNE grid consisting of polygons')
source=(https://gitlab.dune-project.org/${pkgbase}/${pkgbase}/-/archive/${_tar})
sha512sums=('13f3fb74c2a9e98c6d28a6e57c5f767d636a9f1d59ad5953bc80da70f0e0e83231c581b182d96f785b058387ecc47d5238201ae8106d2629a479b7f04856c6fe')

prepare() {
  sed -i '/  FindPThreads.cmake/d' ${pkgbase}-${_tarver}/cmake/modules/CMakeLists.txt
  sed -i '/  FindSIONlib.cmake/d' ${pkgbase}-${_tarver}/cmake/modules/CMakeLists.txt
}

build() {
  cmake \
    -S ${pkgbase}-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DCMAKE_DISABLE_FIND_PACKAGE_Vc=TRUE \
    -DDUNE_GRID_GRIDTYPE_SELECTOR=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_Alberta=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_PETSc=TRUE \
    -Wno-dev
  cmake --build build-cmake --target all
  cd "build-cmake/python"
  python setup.py build
}

package_dune-fem() {
  depends=('dune-alugrid>=2.8.0' 'dune-istl>=2.8.0' 'dune-localfunctions>=2.8.0' 'superlu' 'suitesparse')
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgbase}-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  cd "${pkgdir}/usr/"
  rm -r "python"
  find "${pkgdir}" -type d -empty -delete
}

package_python-dune-fem() {
  depends=('dune-fem>=2.8.0' 'python-dune-alugrid>=2.8.0' 'python-dune-istl>=2.8.0' 'python-dune-localfunctions>=2.8.0' 'python-ufl')
  pkgdesc+=" (python bindings)"
  cd "build-cmake/python"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
