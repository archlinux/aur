# Maintainer: Ramana Kumar <firstname at member dot fsf dot org>
pkgname=polyml-svn
pkgver=2023
pkgrel=1
pkgdesc="Poly/ML implementation of Standard ML"
url="http://www.polyml.org"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gmp')
makedepends=('svn')
conflicts=(polyml)
provides=(polyml)
options=(staticlibs)
backup=()
install=
source=()
md5sums=()
_svntrunk=svn://svn.code.sf.net/p/polyml/code/fixes-5.5.2
_svnmod=polyml
build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  cd polyml
  ./configure --prefix=/usr --enable-shared
  make
  make compiler
}
package() {
  cd "$srcdir/$_svnmod-build/polyml"
  make DESTDIR=$pkgdir install
}
