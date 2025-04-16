# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=mfem
pkgver=4.8
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
sha512sums=('df865bddac2c3bd950150c5beb49717363b256fde472efe7500bc170fafb7ecfe16edae93a562c81c5dd54c8d20986382db5f4756409e47e47f74862b1c87dfd')

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
