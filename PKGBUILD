# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgbase=dune-alugrid
pkgname=(${pkgbase} python-${pkgbase})
_tarver=2.8
_tar="${_tarver}/${pkgbase}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}.0
pkgrel=1
pkgdesc="An adaptive, loadbalancing, unstructured implementation of the DUNE grid interface supporting either simplices or cubes"
arch=('x86_64')
url="https://www.dune-project.org/modules/${pkgbase}"
license=('GPL')
makedepends=('dune-grid>=2.8.0' 'doxygen' 'graphviz' 'python-setuptools') # 'dlmalloc' 'sionlib' 'parmetis'
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgbase}/-/archive/releases/${_tar})
sha512sums=('9dd13a702d35ecf6a4022f70a54227892615a363e7a29b52f9f109c3f1397a6fcd0e43a46821bd92e211dab8c72d68dbe9fa18f30ff1b456e26c1ce1941f8ba8')

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

package_dune-alugrid() {
  depends=('dune-grid>=2.8.0' 'zoltan')
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgbase}-releases-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}

package_python-dune-alugrid() {
  depends=('dune-alugrid>=2.8.0' 'python-dune-grid>=2.8.0')
  pkgdesc+=" (python bindings)"
  cd "build-cmake/python"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
