# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Original: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Contributor: César Vecchio <cesar UNDERSTRIKE vecchio AT yahoo DOT com>
# Contributor: valandil
# Contributor: nim65s
# Contributor: Joey Dumont <joey.dumont@gmail.com>
# Contributor: simonp
# Contributor: Martin Ortbauer <mortbauer@gmail.com>

_pkgname=med
pkgname=med-openmpi-docs
pkgver=4.1.1
pkgrel=1
pkgdesc="Generic pre- and post-processing platform for numerical simulation (openmpi version) (Documentation)"
url="https://www.salome-platform.org/downloads"
license=('LGPL')
depends=("med=$pkgver")
makedepends=('gcc-fortran'
             'hdf5-openmpi'
             'cmake'
             'doxygen'
             'graphviz'
             )
arch=('any')
source=("http://files.salome-platform.org/Salome/other/${_pkgname}-${pkgver}.tar.gz"
        'hdf5-1.12.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/sci-libs/med/files/med-4.1.0-0003-build-against-hdf5-1.12.patch?id=350ea3e89d0e87e35a3a4b5f2ce92b55aae9d226'
        )
sha256sums=('dc2b5d54ebf0666e3ff2e974041d2ab0da906061323537023ab165d573389dd0'
            '82d28b6ae2ee6ceb3c6de9acb861a49741e2e759c7c556217f7d284216788206')
options=('debug')

prepare() {
  patch -d "${_pkgname}-${pkgver}_SRC" -p1 -i "${srcdir}/hdf5-1.12.patch"
  sed 's/if H5_VERS_MINOR > 10/if 0/g' -i "${_pkgname}-${pkgver}_SRC/src/ci/MEDfileCompatibility.c"
  # set libdir as cmake install path instead of share
  sed 's|share/cmake|lib${LIB_SUFFIX}/cmake|g' -i "${_pkgname}-${pkgver}_SRC/CMakeLists.txt"
}

build() {
  CXX="mpicxx" \
  CC="mpicc" \
  FC="mpif90" \
  F9X="mpif90" \
  CFLAGS+=" -DH5_USE_18_API" \
  cmake -S "${_pkgname}-${pkgver}_SRC" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMEDFILE_USE_MPI=ON \
    -DMEDFILE_BUILD_PYTHON=OFF \
    -DMEDFILE_BUILD_DOC=ON \
    -DMEDFILE_BUILD_TESTS=OFF \
    -DMEDFILE_INSTALL_DOC=ON \
    -DCMAKE_SKIP_RPATH=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # remove headers, binaries and libraries
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/lib"
}
