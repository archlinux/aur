# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=holyspirit-svn
pkgver=2357
pkgrel=1
pkgdesc="Diablo clone"
arch=(i686 x86_64)
url="http://www.holyspirit.fr/"
license=('GPL')
depends=('sfml')
makedepends=('subversion')
provides=('holyspirit')
conflicts=('holyspirit')
install=holyspirit.install
source=(holyspirit.sh)
md5sums=('d78610c419dc689d41c2e85ce72516d4')

_svntrunk=https://lechemindeladam.svn.sourceforge.net/svnroot/lechemindeladam/trunk
_svnmod=holyspirit

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
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  cd Source
  mkdir build && cd build
  cmake -DSFML_STATIC_LIBRARIES=FALSE ..
  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  mv Source/build/Holyspirit .
  mkdir -p $pkgdir/opt/holyspirit
  cp -r * $pkgdir/opt/holyspirit/
  
  install -Dm755 $srcdir/holyspirit.sh $pkgdir/usr/bin/holyspirit

  chown -R root:games $pkgdir/opt/holyspirit
}

# vim:set ts=2 sw=2 et:
