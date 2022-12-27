# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: orumin <dev at orum.in>

_base=metis
pkgname=lib32-${_base}
_pkgver=5.1.0-p10
pkgver=${_pkgver/-/.}
pkgrel=1
arch=(x86_64)
pkgdesc="A set of serial programs for partitioning graphs, partitioning finite element meshes, and producing fill reducing orderings for sparse matrices"
url="http://glaros.dtc.umn.edu/gkhome/${_base}/${_base}/overview"
license=(custom)
depends=(lib32-glibc metis)
makedepends=(cmake)
options=(docs)
# source=("http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/${_base}-${pkgver}.tar.gz")
# source=("https://ftp.mcs.anl.gov/pub/petsc/externalpackages/${_base}-${_pkgver}.tar.gz")
source=(${_base}-${pkgver}.tar.bz2::https://bitbucket.org/petsc/pkg-${_base}/get/v${_pkgver}.tar.bz2)
sha256sums=('ddcb99746a8795ebb9d9c020acc31b85fe696eb2992c9ee5ac7588074a503a4b')

prepare() {
  mv petsc-pkg-metis-* "${_base}"-"${_pkgver}"
}

build() {
  export CC="gcc -m32" PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake \
    -S "${_base}"-"${_pkgver}" \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_C_COMPILER=gcc \
    -DMATH_LIB=m \
    -Wno-dev
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  mv "${pkgdir}"/usr/lib "${pkgdir}"/usr/lib32
  rm -r "${pkgdir}"/usr/include
}
