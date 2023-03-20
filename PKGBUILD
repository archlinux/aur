# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-vtk
_tarver=v2.9.0
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver="${_tarver/v/}"
pkgrel=1
pkgdesc="File reader and writer for the VTK XML Format"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=("dune-grid>=${pkgver}" "dune-localfunctions>=${pkgver}")
makedepends=(doxygen graphviz)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/${_tar})
sha512sums=('32e10a5b3969e946ec9ad0f0d1d2a8d34cf86b4a7b09320abf1b209c5093a1c0e3c40b819ca1bb46410a0187201f83b5b965c0d83a194d02f0b60264ef1aecec')

prepare() {
  sed -i 's/^Version: '"${pkgver%.0}"'/Version: '"${pkgver}"'/' ${pkgname}-${_tarver}/dune.module
  python -m venv --system-site-packages build-cmake/dune-env
}

build() {
  XDG_CACHE_HOME="${PWD}" \
    cmake \
    -S ${pkgname}-${_tarver} \
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
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=OFF \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist" \
    -Wno-dev

  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-${_tarver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
