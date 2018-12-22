# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Base Package Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch-pf
_pkgname=bbswitch
_godver=4.19
_badver=4.20
pkgver=0.8
_extramodules=extramodules-$_godver-pf # Don't forget to update bbswitch.install
pkgrel=71
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
depends=("linux-pf>=$_godver" "linux-pf<$_badver")
makedepends=("linux-pf-headers")
source=(git+https://github.com/Bumblebee-Project/bbswitch.git
       'linux_4.17_vgaswitch.patch')
md5sums=('SKIP'
         'b0a672ecba5dadf7922a363a7a9960ba')

prepare()
{
  cd ${srcdir}/${_pkgname}
#  patch -p1 -i "$srcdir"/linux_4.17_vgaswitch.patch
}

build() {
  cd ${srcdir}/${_pkgname}

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

  make KDIR=/lib/modules/${_kernver}/build
}

package() {
  cd ${srcdir}/${_pkgname}
   
  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"                      
}
