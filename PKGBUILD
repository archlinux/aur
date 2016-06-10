# Contributor: Jared Casper <jaredcasper@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=geda-gaf-unstable
_pkgname=geda-gaf
pkgver=1.9.2
pkgrel=1
pkgdesc="gEDA/gaf suite - contains gschem, gnetlist, gsymcheck, gattrib, utilities and documentation from the gEDA project"
arch=('i686' 'x86_64')
url="http://www.geda-project.org/"
license=('GPL')
depends=('gtk2' 'guile' 'libstroke' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('python2: for two of the commands (garchive, tragesym)'
  'gawk: for sw2asc')
conflicts=('geda-gaf')
provides=('geda-gaf')
source=(http://ftp.geda-project.org/geda-gaf/unstable/v1.9/$pkgver/${_pkgname}-$pkgver.tar.gz)
md5sums=('ae99981f509dee0f9a6f7c7f51fcb652')

prepare() {
  cd $srcdir/${_pkgname}-$pkgver
  sed -i '30i#include <locale.h>' gaf/gaf.c
  sed -i '27i#include <locale.h>' gattrib/src/gattrib.c
  sed -i '23i#include <locale.h>' gnetlist/src/gnetlist.c
}

build () {
  cd $srcdir/${_pkgname}-$pkgver/
  CFLAGS="-DGLIB_COMPILATION" ./configure --prefix=/usr --disable-update-xdg-database 
  make 
}

package() {
  cd $srcdir/${_pkgname}-$pkgver/
  make DESTDIR=$pkgdir/ install 
  sed -i 's+/usr/bin/env python+/usr/bin/env python2+' \
    $pkgdir/usr/bin/garchive
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    $pkgdir/usr/bin/tragesym
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    $pkgdir/usr/share/doc/${_pkgname}/examples/lightning_detector/bom
}

