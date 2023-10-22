# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=ccluster
pkgver=1.1.7
pkgrel=1
pkgdesc="local clustering of complex roots of a univariate polynomial with complex coefficients"
url="https://github.com/rimbach/Ccluster"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('flint>=3.0.0' 'gmp')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('725ab22cf7e74afe5a5133ac75ee4a101d7b4ff5f0f25a6b74f5d9bfda8a18d5')

prepare () {
  cd "${srcdir}/Ccluster-${pkgver}"
  # arb is included in flint since flint-3.0.0; do not link explicitly
  find . -type f -iname 'makefile*' -exec sed -i -e s/-larb// {} +
  sed -i -e 's/LIBS="${LIBS} arb"//' ./configure
  # arb_poly_taylor_shift_convolution is not available anymore
  find . -type f -name '*.c' -exec sed -i -r 's/(a[rc]b)_poly_taylor_shift_convolution/\1_poly_taylor_shift/g' {} +
}

build () {
  cd "${srcdir}/Ccluster-${pkgver}"
  CFLAGS="-fcommon ${CFLAGS} ${LDFLAGS} -I/usr/include/flint" ./configure --with-flint=/usr --with-gmp=/usr --prefix="${pkgdir}/usr"
  make bins
}

check () {
  cd "${srcdir}/Ccluster-${pkgver}/test"
  # hide gnuplot to make non-interactive
  sed -i -e 's/| gnuplot/| true/' Makefile
  PATH="$(pwd):${PATH}" make testVerbose
}

package () {
  cd "${srcdir}/Ccluster-${pkgver}"
  make install
  find bin -type f -perm 755 ! -name '*.sh' -exec install -Dt "${pkgdir}/usr/bin" -m755 '{}' \;
}
