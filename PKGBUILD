# $Id$
# Maintainer: Tom Alexandrowicz <tom@alexandrowicz.ca>
pkgname='iguanair'
pkgver=e0cb127
pkgrel=1
pkgdesc="user mode daemon driver for IguanaIR devices"
arch=('i686' 'x86_64')
url="https://github.com/iguanaworks/iguanair-lirc"
license=('GPL2')
depends=('lirc')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/iguanaworks/iguanair")
md5sums=('SKIP')

pkgver() {
  git -C $srcdir/$pkgname rev-parse --short HEAD
}
build() {
  cd $srcdir/$pkgname/software/usb_ir/
  cmake .
  make iguanaIR
}
package() {
  install=iguanair.install

  cd $srcdir/$pkgname/software/usb_ir/
  make DESTDIR=$pkgdir install
  mv $pkgdir/lib/* $pkgdir/usr/lib
  rm -rf $pkgdir/lib
  mv $pkgdir/etc/default $pkgdir/etc/iguanair
  mv $pkgdir/etc/iguanair/iguanaIR $pkgdir/etc/iguanair/iguanair
  mkdir -p $pkgdir/usr/lib/systemd/system/
  cp $startdir/iguanair.service $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/var/log/iguanaIR/
}
