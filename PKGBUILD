# Maintainer: David Runge <dave@sleepmap.de>

pkgname=vhba-module-rt
_basename=vhba-module
pkgver=20140928
_extramodules=extramodules-4.0-rt
pkgrel=11
pkgdesc="Kernel module that emulates SCSI devices. For linux-rt"
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL')
depends=('linux-rt>=4.0' 'linux-rt<4.1' 'vhba-module')
makedepends=('linux-rt-headers>=4.0' 'linux-rt-headers<4.1')
options=(!makeflags)
install=$pkgname.install
source=("http://downloads.sourceforge.net/cdemu/${_basename}-$pkgver.tar.bz2")
md5sums=('967007230bb028424216d9b35da422c0')

prepare() {
  cd ${_basename}-$pkgver
}

build() {
  cd ${_basename}-$pkgver
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  make KDIR=/usr/lib/modules/$_kernver/build
}

package() {
  cd ${_basename}-$pkgver
  install -Dm644 vhba.ko "$pkgdir/usr/lib/modules/$_extramodules/vhba.ko"
  cd $startdir
  cp -f $install ${install}.pkg
  true && install=${install}.pkg
  sed -i "s/EXTRAMODULES=.*/EXTRAMODULES=$_extramodules/" $install
}

# vim:set ts=2 sw=2 et:
