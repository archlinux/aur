# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Michael Straube <michael_straube@web.de>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=ampl-mp
pkgver=3.1.0
pkgrel=3
pkgdesc="An open-source library for mathematical programming"
arch=('x86_64')
url="https://github.com/${pkgname/-//}"
license=('custom')
# depends=()
makedepends=(cmake ninja) # unixodbc
options=('!emptydirs')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('f23bdf37d42ac93b48e00f929afcce0a848956c9a0c1182413ee04dfcab12e8cd1af93e3924a5a6e9669a8d6841d1b8874a15a7252cf2365eb6077ab580a4447')
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
