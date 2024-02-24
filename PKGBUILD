# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-fem
_tarver=v2.9.1
_tar=${_tarver}/${pkgname}-${_tarver}.tar.gz
pkgver=${_tarver/v/}
pkgrel=1
pkgdesc="A discretization module providing an implementation of mathematical abstractions to solve PDEs on parallel computers including local grid adaptivity, dynamic load balancing, and higher order discretization schemes"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=('GPL2')
depends=("dune-alugrid>=${pkgver::5}" "dune-istl>=${pkgver::5}" "dune-localfunctions>=${pkgver::5}" python-matplotlib python-scipy python-fenics-ufl)
makedepends=(doxygen graphviz python-scikit-build)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'eigen: Lightweight C++ template library for vector and matrix math'
  'papi: for events supported'
  'dune-spgrid: for implement structured, parallel grid'
  'dune-polygongrid: for implement DUNE grid consisting of polygons'
  'dune-p4estgrid: for implement grid interface using p4est')
source=(https://gitlab.dune-project.org/${pkgname}/${pkgname}/-/archive/${_tar})
sha512sums=('265e34d7ce4d906dc8519b024261496b6d8891462d189c7491413906f59f06d1ef56f9a466ac3c856ed037645be2f25dc6e440ab1e537a608a245cc242a2d1af')

prepare() {
  export _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  sed -i 's/fenics-ufl==2022.2.0/fenics-ufl>=2022.2.0/' ${pkgname}-${_tarver}/dune.module
  # https://gitlab.dune-project.org/dune-fem/dune-fem/-/issues/111
  sed -i '/  FindPThreads.cmake/d' ${pkgname}-${_tarver}/cmake/modules/CMakeLists.txt
  sed -i '/  FindSIONlib.cmake/d' ${pkgname}-${_tarver}/cmake/modules/CMakeLists.txt
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
  cd ${pkgname}-${_tarver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --skip-cmake install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type d -empty -delete
}
