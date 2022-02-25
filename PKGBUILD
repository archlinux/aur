# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Original: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Contributor: César Vecchio <cesar UNDERSTRIKE vecchio AT yahoo DOT com>
# Contributor: valandil
# Contributor: nim65s
# Contributor: Joey Dumont <joey.dumont@gmail.com>
# Contributor: simonp
# Contributor: Martin Ortbauer <mortbauer@gmail.com>

_pkgname='med'
pkgname=('med-openmpi'
         'med-openmpi-docs'
         )
pkgver=4.1.0
pkgrel=2
pkgdesc="Generic pre- and post-processing platform for numerical simulation (openmpi version)"
url="https://www.salome-platform.org/downloads"
license=('LGPL')
depends=('hdf5-openmpi'
         'tk'
         'python'
         )
makedepends=('gcc-fortran'
             'swig'
             'openmpi'
             'cmake'
             )
arch=('x86_64')
source=("http://files.salome-platform.org/Salome/other/${_pkgname}-${pkgver}.tar.gz"
        'hdf5-1.12.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/sci-libs/med/files/med-4.1.0-0003-build-against-hdf5-1.12.patch?id=350ea3e89d0e87e35a3a4b5f2ce92b55aae9d226'
        )
sha256sums=('847db5d6fbc9ce6924cb4aea86362812c9a5ef6b9684377e4dd6879627651fce'
            '82d28b6ae2ee6ceb3c6de9acb861a49741e2e759c7c556217f7d284216788206'
            )
options=('debug')

prepare() {
  patch -d "${_pkgname}-${pkgver}" -p1 -i "${srcdir}/hdf5-1.12.patch"
  sed 's/if H5_VERS_MINOR > 10/if 0/g' -i "${_pkgname}-${pkgver}/src/ci/MEDfileCompatibility.c"
  # set libdir as cmake install path instead of share
  sed 's|share/cmake|lib${LIB_SUFFIX}/cmake|g' -i "${_pkgname}-${pkgver}/CMakeLists.txt"
}

build() {
  CXX="mpicxx" \
  CC="mpicc" \
  FC="mpif90" \
  F9X="mpif90" \
  CFLAGS+=" -DH5_USE_18_API" \
  cmake -S "${_pkgname}-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMEDFILE_USE_MPI=ON \
    -DMEDFILE_BUILD_PYTHON=ON \
    -DMEDFILE_BUILD_TESTS=ON \
    -DMEDFILE_INSTALL_DOC=ON \
    -DCMAKE_SKIP_RPATH=ON

  cmake --build build
}

check() {
  cd build
  LD_LIBRARY_PATH="${srcdir}/build/src" \
  ctest -E '._Python' --output-on-failure # exclude python test due circular dependency(?)
}

package_med-openmpi() {
  provides=('med')
  conflicts=('med')
  replaces=('med')

  DESTDIR="${pkgdir}" cmake --build build --target install

  # remove docs
  rm -rf "${pkgdir}/usr/share"
  # remove testsuit
  rm -fr "${pkgdir}/usr/bin/"test*
  # create missing symlinks (see install output)
  (cd "${pkgdir}/usr/bin"
    ln -sf mdump4 mdump
    ln -sf xmdump4 xmdump
  )
}

package_med-openmpi-docs() {
  pkgdesc+=" (Documentation)"
  arch=('any')
  depends=()

  DESTDIR="${pkgdir}" cmake --build build --target install

  # remove headers, binaries and libraries
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/lib"
}
