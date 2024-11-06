# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=dune-functions
_tarver=2.10.0
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=1
pkgdesc="Abstractions for functions and discrete function space bases"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(LGPL-3.0-or-later LicenseRef-GPL-2.0-only-with-DUNE-exception)
depends=("dune-localfunctions>=${pkgver}" "dune-grid>=${pkgver}" "dune-istl>=${pkgver}" "dune-typetree>=${pkgver}")
makedepends=(texlive-latexextra texlive-pictures biber doxygen graphviz python-build python-installer python-wheel)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'python-scipy: for solve sparse matrices')
options=(!emptydirs)
source=(https://dune-project.org/download/${_tar}{,.asc})
sha512sums=('97589c0e9e8c1bdb4186137433c2c70f1bd63975511b805351fb9d0ff9a4aec3e564b72899084ae1d62d317eb098ef5686fa073e9bf0ca8895c72a7fed97eb54'
  'SKIP')
validpgpkeys=('703607A1FD9AF4205E735522B95BE0EFB19724A1') # Simon Praetorius <simon.praetorius@tu-dresden.de>

prepare() {
  # install header for run test/vintagebasisgridfunctiontest.cc in fufem
  sed -i '18 a install(FILES gridfunctiontest.hh DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dune/functions/gridfunctions/test)' ${pkgname}-${pkgver}/dune/functions/gridfunctions/test/CMakeLists.txt
  sed -i '10 a BUILD_ON_INSTALL' ${pkgname}-${pkgver}/doc/manual/CMakeLists.txt
  sed -i '6 a BUILD_ON_INSTALL' ${pkgname}-${pkgver}/doc/manual/CMakeLists.txt
  export _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  python -m venv --system-site-packages build-cmake/dune-env
}

build() {
  XDG_CACHE_HOME="${PWD}" \
    cmake \
    -S ${pkgname}-${pkgver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-O2 -Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_LATEX=FALSE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=FALSE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist"

  cmake --build build-cmake --target all
  cd build-cmake/python
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  XDG_CACHE_HOME="${PWD}" DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd build-cmake/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
