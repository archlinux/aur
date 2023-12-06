# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-spgrid
_tarver=2.9.0
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=2
pkgdesc="An efficient structured, parallel implementation of the DUNE grid interface"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=('GPL')
depends=("dune-grid>=${pkgver}")
makedepends=(doxygen graphviz python-scikit-build)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://dune-project.org/download/${_tar}{,.asc})
sha512sums=('a9f973820009fba589b258f109499dd5b456673779fa66909e1de5b6caf8e767b9451fb490dd32ddb6436ef26abafa1c3219e3127b88abd5eea6dcc3b70b7e13' 'SKIP')
validpgpkeys=('E5B47782DE09813BCC3518E159DA94F1FC8FD313') # Andreas Dedner <a.s.dedner@warwick.ac.uk>

prepare() {
  cd ${pkgname}-${pkgver}
  export _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  sed -i 's/^Version: '"${pkgver%%.0}"'-git/Version: '"${pkgver}"'/' dune.module
  python -m venv --system-site-packages _skbuild/linux-${CARCH}-${_pyversion}/cmake-build/dune-env
}

build() {
  cd ${pkgname}-${pkgver}

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
    -DALLOW_CXXFLAGS_OVERWRITE=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_LATEX=FALSE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=FALSE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Alberta=FALSE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist"
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --skip-cmake install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type d -empty -delete
}
