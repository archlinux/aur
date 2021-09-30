# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgbase=dune-functions
pkgname=(${pkgbase} python-${pkgbase})
_tarver=2.8.0
_tar="${_tarver}/${pkgbase}-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="Abstractions for functions and discrete function space bases"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgbase}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
makedepends=('dune-localfunctions>=2.8.0' 'dune-grid>=2.8.0' 'dune-istl>=2.8.0' 'texlive-latexextra' 'texlive-pictures' 'biber' 'doxygen' 'graphviz' 'python-setuptools')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://dune-project.org/download/${_tar}{,.asc})
sha512sums=('67dbf0cb625dd2870e3e278bb2592e534c3d0c9aad6f0f350937c77b7a1f1e037077b51aad92232955a3697ecf664c7433ac7c21989b74e1544bf3714631f23f' 'SKIP')
validpgpkeys=('ABE52C516431013C5874107C3F71FE0770D47FFB') # Markus Blatt (applied mathematician and DUNE core developer) <markus@dr-blatt.de>

prepare() {
  sed -i '7 a BUILD_ON_INSTALL' ${pkgbase}-${_tarver}/doc/manual/CMakeLists.txt
  sed -i '3 a BUILD_ON_INSTALL' ${pkgbase}-${_tarver}/doc/manual/CMakeLists.txt
}

build() {
  cmake \
    -S ${pkgbase}-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
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

package_dune-functions() {
  depends=('dune-istl>=2.8.0' 'dune-localfunctions>=2.8.0' 'dune-typetree>=2.8.0' 'dune-grid>=2.8.0')
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgbase}-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}

package_python-dune-functions() {
  depends=('dune-functions>=2.8.0' 'python-dune-istl>=2.8.0' 'python-dune-localfunctions>=2.8.0' 'python-dune-grid>=2.8.0')
  pkgdesc+=" (python bindings)"
  cd "build-cmake/python"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
