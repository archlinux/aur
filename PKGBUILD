# Maintainer: Rhys Perry <rhysperry111@gmail.com>
# Based off of: community/bbswitch

pkgname=bbswitch-zen
pkgver=0.8
pkgrel=3
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

prepare(){
  echo -e '\033[1;31mWARNING:\033[0m \033[0;33mThis package MUST be rebuilt every time you upgrade your kernel.\n         I will try to update `pkgrel` as soon as an update comes out but this might take a few hours for me to notice.\n         If you do not rebuild expect errors\033[0m\033[0m'
}

build() {
  cd bbswitch-${pkgver}
  make
}

package() {
  cd bbswitch-${pkgver}
  _kernname="$(ls -a /usr/lib/modules | grep zen$)"
  _extradir="/usr/lib/modules/${_kernname}/extramodules"
  install -Dt "${pkgdir}${_extradir}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}
