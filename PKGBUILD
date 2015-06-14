# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop@nuclear.lu.se>
pkgname=vmedrv
pkgver=1.2.1
pkgrel=1
pkgdesc='VME device driver for Linux 2.x & 3.x'
url="http://www.awa.tohoku.ac.jp/~sanshiro/kinoko-e/vmedrv/"
arch=('x86_64')
license=('LGPL2')
makedepends=('linux-headers')
source=("http://www.awa.tohoku.ac.jp/~sanshiro/kinoko-download/files/$pkgname-${pkgver}.tar.gz")
md5sums=('9d16b32f29388d82431951e663519f93')

build() {
  cd $srcdir/$pkgname/Linux2.6*
  if [ -d /usr/lib/modules ] ; then
    sed -i 's|/lib/modules/|/usr/lib/modules/|g' Makefile || return 1
  fi
  make
}

package() {
  _kernver=`uname -r`
  cd $srcdir/$pkgname/Linux2.6*
  if [ -d /usr/lib/modules ] ; then
    install -D -m644 ${pkgname}.ko ${pkgdir}/usr/lib/modules/${_kernver}/kernel/drivers/acpi/${pkgname}.ko
  else
    install -D -m644 ${pkgname}.ko ${pkgdir}/lib/modules/${_kernver}/kernel/drivers/acpi/${pkgname}.ko
  fi

  sed -i 's|DEVDIR=/dev|DEVDIR=${pkgdir}/dev|g' install.sh || return 1
  sed -i '37i\MAJOR=0' install.sh

  install -d ${pkgdir}/dev

  pkgdir=${pkgdir} ./install.sh $pkgname
#  make install
}
