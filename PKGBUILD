# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=ccluster
pkgver=1.1.5
pkgrel=1
pkgdesc="local clustering of complex roots of a univariate polynomial with complex coefficients"
url="https://github.com/rimbach/Ccluster"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('arb' 'flint' 'gmp')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('42aeaa9a5a9ffba183378eb1d1cd9ade070919a3dbb73c6e264b1b6bf2ae5d48')

build () {
  cd "${srcdir}/Ccluster-${pkgver}"
  CFLAGS="-fcommon ${CFLAGS} ${LDFLAGS}" ./configure --with-arb=/usr --with-flint=/usr --with-gmp=/usr --prefix="${pkgdir}/usr"
  make bins
}

check () {
  cd "${srcdir}/Ccluster-${pkgver}"
  # hide gnuplot to make non-interactive
  sed -i -e 's/| gnuplot/| true/' Makefile
  make test
}

package () {
  cd "${srcdir}/Ccluster-${pkgver}"
  make install
  find bin -type f -perm 755 ! -name '*.sh' -exec install -Dt "${pkgdir}/usr/bin" -m755 '{}' \;
}
