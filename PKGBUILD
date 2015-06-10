# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=libnsbmp-svn
pkgver=14008
pkgrel=1
pkgdesc='Library for decoding BMP and ICO image formats'
arch=('x86_64' 'i686')
url="http://www.netsurf-browser.org/projects/libnsbmp/"
license=('MIT')
provides=('libnsbmp')
makedepends=('subversion' 'netsurf-buildsystem-git')
_svntrunk=svn://svn.netsurf-browser.org/trunk/libnsbmp
_svnmod=libnsbmp

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  cd "$_svnmod"

  make PREFIX=/usr COMPONENT_TYPE="lib-shared"
  make PREFIX=/usr COMPONENT_TYPE="lib-static"
}

package() {
  cd "$srcdir/$_svnmod"

  make install PREFIX=/usr DESTDIR="$pkgdir" COMPONENT_TYPE="lib-shared"   
  make install PREFIX=/usr DESTDIR="$pkgdir" COMPONENT_TYPE="lib-static"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
