# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgbase=dune-polygongrid
pkgname=(${pkgbase} python-${pkgbase})
_tarver=v2.8.0
_tar="${_tarver}/${pkgbase}-${_tarver}.tar.gz"
pkgver=2.8.0 # ${_tarver}
pkgrel=2
pkgdesc="PolygonGrid implements a DUNE grid consisting of polygons"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgbase}"
license=('GPL2')
makedepends=('dune-grid>=2.8.0' 'doxygen' 'graphviz' 'python-setuptools')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgbase}/-/archive/${_tar})
sha512sums=('ff621c5f4a9355fe2567e82c8341f2a8e0940245d3a19535e5a8584e9169892be737a38cb032eccd87c5a819daa17de34ce70847b4508df847cde746dcf544a2')

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
    -DCMAKE_DISABLE_FIND_PACKAGE_Alberta=TRUE \
    -Wno-dev
  cmake --build build-cmake --target all
  cd "build-cmake/python"
  python setup.py build
}

package_dune-polygongrid() {
  depends=('dune-grid>=2.8.0')
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgbase}-${_tarver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}

package_python-dune-polygongrid() {
  depends=('dune-polygongrid>=2.8.0' 'python-dune-grid>=2.8.0')
  pkgdesc+=" (python bindings)"
  cd "build-cmake/python"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}