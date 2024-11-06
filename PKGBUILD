# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-fem-dg
_tarver=v2.10.0
_tar=${_tarver}/${pkgname}-${_tarver}.tar.gz
pkgver=${_tarver/v/}
pkgrel=1
pkgdesc="Implementation of Discontinuous Galerkin schemes using the DUNE-FEM framework"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(GPL-2.0-or-later)
depends=("dune-fem>=${pkgver}")
makedepends=(doxygen graphviz python-scikit-build)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
options=(!emptydirs)
source=(https://gitlab.dune-project.org/${pkgname/-dg/}/${pkgname}/-/archive/${_tar})
sha512sums=('805cc78221b471dd31bd932326b76fcce09171c55fc0e87b07d65a88ddac4b01fed31d470585f1f3f7e4cb7c8a49b4f2584841922f3c9ab2ea4cfa669a62e9cc')

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
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-O2 -Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_LATEX=FALSE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=FALSE \
    -DDUNE_GRID_GRIDTYPE_SELECTOR=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_PETSc=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist"
}

package() {
  cd ${pkgname}-${_tarver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --skip-cmake install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
