# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=libnsgif-svn
pkgver=12168
pkgrel=1
pkgdesc="A library for decoding the GIF image format"
arch=('x86_64' 'i686')
url="http://www.netsurf-browser.org/projects/libnsgif/"
license=('MIT')
makedepends=('subversion')
provides=('libnsgif')
_svntrunk=svn://svn.netsurf-browser.org/trunk/libnsgif
_svnmod=libnsgif

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cd $_svnmod

  CFLAGS="$CFLAGS -fno-strict-aliasing" 
  make PREFIX=/usr COMPONENT_TYPE="lib-shared" 
  make PREFIX=/usr COMPONENT_TYPE="lib-static"
}

package() {
  cd $_svnmod

  make install PREFIX=/usr DESTDIR="${pkgdir}" COMPONENT_TYPE="lib-shared"   
  make install PREFIX=/usr DESTDIR="${pkgdir}" COMPONENT_TYPE="lib-static"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
