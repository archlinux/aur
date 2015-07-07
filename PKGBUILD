# Maintainer: David Runge <dave@sleepmap.de>

pkgname=bbswitch-rt
_basename=bbswitch
pkgver=0.8
_extramodules=extramodules-4.0-rt
pkgrel=5
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-rt"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux-rt>=4.0' 'linux-rt<4.1')
makedepends=('linux-rt-headers>=4.0' 'linux-rt-headers<4.1')
install=${pkgname}.install
source=("https://github.com/Bumblebee-Project/${_basename}/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

build() {
  cd ${srcdir}/${_basename}-${pkgver}
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  make KDIR=/lib/modules/${_kernver}/build
}

package() {
  cd ${srcdir}/${_basename}-${pkgver}
  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"
  cd $startdir
  cp -f $install ${install}.pkg
  true && install=${install}.pkg
  sed -i "s/EXTRAMODULES=.*/EXTRAMODULES=$_extramodules/" $install
}

# vim:set ts=2 sw=2 et:
