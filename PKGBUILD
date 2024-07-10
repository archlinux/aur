# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Jingbei Li <i@jingbei.li>
# Contributor: James Spencer <james.s.spencer@gmail.com>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
pkgname=libxc
pkgver=6.2.2
pkgrel=1
pkgdesc="A library of exchange-correlation functionals for density-functional theory"
arch=(i686 x86_64 aarch64)
url="https://www.tddft.org/programs/${pkgname}"
license=(MPL-2.0)
depends=(python-numpy)
makedepends=(gcc-fortran cmake)
#source=(${url}/down.php?file=${pkgver}/${pkgname}-${pkgver}.tar.gz)
source=(https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('cf7271e3b3866150b3f83aec3260e54bb98488597845c34fadc2b627eabbac4acd69fbe42cb3119c4b3a6cbb0929009823cb40cf4c896526e4a5cab1027dd270')
options=(staticlibs)

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=ON \
    -DENABLE_FORTRAN=ON \
    -DENABLE_GENERIC=ON \
    -DENABLE_PYTHON=ON \
    -DENABLE_XHOST=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -Wno-dev
  cmake --build build --target all
}

check() {
  ctest --output-on-failure --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
