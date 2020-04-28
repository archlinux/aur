# Maintainer: veox <veox plus packages at veox dot net>
# Contributor: Kyle Keen <keenerd at gmail dor com>
# Contributor: Jared Casper <jaredcasper at gmail dor com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=geda-gaf-git
_gitname=geda-gaf
pkgver=7663.2d9b2c8e8
pkgrel=2
pkgdesc="gEDA/gaf suite - Contains gschem, gnetlist, gsymcheck, gattrib, utilities and documentation from the gEDA project (latest git revision)"
arch=('i686' 'x86_64')
url="http://www.geda-project.org/"
license=('GPL')
depends=('gtk2' 'guile' 'guile2.0' 'libstroke' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('pkg-config' 'perl-xml-parser' 'flex' 'gawk' 'python2')
optdepends=('python2: for several of the commands (garchive, tragesym, xorn)'
            'gawk: for sw2asc'
            'imagemagick: png/pdf output'
            'graphviz: graph output')
provides=('geda-gaf')
conflicts=('geda-gaf')
source=('git://git.geda-project.org/geda-gaf.git')
md5sums=('SKIP')

# 1.10.0 adds an optional dep on libfam/libgamin (prefers gamin?)
# why was gamin removed from the repos a few months ago?

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/${_gitname}"
  # gamin's optional-ness is overstated
  sed -i 's|^.*<fam.h>|//&|' gschem/src/gschem_change_notification.c
  sed -i 's| enum FAMCodes | int |' gschem/src/gschem_change_notification.c
}

build () {
  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  ./configure --prefix=/usr --disable-update-xdg-database --without-libfam

  make
}

package () {
  cd "$srcdir/${_gitname}"
  make DESTDIR="$pkgdir/" install 
  sed -i 's+/usr/bin/env python+/usr/bin/env python2+' \
    "$pkgdir/usr/bin/garchive"
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    "$pkgdir/usr/bin/tragesym"
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    "$pkgdir/usr/share/doc/${_gitname}/examples/lightning_detector/bom"
}
