# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=dune-functions
_tarver=2.9.0
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
sha512sums=('cbe719915fdf25edab17f0ebc3f8a7d684a08ac9fd4501832e28dcff3527196eb45688eac6d4f1632a137311b0795f073082c19ad16c3438fb38a5ad131cc47f'
  'SKIP')
validpgpkeys=('2AA99AA4E2D6214E6EA01C9A4AF42916F6E5B1CF') # Christoph Grüninger <gruenich@dune-project.org>

prepare() {
  export _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  sed -i 's/^Version: '"${pkgver}"'-git/Version: '"${pkgver}"'/' ${pkgname}-${pkgver}/dune.module
  # install header for run test/assembletransferoperatortest.cc in fufem
  sed -i '/        rannacherturekbasis.hh/a         raviartthomasbasis.hh' ${pkgname}-${pkgver}/dune/functions/functionspacebases/CMakeLists.txt
  # install header for run test/assembletransferoperatortest.cc in fufem
  sed -i '/        flatvectorview.hh/a        globalvaluedlocalfiniteelement.hh' ${pkgname}-${pkgver}/dune/functions/functionspacebases/CMakeLists.txt
  # install header for run test/vintagebasisgridfunctiontest.cc in fufem
  sed -i '15 a install(FILES gridfunctiontest.hh DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dune/functions/gridfunctions/test)' ${pkgname}-${pkgver}/dune/functions/gridfunctions/test/CMakeLists.txt
  sed -i '7 a BUILD_ON_INSTALL' ${pkgname}-${pkgver}/doc/manual/CMakeLists.txt
  sed -i '3 a BUILD_ON_INSTALL' ${pkgname}-${pkgver}/doc/manual/CMakeLists.txt
  sed -i '/dune_python_add_test(NAME pypoisson/,+3 s/^/#/' ${pkgname}-${pkgver}/dune/python/test/CMakeLists.txt
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
    -DCMAKE_VERBOSE_MAKEFILE=ON \
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
  rm -r "${pkgdir}"/tmp
}
