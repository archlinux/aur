# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=mdsplib
pkgver=0.11
pkgrel=4
pkgdesc="METAR Decoder Software Package Library"
arch=('i686' 'x86_64')
url="http://limulus.net/mdsplib/"
license=('GPL')
groups=('lib')
provides=('metar.h' 'libmetar.a')
source=(http://ftp.debian.org/debian/pool/main/libm/libmdsp/libmdsp_0.11.orig.tar.gz)
md5sums=('9d3c1cf01bca65a379c52c152d28c732')

build() {
  cd libmdsp-$pkgver.orig/src
  sed -e "s|char \*strndup(char \*, int);|/\*char \*strndup(char \*, int);\*/|" -i local.h
  cd ..
  sed -e "s|/usr/local/lib/|$pkgdir/usr/lib/|" -i Makefile
  sed -e "s|/usr/local/include/|$pkgdir/usr/include|" -i Makefile
  make CFLAGS="-fPIC $CFLAGS -Wno-format-security"
}

package() {
  cd libmdsp-$pkgver.orig
  make DESTDIR="$pkgdir/"
  install -vD metar.h -m 0644 $pkgdir/usr/include/metar.h
  install -vD libmetar.a -m 0644 $pkgdir/usr/lib/libmetar.a
  ranlib $pkgdir/usr/lib/libmetar.a
}
