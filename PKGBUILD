# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=gadap
pkgver=2.0
pkgrel=2
pkgdesc="OPeNDAP access of in situ data." 
arch=("i686" "x86_64")
url="http://www.iges.org/grads/gadoc/supplibs.html"
depends=('libdap')
options=('staticlibs')
license=('custom')
source=(ftp://cola.gmu.edu/grads/Supplibs/2.1/src/${pkgname}-${pkgver}.tar.gz
        libdap-conf.patch
        libdap-namespace.patch
        test-errors.patch
        pkg-config.patch)
md5sums=('16cfb95bfe14b17c9cb417c5149deefc'
         '9975884b3e84c32bb3413d0ffe71b797'
         '966b08788bd1cc8318e8c75c472e4897'
         '202fc565ed5e842530c42681f4ebf095'
         'cf1a7feea0678440543fcabe348f1209')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i ${srcdir}/libdap-conf.patch
  patch -p1 -i ${srcdir}/libdap-namespace.patch
  patch -p1 -i ${srcdir}/test-errors.patch
  rm -f gadap.pc.in
  patch -p1 -i ${srcdir}/pkg-config.patch
  ./configure --prefix=/usr 
  make
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/COPYRIGHT \
	  ${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT
  rm -f ${pkgdir}/usr/bin/test
}
