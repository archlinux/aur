# Contributor: royrocks <royrocks13@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tuxpaint-stamps-cvs
pkgver=20170209
pkgrel=1
arch=('any')
pkgdesc="Additional stamps for Tux Paint, cvs version"
url="http://www.newbreedsoftware.com/tuxpaint/"
license=('GPL')
provides=('tuxpaint-stamps')
conflicts=('tuxpaint-stamps')
makedepends=('cvs')
_cvsroot=":pserver:anonymous@tuxpaint.cvs.sourceforge.net:/cvsroot/tuxpaint"
_cvsmod="tuxpaint-stamps"

pkgver() {
  cd $srcdir
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d$_cvsroot co -P $_cvsmod
    cd $_cvsmod
  fi
  printf "%s" $(cvs -d$_cvsroot -q log | grep '^date:' | sort | tail -n 1 | cut -d ' ' -f 2 | tr -d '/')
}

build() {
  cd $srcdir/$_cvsmod
  make PREFIX=/usr
}

package() {
  cd $srcdir/$_cvsmod
  make DATA_PREFIX=$pkgdir/usr/share/tuxpaint/ install-all
} 
