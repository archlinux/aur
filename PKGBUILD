# $Id: PKGBUILD 196308 2016-11-18 14:24:11Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: James Cozine <jmcozine@gmail.com>

pkgname="emacs-w3m-cvs"
pkgver=20140530
pkgrel=2
pkgdesc="w3m browser for Emacs (cvs)"
arch=('any')
url="http://emacs-w3m.namazu.org/"
license=('GPL')
depends=('emacs' 'w3m')
makedepends=('cvs' 'autoconf')
provides=('emacs-w3m')
conflicts=('emacs-w3m')
install="emacs-w3m-cvs.install"

_cvsroot=":pserver:anonymous:@cvs.namazu.org:/storage/cvsroot"
_cvsmod="emacs-w3m"

prepare() {
  cd "$srcdir"
  if [ -d ${_cvsmod}/CVS ]; then
	  cd ${_cvsmod}
  else
	  cvs -z3 -d $_cvsroot co -D $pkgver -f ${_cvsmod}
	  cd ${_cvsmod}
  fi
  sed -i 's|1234|123456|' aclocal.m4
  autoconf
}

build() {
  cd "$srcdir"

  cp -r ${_cvsmod} ${_cvsmod}-build
  cd ${_cvsmod}-build

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${_cvsmod}-build
  make prefix="$pkgdir/usr" install
}
