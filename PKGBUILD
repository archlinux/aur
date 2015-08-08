# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: jedbrown

pkgname=papi
pkgver=5.4.1
pkgrel=2
pkgdesc="Performance Application Programming Interface"
arch=('x86_64' 'i686')
url="http://icl.cs.utk.edu/papi/"
license=('BSD')
depends=('glibc' 'gcc-fortran')
source=(http://icl.cs.utk.edu/projects/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e131c1449786fe870322a949e44f974a5963824f683232e653fb570cc65d4e87')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  ./configure \
    --prefix=/usr \
    --with-static-lib=no --with-shared-lib=yes \
    --mandir=/usr/share/man \
    --with-perf-events

  make
}

#check(){
#  cd "${srcdir}/${pkgname}-${pkgver}/src"
#
#  make test
#  #make fulltest
#}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  # To avoid some (ignored) errors in make install
  export LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

  make DESTDIR="${pkgdir}" install

  chmod 644 $pkgdir/usr/share/papi/papi_events.csv

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
