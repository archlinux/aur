# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=dune-functions
_tarver=2.9.1
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=1
pkgdesc="Abstractions for functions and discrete function space bases"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=("dune-localfunctions>=${pkgver}" "dune-grid>=${pkgver}" "dune-istl>=${pkgver}" "dune-typetree>=${pkgver}")
makedepends=(texlive-latexextra texlive-pictures biber doxygen graphviz python-scipy)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://dune-project.org/download/${_tar}{,.asc})
sha512sums=('0c3d21d8d9b2bc776eb9fb9f19305a5368c929ad0553e9576fca6557296a7be5f9626261151e6d9d31011756e751efaae5fe5912397c6fe20a615d89e00166c4'
  'SKIP')
validpgpkeys=('2AA99AA4E2D6214E6EA01C9A4AF42916F6E5B1CF') # Christoph Grüninger <pgp@grueninger.de>

prepare() {
  export _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  # install header for run test/vintagebasisgridfunctiontest.cc in fufem
  sed -i '15 a install(FILES gridfunctiontest.hh DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dune/functions/gridfunctions/test)' ${pkgname}-${pkgver}/dune/functions/gridfunctions/test/CMakeLists.txt
  sed -i '7 a BUILD_ON_INSTALL' ${pkgname}-${pkgver}/doc/manual/CMakeLists.txt
  sed -i '3 a BUILD_ON_INSTALL' ${pkgname}-${pkgver}/doc/manual/CMakeLists.txt
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
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-O2 -Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DALLOW_CXXFLAGS_OVERWRITE=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_LATEX=FALSE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=FALSE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist"

  cmake --build build-cmake --target all
  cd build-cmake/python
  python setup.py build
}

package() {
  XDG_CACHE_HOME="${PWD}" DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type d -empty -delete
  cd build-cmake/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
