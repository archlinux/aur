# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-vem
_tarver=v2.10.0
_tar=${_tarver}/${pkgname}-${_tarver}.tar.gz
pkgver=${_tarver/v/}
pkgrel=1
pkgdesc="Implementation of a number of virtual element spaces and bilinear forms"
arch=(x86_64)
url="https://gitlab.dune-project.org/dune-fem/${pkgname}"
license=(GPL-2.0-or-later)
depends=("dune-fem>=${pkgver}" python-sortedcontainers python-triangle)
makedepends=(doxygen graphviz python-scikit-build)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
options=(!emptydirs)
source=(https://gitlab.dune-project.org/${pkgname/v/f}/${pkgname}/-/archive/${_tar})
sha512sums=('84c523be550cc258a29c7b373e46fe66edab43de84feb66cbedb7b5ab5cd15cf6e5c75635c97179b41d2694169b69f31aacabc64c7bdc267c5b67365d3fd20c0')

prepare() {
  export _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  python -m venv --system-site-packages _skbuild/linux-${CARCH}-${_pyversion}/cmake-build/dune-env
}

build() {
  cd ${pkgname}-${_tarver}

  XDG_CACHE_HOME="${PWD}" \
    python setup.py build \
    --build-type=None \
    -G 'Unix Makefiles' \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-O2 -Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_LATEX=FALSE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=FALSE \
    -DDUNE_GRID_GRIDTYPE_SELECTOR=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_Vc=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_PETSc=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_PTScotch=FALSE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist"
}

package() {
  cd ${pkgname}-${_tarver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --skip-cmake install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
