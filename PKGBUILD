# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wuxb <wuxb45@gmail.com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Jed Brown <jed@59A2.org>

pkgname=papi
pkgver=7.0.0
pkgrel=1
pkgdesc="Performance Application Programming Interface"
arch=('x86_64' 'i686')
url="http://icl.cs.utk.edu/${pkgname}"
license=('BSD')
depends=('glibc' 'gcc-fortran')
source=(http://icl.cs.utk.edu/projects/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz)
sha512sums=('4c5d5eef5c89e72c41fa44eb384e66a615957ac6cbc56c9f80bdca297589808ead854389b4414f14c157d5ff5b70001126c3ba33aba0557277a801e49ef44403')

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
