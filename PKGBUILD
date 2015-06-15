#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Aurélien DESBRIÈRES <ice.cube@gmx.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>
# Contributor: Iven Day <ivenvd@gmail.com>

pkgname=akamaru-svn
pkgver=r1218
pkgrel=2
pkgdesc="A simple, but fun, physics engine prototype"
arch=('i686' 'x86_64')
url="http://www.kiba-dock.org/"
license=('GPL')
depends=('glib2')
makedepends=('subversion' 'pkgconfig' 'intltool' 'sed')
conflicts=('akamaru')
provides=('akamaru')
source=(svn://svn.code.sf.net/p/kibadock/code/trunk)
sha512sums=('SKIP')

_svnmod=akamaru

pkgver() {
  cd trunk/$_svnmod
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $srcdir
  mv ./trunk/* ./
  rm -r trunk
  cd akamaru
  mv configure.in configure.ac
  sed -i 's#AC_SUBST("$AKAMARU_REQUIRES")#AC_SUBST(AKAMARU_REQUIRES)#' configure.ac
  sed -i 's#AM_CONFIG_HEADER#AC_CONFIG_HEADER#' configure.ac
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_svnmod
  
  make DESTDIR=$pkgdir install
  
  install -D -m644 COPYING $pkgdir/usr/share/licenses/custom/akamaru-svn/LICENSE
}
