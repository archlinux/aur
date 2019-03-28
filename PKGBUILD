# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgbase=bbswitch
pkgname=(bbswitch bbswitch-dkms)
pkgver=0.8
pkgrel=208
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
_extramodules=extramodules-ARCH
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

build() {
  cd ${pkgbase}-${pkgver}
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  make KDIR=/lib/modules/${_kernver}/build
}

package_bbswitch() {
  cd ${pkgbase}-${pkgver}
  install -Dt "${pkgdir}/usr/lib/modules/${_extramodules}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}

package_bbswitch-dkms() {
  depends=('dkms')
  conflicts=('bbswitch')
  provides=('bbswitch')

  cd ${pkgbase}-${pkgver}
  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile bbswitch.c dkms/dkms.conf
}
