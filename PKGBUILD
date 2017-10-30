# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgbase=bbswitch
pkgname=(bbswitch bbswitch-dkms)
pkgver=0.8
_extramodules=extramodules-4.13-ARCH # Don't forget to update bbswitch.install
pkgrel=82
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
makedepends=('linux-headers>=4.13' 'linux-headers<4.14' 'linux>=4.13' 'linux<4.14')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

build() {
  cd ${srcdir}/${pkgbase}-${pkgver}

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

  make KDIR=/lib/modules/${_kernver}/build
}

package_bbswitch() {
  depends=('linux>=4.13' 'linux<4.14')
  install=bbswitch.install

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"
}

package_bbswitch-dkms() {
  depends=('dkms')
  conflicts=('bbswitch')
  provides=('bbswitch')

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -dm755 "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

  install -Dm644 Makefile bbswitch.c dkms/dkms.conf "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
}
