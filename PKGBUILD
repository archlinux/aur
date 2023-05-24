# Maintainer: Fabrizio del Tin <fdt@euniversity.pub>
pkgname=rtl8852cu-git
_pkgbase=rtl8852cu
_pkgver="1.0.0"
pkgver=1.0.0.3.a246437
pkgrel=1
pkgdesc="Linux Driver for USB WiFi Adapters that use the RTL8852CU and RTL8832CU Chipsets"
arch=('x86_64')
url="https://github.com/lwfinger/rtw8852cu"
license=('GPL2')
depends=('linux-headers' 'git')
makedepends=('git' 'make' 'linux-headers')
conflicts=("${_pkgbase}" "${_pkgbase}-dkms-git")
source=("git+https://github.com/lwfinger/rtw8852cu.git"
        "$pkgname.install")
install=$pkgname.install
sha256sums=('SKIP'
            'd2cb3097b37379c34a483b6a91517c18d8eaf95db8a50418310648dd43040f82')
procs_num=$(nproc)

pkgver() {
   cd ${srcdir}/rtw8852cu
   printf '%s' ${_pkgver} "." "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/rtw8852cu
  if [ ${CARCH} == "armv7h" ]; then
     ARCH="arm"
  else
     ARCH=${CARCH}
  fi
  make ARCH=$ARCH -j$procs_num
}

package(){
  cd ${srcdir}/rtw8852cu
  mkdir -p "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/"
  install -Dm664 "${srcdir}/rtw8852cu/8852cu.ko" "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/" 
}
