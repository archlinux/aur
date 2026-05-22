# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=pcraster
pkgver=4.4.2
pkgrel=1
pkgdesc='Environmental modelling software'
arch=('x86_64')
url='https://pcraster.geo.uu.nl'
license=('GPL3')
depends=('boost' 'gdal' 'ncurses' 'python-numpy' 'python-pyqt5-chart' 'xerces-c')
makedepends=('cmake' 'make' 'python3')
source=("pcraster-$pkgver.tar.gz::https://github.com/pcraster/pcraster/archive/refs/tags/pcraster-$pkgver.tar.gz")
sha512sums=('47ff5c2d551022409e2cd8eeed32edbc40fc74bcf232e1df0e921de61e769c1e9df91ba3fa710a8abdd92d6c46d6ecbac5173539b6e7827b785b2138d7c21ca9')

build() {
  cd "${srcdir}/pcraster-pcraster-${pkgver}"

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPCRASTER_WITH_PYTHON_MULTICORE=TRUE \
    -DPCRASTER_BUILD_TEST=FALSE \
    -DFERN_BUILD_ALGORITHM=TRUE \
    -DPCRASTER_PACKAGE_BOOST=ON \
    -DPCRASTER_PACKAGE_NCURSES=ON \
    -DPython3_EXECUTABLE=/usr/bin/python3

  make -j1
}

check() {
  cd "${srcdir}/pcraster-pcraster-${pkgver}/build"
  ctest --output-on-failure
}

package() {
  cd "${srcdir}/pcraster-pcraster-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  # Strip debug symbols
  find "${pkgdir}" -depth -type f \( -name '*.so*' -o -name '*.a' \) -exec strip --strip-unneeded {} + 2>/dev/null || true
}

