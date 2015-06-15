#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Federico Quagliata <linux@quaqo.org>

pkgname=qkismet-svn
pkgver=60
pkgrel=2
pkgdesc="A graphical Kismet client writtent in Qt"
arch=('i686' 'x86_64')
url="http://qkismet.sourceforge.net/"
license=('GPL2')
depends=('qt4')
makedepends=('subversion')

_svntrunk=https://qkismet.svn.sourceforge.net/svnroot/qkismet/trunk
_svnmod=qkismet

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/src

  qmake-qt4
  
  make release
  
  mkdir -p $pkgdir/usr/bin/
  mv ../build/release/qkismet $pkgdir/usr/bin/
}