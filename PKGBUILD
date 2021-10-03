# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgbase=dune-spgrid
pkgname=(${pkgbase} python-${pkgbase})
_tarver=2.8
_tar="${_tarver}/${pkgbase}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}.0
pkgrel=1
pkgdesc="An efficient structured, parallel implementation of the DUNE grid interface"
arch=('x86_64')
url="https://www.dune-project.org/modules/${pkgbase}"
license=('GPL')
makedepends=('dune-grid>=2.8.0' 'doxygen' 'graphviz' 'python-setuptools')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgbase}/-/archive/releases/${_tar})
sha512sums=('557457b269372d29b655298f94bc78ef12eaf44dfbafa605dfd62146476893f5c7ccdda4322834a0fb4be900238adba3811b0b578dac702e52b7327e99647e76')

build() {
  cmake \
    -S ${pkgbase}-releases-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -Wno-dev
  cmake --build build-cmake --target all
  cd "build-cmake/python"
  python setup.py build
}

package_dune-spgrid() {
  depends=('dune-grid>=2.8.0')
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  # install -Dm644 ${pkgbase}-releases-${_tarver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}

package_python-dune-spgrid() {
  depends=('dune-spgrid>=2.8.0' 'python-dune-grid>=2.8.0')
  pkgdesc+=" (python bindings)"
  cd "build-cmake/python"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
