# $Id$
# Maintainer: Tom Alexandrowicz <tom@alexandrowicz.ca>
pkgname='iguanair-lirc'
pkgver=e0cb127_e23b9d3
pkgrel=2
pkgdesc="LIRC driver for IguanaIR devices"
arch=('i686' 'x86_64')
url="https://github.com/iguanaworks/iguanair-lirc"
license=('GPL2')
depends=('lirc' 'iguanair')
makedepends=('git' 'cmake')
source=("iguanair::git+https://github.com/iguanaworks/iguanair" 
        "$pkgname::git+https://github.com/iguanaworks/iguanair-lirc.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  echo $(git -C $srcdir/iguanair rev-parse --short HEAD)_$(git -C $srcdir/$pkgname rev-parse --short HEAD)
}
build() {
  cd $srcdir/iguanair/software/usb_ir
  cmake .
  make iguanaIR

  cd $srcdir/$pkgname
  patch -p0 < $startdir/Makefile.patch
  make IGUANADIR="$srcdir/iguanair/software/usb_ir"
}
package() {
  cd $pkgname
  mkdir -p "$pkgdir$(pkg-config --variable=plugindir lirc-driver)"
  mkdir -p "$pkgdir$(pkg-config --variable=configdir lirc-driver)"
  mkdir -p "$pkgdir$(pkg-config --variable=plugindocs lirc-driver)"
  mkdir -p "$pkgdir/etc/modprobe.d"
  make PKGDIR="$pkgdir" install
}
