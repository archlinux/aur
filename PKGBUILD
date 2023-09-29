# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=mfem
pkgver=4.6
pkgrel=1
pkgdesc="Lightweight, general, scalable C++ library for finite element methods"
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
license=('custom:BSD-3-clause')
depends=('gcc-libs')
makedepends=('cmake')
provides=("libmfem.so=${pkgver}-64")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8805b4993b6f11abe7ac7dda59d0ddb2e0f5f6b09c2b9c57e665f481cd9bd6b669e63621b38989f70dc8ae38c42a7e8c4e10a1d87a4ac29d53ddd95ce79db0ae')

prepare() {
  sed -i '19 a #include <cstdint>' ${pkgname}-${pkgver}/general/kdtree.hpp
}

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
