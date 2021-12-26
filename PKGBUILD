# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgbase=dune-mmesh
pkgname=(${pkgbase} python-${pkgbase})
pkgver=1.3.1
pkgrel=1
pkgdesc="MMesh is a grid implementation based on CGAL triangulations"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgbase}"
license=('GPL3')
makedepends=('dune-fem>=2.8.0' 'boost' 'texlive-core' 'doxygen' 'graphviz' 'python-setuptools')
optdepends=('openmpi: for mpi support'
  'vc: C++ Vectorization library'
  'texlive-core: Type setting system'
  'doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'dune-fem: for store static information about grid implementation or support type of boundary id provider specialized for each grid type')
source=(https://github.com/samuelburbulla/${pkgbase}/archive/release/${pkgver}.tar.gz)
sha512sums=('f704d33f77b37ef02a0b15af4a1feac4fc240e87544e2aa4ece4bdb427be24af475e9dd2c1f2f28df3036eee73e1ae246ddb0f46431367df4d7de6ab1a320ae5')

prepare() {
  sed -i 's/^Version: 1.3-git/Version: '"${pkgver}"'/' ${pkgbase}-release-${pkgver}/dune.module
}

build() {
  cmake \
    -S ${pkgbase}-release-${pkgver} \
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
    -Wno-dev
  cmake --build build-cmake --target all
  cd "build-cmake/python"
  python setup.py build
}

package_dune-mmesh() {
  depends=('dune-grid>=2.8.0')
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -m644 -D ${pkgbase}-release-${pkgver}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}

package_python-dune-mmesh() {
  depends=('dune-mmesh>=2.8.0' 'python-dune-fem>=2.8.0')
  pkgdesc+=" (python bindings)"
  cd "build-cmake/python"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
