# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman-svn
pkgver=81738
pkgrel=2
pkgdesc="Enlightenment ConnMan user interface"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python2-elementary' 'python2-e_dbus' 'python2-edje' 'python2-ecore' 'connman')
makedepends=('subversion')
install=econnman.install
#options=('!libtool' '!emptydirs')
         
_svntrunk="http://svn.enlightenment.org/svn/e/trunk/econnman"
_svnmod="econnman"

build() {
  cd "$srcdir"

  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g' econnman-bin.in
  
  sed -i '/python-elementary/d' configure.ac

  PYTHON=python2 \
  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install

  rm -r "$srcdir/$_svnmod-build"
}
