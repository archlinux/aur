# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=geda-gaf
pkgver=1.10.2
pkgrel=3
pkgdesc="gEDA/gaf suite - Contains gschem, gnetlist, gsymcheck, gattrib, utilities and documentation from the gEDA project"
arch=('x86_64')
url="http://geda-project.org/"
license=('GPL')
depends=('gtk2' 'guile' 'libstroke' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('pkg-config' 'perl-xml-parser' 'flex' 'awk')
optdepends=('python2: for several of the commands (garchive, tragesym, xorn)'
            'gawk: for sw2asc'
            'imagemagick: png/pdf output'
            'graphviz: graph output')
replaces=('geda-suite' 'geda-libs')
source=(http://ftp.geda-project.org/geda-gaf/stable/v1.10/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('39377764735bd4ce5360371614541a25')
# signature was dropped in 1.10.0
validpgpkeys=('6073BA0D62E91251C421C17067B19BABB83BBE9A')

# 1.10.0 adds an optional dep on libfam/libgamin (prefers gamin?)
# why was gamin removed from the repos a few months ago?

prepare() {
  cd "$srcdir/$pkgname-$pkgver/"
  # gamin's optional-ness is overstated
  sed -i 's|^.*<fam.h>|//&|' gschem/src/gschem_change_notification.c
  sed -i 's| enum FAMCodes | int |' gschem/src/gschem_change_notification.c
  sed -e '/\-Werror=maybe-uninitialized/d' -i configure
}

build () {
  cd "$srcdir/$pkgname-$pkgver/"
  #CFLAGS+=' -Wno-deprecated-declarations'
  PYTHON=/usr/bin/python ./configure --prefix=/usr --disable-update-xdg-database --without-libfam
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
  sed -i 's+/usr/bin/env python+/usr/bin/env python2+' \
    "$pkgdir/usr/bin/garchive"
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    "$pkgdir/usr/bin/tragesym"
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    "$pkgdir/usr/share/doc/$pkgname/examples/lightning_detector/bom"
}

