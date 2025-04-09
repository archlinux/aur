# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Michael Straube <michael_straube@web.de>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=ampl-mp
pkgver=4.0.3
pkgrel=1
pkgdesc="An open-source library for mathematical programming"
arch=(x86_64)
url="https://github.com/${pkgname/-//}"
license=(LPL-1.0)
# depends=()
makedepends=(cmake ninja) # unixodbc
options=('!emptydirs')
source=(mp-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d0f105994847a990c195de68bef04fb8321a11ee35661131d1476ee1224fd81fb265ed393ca3b3fca2c5d5ba18f57f77d86036da970d85ff1fccdd3b6b0ce4f8')
prepare() {
  # https://github.com/fmtlib/fmt/issues/398#issue-183946005
  sed -i -- 's/CHAR_WIDTH/CHAR_SIZE/g' "mp-${pkgver}/include/mp/format.h"
}
# _modules="" # cplex gecode ilogcp jacop localsolver path smpswriter sulum gsl
# -DBUILD=${_modules} -DBUILD=all
build() {
  cmake \
    -S "mp-${pkgver}" \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DMP_VARIADIC_TEMPLATES=OFF \
    -DBUILD=no \
    -Wno-dev
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 "mp-${pkgver}/LICENSE.rst" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
