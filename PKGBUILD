# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-polygongrid
_tarver=v2.10.0
_tar=${_tarver}/${pkgname}-${_tarver}.tar.gz
pkgver=${_tarver/v/}
pkgrel=1
pkgdesc="PolygonGrid implements a DUNE grid consisting of polygons"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(GPL-2.0-or-later)
depends=("dune-grid>=${pkgver}")
makedepends=(doxygen graphviz python-scikit-build)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
options=(!emptydirs)
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/${_tar})
sha512sums=('6e5f422baa4d733ee10f4a79e0917e813fa9e53008a438a51312058e1ee872cd8ed62065702b5dfa6198fd37953913486399133c7d239b1f14a54b0e1bb2d60c')

prepare() {
  cd ${pkgname}-${_tarver}
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
    -DCMAKE_DISABLE_FIND_PACKAGE_Alberta=FALSE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist"
}

package() {
  cd ${pkgname}-${_tarver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --skip-cmake install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
