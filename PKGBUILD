# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=mfem
pkgver=4.9
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
sha512sums=('946477c5e2f43c00f4c3bd3a1beb644c6dd20d855853599dab390f41ea4177b5652815e56ba8b238b89e8b8a314d278b8ac7ab433c4239bc56d40a6ed484c07f')

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
