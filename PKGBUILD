# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wuxb <wuxb45@gmail.com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Jed Brown <jed@59A2.org>

pkgname=papi
pkgver=7.0.1
pkgrel=1
pkgdesc="Performance Application Programming Interface"
arch=('x86_64' 'i686')
url="http://icl.cs.utk.edu/${pkgname}"
license=('BSD')
depends=('glibc' 'gcc-fortran')
source=(http://icl.cs.utk.edu/projects/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1d4ed80998e67f5c2f22057a8ab45598153ebe8ceca84a662686234cd0e0d015c353e7801915ec6b5c1c98d5c8ec38bca012d4094257bb80463cff9fe9523406')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  export CFLAGS="-fPIC ${CFLAGS}"
  ./configure \
    --prefix=/usr \
    --with-static-lib=yes --with-shared-lib=yes \
    --mandir=/usr/share/man \
    --with-perf-events

  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  mkdir -p $pkgdir/usr/bin
  make DESTDIR="${pkgdir}" install

  chmod 644 $pkgdir/usr/share/papi/papi_events.csv

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
