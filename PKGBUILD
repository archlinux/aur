# Maintainer: Kaan Genç <aur@kaangenc.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch-grsec
_pkgname=bbswitch
pkgver=0.8
_extramodules=extramodules-4.2.3-grsec
pkgrel=3
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-grsec"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux-grsec>=4.2.3' 'linux-grsec<4.3')
makedepends=('linux-grsec-headers>=4.2.3' 'linux-grsec-headers<4.3')
install=bbswitch-grsec.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  make KDIR=/lib/modules/${_kernver}/build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  
  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/bbswitch-grsec.install"
}
