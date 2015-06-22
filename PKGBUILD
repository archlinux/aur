# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

_realname=wiic
pkgname=$_realname-svn
pkgver=90 
pkgrel=2
pkgdesc="WiiC is a C/C++ library that manages Wii devices. It supports Wiimote, Nunchuck, Classic, Guitar Hero 3, Motion Plus, and Balance Board."
arch=('any')
url="http://sourceforge.net/projects/wiic/"
license=('GPL3')
conflicts=('wiic')
provides=('wiic')
depends=('bluez' 'opencv')
makedepends=('cmake' 'svn')

source=(  "wiic::svn+https://wiic.svn.sourceforge.net/svnroot/wiic/src/"
          "usleep.patch")
sha256sums=( 'SKIP'
             'b025fd075b63f8d5cc6f3903d700f3fecd26ab317626b06749181488a16d1695')

pkgver() {
  cd $_realname
  svnversion | tr -d [A-z]
}

build() {
  cd $_realname
  patch -p0 < ../../usleep.patch
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $_realname
  make DESTDIR=$pkgdir install
  mv $pkgdir/usr/local/* $pkgdir/usr
  rm $pkgdir/usr/local/ -R
}
