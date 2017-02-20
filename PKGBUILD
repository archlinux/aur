# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>
pkgname=scsi_debug
pkgver=4.9.9
pkgrel=1
pkgdesc="Kernel module for emulating SCSI devices"
arch=('any')
url="https://www.kernel.org/"
license=('GPL2')
provides=($pkgname)
depends=("linux=${pkgver}")
makedepends=(linux-headers)
install=${pkgname}.install

tarball="linux-${pkgver}.tar.xz"
moddir="usr/lib/modules/extramodules-${pkgver%.*}-ARCH/"

source=("$tarball::https://cdn.kernel.org/pub/linux/kernel/v4.x/$tarball"
        config.diff)
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/linux-$pkgver"
  make mrproper
  cp /usr/lib/modules/`uname -r`/build/.config ./
  cp /usr/lib/modules/`uname -r`/build/Module.symvers ./
  patch -p1 <"$srcdir/config.diff"
  make prepare
  make scripts
}

build() {
  cd "$srcdir/linux-$pkgver"
  make M=drivers/scsi
}

package() {
  cd "$srcdir/linux-$pkgver"
  mkdir -p "$pkgdir/$moddir"
  cp "drivers/scsi/scsi_debug.ko" "$pkgdir/$moddir"
}

# vim:set ts=2 sw=2 et:
