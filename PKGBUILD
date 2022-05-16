# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: wuxb <wuxb45@gmail.com>
# Contributor: jedbrown

pkgname=papi
pkgver=6.0.0.1
pkgrel=2
pkgdesc="Performance Application Programming Interface"
arch=('x86_64' 'i686')
url="http://icl.cs.utk.edu/papi/"
license=('BSD')
depends=('glibc' 'gcc-fortran')
source=(
  http://icl.cs.utk.edu/projects/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz
  0000-pfm4-fix-a-false-alarm-to-make-gcc12-happy.patch
  )
sha256sums=(
  '3cd7ed50c65b0d21d66e46d0ba34cd171178af4bbf9d94e693915c1aca1e287f'
  'cd365fb40adbdc7bb3eeed499f486e05054e35cadc5822875b2069a244b409fb'
  )
conflicts=('libpfm4')

prepare() {
  patch "${srcdir}/${pkgname}-${pkgver}/src/libpfm4/lib/pfmlib_perf_event_pmu.c" ${source[1]}
}

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

check(){
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
