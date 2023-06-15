# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=mfem
pkgver=4.5.2
pkgrel=2
pkgdesc="Lightweight, general, scalable C++ library for finite element methods"
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
license=('custom:BSD-3-clause')
depends=('gcc-libs')
makedepends=('cmake')
provides=("libmfem.so=$pkgver-64")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  gcc-13-compatibility.patch::${url}/commit/314a32af2ee80af8c9af7d8ad71babd51851154c.patch)
sha512sums=('819519c061fa96d3cd735090085c86c0d46e6344a69712b9b2af087ea9ce56ab3446fd9b3055f80a5d8b2a61f944497319980fc951a857c7aeef88c62b154b8e'
  'baf70a7e4c9d33eab6cc745a56692e7f4841289d04b649170e14ca548c4a07faf3b54686af97ec7815362950c5c8cee9b92188539ceeddefa917d24a537a8a42')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../gcc-13-compatibility.patch
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
