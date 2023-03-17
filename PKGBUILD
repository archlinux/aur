# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-fem
_tarver=2.9.0
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=1
pkgdesc="A discretization module providing an implementation of mathematical abstractions to solve PDEs on parallel computers including local grid adaptivity, dynamic load balancing, and higher order discretization schemes"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=('GPL2')
depends=("dune-alugrid>=${pkgver}" "dune-istl>=${pkgver}" "dune-localfunctions>=${pkgver}" python-matplotlib python-scipy python-ufl)
makedepends=(doxygen graphviz python-scikit-build python-ninja)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'eigen: Lightweight C++ template library for vector and matrix math'
  'papi: for events supported'
  'dune-spgrid: for implement structured, parallel grid'
  'dune-polygongrid: for implement DUNE grid consisting of polygons')
source=(https://dune-project.org/download/${_tar}{,.asc}
  include.patch::https://gitlab.dune-project.org/${pkgname}/${pkgname}/-/commit/43a596eba13fa528e8c62be9ad31c9b7f63e6260.patch)
sha512sums=('c36623035934ed7ea95d1c8c4ae2e14a11c84cdc89a8c3625ec8dd2b029824cf8aa7fc8b345ccad59c0a6a47f4688abff4c11c4d5a853cbe27becc7f793109fc'
  'SKIP'
  '9ab59b5daec2e39f0fd2636892aedf9fb5930d1ff27a0fdea782a818d73605363c60d78212f38bc4adcab16d9cc32a64bf534c5da9c1be012d5cd272c15a4489')
validpgpkeys=('E5B47782DE09813BCC3518E159DA94F1FC8FD313') # Andreas Dedner <a.s.dedner@warwick.ac.uk>

prepare() {
  cd ${pkgname}-${pkgver}
  export _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  patch -p1 -i ../include.patch
  sed -i 's/^Python-Requires: fenics-ufl==2019.1.0/Python-Requires: fenics-ufl>=2019.1.0/' dune.module
  # https://gitlab.dune-project.org/dune-fem/dune-fem/-/issues/111
  sed -i '/  FindPThreads.cmake/d' cmake/modules/CMakeLists.txt
  sed -i '/  FindSIONlib.cmake/d' cmake/modules/CMakeLists.txt
  sed -i 's/^Version: '"${pkgver%%.0}"'/Version: '"${pkgver}"'/' dune.module
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
    -DDUNE_GRID_GRIDTYPE_SELECTOR=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_Alberta=FALSE \
    -DCMAKE_DISABLE_FIND_PACKAGE_PETSc=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Vc=TRUE \
    -DDUNE_GRID_GRIDTYPE_SELECTOR=ON \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist"
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --skip-cmake install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type d -empty -delete
}
