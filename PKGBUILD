# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgbase=dune-mmesh
pkgname=(${pkgbase} python-${pkgbase})
pkgver=1.3.2
pkgrel=1
pkgdesc="MMesh is a grid implementation based on CGAL triangulations"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgbase}"
license=('GPL3')
_dunever=2.8.0
makedepends=("dune-fem>=${_dunever}" "cgal" "doxygen" "graphviz" "python-setuptools")
optdepends=('vc: C++ Vectorization library'
  'doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'dune-fem: for store static information about grid implementation or support type of boundary id provider specialized for each grid type')
source=(https://github.com/samuelburbulla/${pkgbase}/archive/v${pkgver}.tar.gz)
sha512sums=('bbe822d9d6c8e7f5fa6685b329a2e062434e576e566e6484c4ef423c7c0ce5dd59449762e677be9feb9da25a095341a013b2ceadfa4ab5f027566704844c034f')

prepare() {
  sed -i '/^install/,+2 s/^/#/' ${pkgbase}-${pkgver}/CMakeLists.txt
  rm -r ${pkgbase}-${pkgver}/CGAL
}

build() {
  cmake \
    -S ${pkgbase}-${pkgver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_CXX_FLAGS="-Wno-narrowing" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -Wno-dev
  cmake --build build-cmake --target all
  cd build-cmake/python
  python setup.py build
}

package_dune-mmesh() {
  depends=("dune-grid>=${_dunever}")
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -m644 -D ${pkgbase}-${pkgver}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}

package_python-dune-mmesh() {
  depends=("dune-mmesh>=${pkgver}" "python-dune-fem>=${_dunever}")
  pkgdesc+=" (python bindings)"
  cd build-cmake/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
