# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Base Package Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

_pkgname=bbswitch
pkgname=${_pkgname}-pf
pkgver=0.8
_godver=5.7
_extramodules=extramodules-$_godver-pf # Don't forget to update bbswitch.install
pkgrel=102
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
depends=("linux-pf")
makedepends=("linux-pf-headers")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz"
        '0001-proc_ops-struct.patch'
        '0002-kernel-5.7.patch')
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807'
         '2777876d45c986119286acffb18c58a7'
         'f44b74fcaa331b68d0f347fdc991b1d7')

prepare()
{
  cd ${_pkgname}-${pkgver}
  patch -p1 -i "$srcdir"/0001-proc_ops-struct.patch
  patch -p1 -i "$srcdir"/0002-kernel-5.7.patch
}

build() {
  cd ${_pkgname}-${pkgver}

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

  make KDIR=/lib/modules/${_kernver}/build
}

package() {
  cd ${_pkgname}-${pkgver}
  _extradir="/usr/lib/modules/$_extramodules"
  install -Dt "${pkgdir}${_extradir}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec strip --strip-debug {} +
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}
