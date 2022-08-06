# Maintainer: Maciej Dems <macdems@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Guilhem Saurel <guilhem@saurel.me>
# Contributor: Michel Zou
# Contributor: Oliver Goethel
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=med-serial
pkgver=4.1.1
pkgrel=1
pkgdesc='Generic pre- and post-processing platform for numerical simulation (serial version)'
url="https://www.salome-platform.org/downloads"
license=(LGPL)
arch=(x86_64)
provides=(med)
conflicts=(med med-openmpi)
replaces=(med)
depends=(hdf5 python tk)
makedepends=(cmake gcc-fortran ninja openmpi swig)
source=("https://files.salome-platform.org/Salome/other/med-$pkgver.tar.gz"
        hdf5-1.12.patch)
b2sums=('fb9bc3239c18c53fa42c5dd1101559746e8d38db2a3cb5fb47d1bf0cb578facc4ab95409af8524f5c20251848842cc1a331f6a816ce0754e9a6c95f507174ed1'
        '9fb63135d64d7a905cfad012a5d5fc2ecc8605ea0e30adeeb21d29d5e36ecedbe91f7b6254a53ae11d74336633c352b7021bdebda8d772640b5fafb70ad6796f')

prepare() {
  cd med-${pkgver}_SRC
  patch -p1 -i ../hdf5-1.12.patch # Fix build with hdf5 1.12 (Fedora)
  sed -i 's/if H5_VERS_MINOR > 10/if 0/g' src/ci/MEDfileCompatibility.c
  # install cmake files to /usr/lib${LIB_SUFFIX}/cmake
  sed -i 's,share/cmake,lib${LIB_SUFFIX}/cmake,g' CMakeLists.txt
}

build() {
  export CPPFLAGS+=' -DH5_USE_110_API'
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_SKIP_RPATH=ON \
    -D MEDFILE_BUILD_PYTHON=ON \
    -D MEDFILE_BUILD_TESTS=OFF \
    -D MEDFILE_INSTALL_DOC=OFF \
    -D MEDFILE_USE_MPI=OFF \
    -G Ninja \
    -S med-${pkgver}_SRC
  ninja -C build
}

check() {
  cd build
  LD_LIBRARY_PATH="$srcdir/build/src" ctest -E '._Python' --output-on-failure
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
