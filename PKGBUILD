# Maintainer: Rhys Perry <rhysperry111@gmail.com>
# Based off of: community/bbswitch

pkgname=bbswitch-zen
pkgver=0.8
pkgrel=12
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
provides=('bbswitch')
conflicts=('bbswitch-dkms' 'bbswitch-git-dkms')
depends=('linux-zen')
makedepends=('linux-zen-headers')
source=("bbswitch-${pkgver}.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')
_verstring="$(pacman -Qi linux-zen | grep Version | tr -s " " | cut -d ' ' -f3)"
_kernname="$(echo ${_verstring} | cut -d '.' -f1)"."$(echo ${_verstring} | cut -d '.' -f2)"."$(echo ${_verstring} | cut -d '.' -f3)"-"$(echo ${_verstring} | cut -d '.' -f4)"-zen

prepare(){
  echo -e '\033[1;31mWARNING:\033[0m \033[0;33mThis package MUST be rebuilt every time you upgrade your kernel.\n         I will try to update `pkgrel` as soon as an update comes out but this might take a few hours for me to notice.\n         If you do not rebuild expect errors\033[0m\033[0m'
}

build() {
  cd bbswitch-${pkgver}
  make -C /usr/lib/modules/${_kernname}/build M=$(pwd) modules
}

package() {
  cd bbswitch-${pkgver}
  _extradir="/usr/lib/modules/${_kernname}/extramodules"
  install -Dt "${pkgdir}${_extradir}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}
