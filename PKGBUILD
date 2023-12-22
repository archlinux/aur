# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wuxb <wuxb45@gmail.com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Jed Brown <jed@59A2.org>

pkgname=papi
pkgver=7.1.0
pkgrel=1
pkgdesc="Performance Application Programming Interface"
arch=('x86_64' 'i686')
url="http://icl.cs.utk.edu/${pkgname}"
license=('BSD')
depends=('glibc' 'gcc-fortran')
source=(http://icl.cs.utk.edu/projects/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz)
sha512sums=('6ffe5f2c90bf699dcb937961ee0483e7edbb1909451d4bfcfe1949ad389b4089bbd7573b4055164fede9944d678e582c23a0cb74741c480e72e5e01b2061d0b0')

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
