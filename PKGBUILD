# Contributor: rabyte <rabyte__gmail>

pkgname=karmen-svn
pkgver=386
pkgrel=1
pkgdesc="An easy-to-use window manager of simple design"
arch=('i686' 'x86_64')
url="http://karmen.sourceforge.net/"
license=('MIT')
depends=('libsm' 'libx11')
makedepends=('svn' 'autoconf' 'automake')
provides=('karmen')
conflicts=('karmen')
source=()
md5sums=()

_svntrunk=http://karmen.svn.sourceforge.net/svnroot/karmen/trunk
_svnmod=karmen

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn up -r $pkgver
    cd ..
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_svnmod-build
  cp -rf $_svnmod $_svnmod-build
  cd $_svnmod-build

  autoreconf -i
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
  
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
