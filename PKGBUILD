# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=mfem
pkgver=4.7
pkgrel=1
pkgdesc="Lightweight, general, scalable C++ library for finite element methods"
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
license=(BSD-3-Clause)
depends=(gcc-libs blitz metis hypre openmpi)
# gnutls conduit ginkgo hdf5-openmpi libunwind mpfr | sundials scalapack scotch suitesparse superlu_dist
makedepends=(cmake)
provides=("libmfem.so=${pkgver}-64")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c74f63f8256a8a0f7278b61120236bbab740e489b1c857bf35894c659e86b61cdce17e5ee42f763a516176e33e4bb93071d03d7dbb65637ec31b0de17ce1fc66')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DMFEM_USE_MPI=YES \
    -DHYPRE_DIR=/usr/include/hypre \
    -Wno-dev

  local N_CORES=$(grep "core id" /proc/cpuinfo | uniq | wc -l)
  cmake --build build --parallel $N_CORES
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
