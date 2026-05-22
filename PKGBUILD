# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=pcraster
pkgver=4.4.2
pkgrel=2
pkgdesc='Environmental modelling software'
arch=('x86_64')
url='https://pcraster.geo.uu.nl'
license=('GPL3')
depends=('boost' 'gdal' 'ncurses' 'python-numpy' 'python-pyqt5-chart' 'xerces-c')
makedepends=('cmake' 'make' 'python3')
source=("pcraster-$pkgver.tar.gz::https://github.com/pcraster/pcraster/archive/refs/tags/pcraster-$pkgver.tar.gz"
        "fix-pcraster-4.4.2-gcc16-gdal313.patch")
sha512sums=('47ff5c2d551022409e2cd8eeed32edbc40fc74bcf232e1df0e921de61e769c1e9df91ba3fa710a8abdd92d6c46d6ecbac5173539b6e7827b785b2138d7c21ca9'
            '1440e529749a379a52d6b6766642dac54a728e4e21cfcdb52c777862c3551f5704e34e50163f43809a0909365e8ceedd943edc0c3ee16b06326f31dca02d5249')

prepare() {
  cd "${srcdir}/pcraster-pcraster-${pkgver}"

  # Apply patches for compatibility with GCC 16 and GDAL 3.13
  patch -Np1 < "${srcdir}/../fix-pcraster-4.4.2-gcc16-gdal313.patch"
}

build() {
  cd "${srcdir}/pcraster-pcraster-${pkgver}"

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPCRASTER_PYTHON_INSTALL_DIR=lib/python3.14/site-packages \
    -DPCRASTER_BUILD_TEST=FALSE \
    -DFERN_BUILD_ALGORITHM=TRUE \
    -DPython3_EXECUTABLE=/usr/bin/python3

  make -j$(nproc)
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
