# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Hybner <dta081@gmail.com>

pkgname=libosip2-3xx
epoch=1
pkgver=3.3.0
pkgrel=1
pkgdesc="an implementation of SIP"
arch=('x86_64' 'i686')
url="http://www.gnu.org/software/osip/"
license=('LGPL')
depends=(glibc)
conflicts=(libosip2)
provides=(libosip2)
options=(!emptydirs)
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')
source=(https://ftp.gnu.org/gnu/osip/libosip2-${pkgver/_/-}.tar.gz)
b2sums=('ae157f088d53617c5fc356a8e932e18c8ecbd864d2004823b3d615ab72eb88ec12d6af5d42ca10f7967be2c49878441b922a366c855c68929a1f90aedbc37092')

build() {
  cd "$srcdir"/libosip2-${pkgver/_/-}/
  # Fight unused direct deps
  export CXXFLAGS='-fpermissive -Wno-all'
  export CFLAGS="${CXXFLAGS/-fpermissive/}"
  env CXXFLAGS="$CXXFLAGS" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  env CXXFLAGS="$CXXFLAGS" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    make
}

package() {
  cd "$srcdir"/libosip2-${pkgver/_/-}/
  env make DESTDIR="$pkgdir" install
}
