# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

_pkgname=linux-aarch64-raspberrypi
pkgname=linux-aarch64-raspberrypi-bin
pkgver=4.14.89.20181218
pkgdesc="Automated weekly build of the default branch aarch64 bcmrpi3_defconfig Linux kernel for the Raspberry Pi 3 models B/B+"
_kernver=${pkgver%.*}
pkgrel=1
arch=('aarch64')
url="https://github.com/sakaki-/bcmrpi3-kernel"
license=('GPL2')
options=('!strip')
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7' 'firmware-raspberrypi')
optdepends=('crda: to set the correct wireless channels of your country')
provides=("linux=${_kernver}")
conflicts=('linux-aarch64' 'uboot-raspberrypi')
install=${_pkgname}.install
backup=('boot/config.txt' 'boot/cmdline.txt')
source=("https://github.com/sakaki-/bcmrpi3-kernel/releases/download/${pkgver}/bcmrpi3-kernel-${pkgver}.tar.xz"
        'config.txt'
        'cmdline.txt'
        'linux.preset'
        '99-linux.hook')
sha1sums=('6004b22c5f98e652d722c256771fc86ea075a8ed'
          '472aa9e8528789f17950fb0b06de60ce3f67e4f8'
          'f55155535974425e4c1ab5869fbe86b68cdc04cb'
          '495384696eaccf1ae6894938780cf9bdf3020ef3'
          '79cd078bb327135784d21e44451fe8c212a5c5aa')

package() {
  # package the kernel files
  cp -r "${srcdir}/boot" "${pkgdir}"
  mkdir "${pkgdir}/usr" && cp -r "${srcdir}/lib" "${pkgdir}/usr"

  # build full kernel version using CONFIG_LOCALVERSION value from kernel config
  _fullkernver="${_kernver}$(source "${pkgdir}/boot/config"; echo $CONFIG_LOCALVERSION)+"

  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_pkgname#linux}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_fullkernver}/g" \
    -i "${startdir}/${_pkgname}.install"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${_pkgname}.preset"
  sed \
    -e "1s|'linux.*'|'${_pkgname}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"${_fullkernver}\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${_pkgname}.preset"

  # install pacman hook for initramfs regeneration
  sed "s|%PKGNAME%|${_pkgname}|g" "${srcdir}/99-linux.hook" |
    install -D -m644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${_pkgname}.hook"

  # install boot files
  install -m644 "${srcdir}/config.txt" "${srcdir}/cmdline.txt" "${pkgdir}/boot"
}
