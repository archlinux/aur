# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
# PKGBUILD Originally by: Joan Figueras <ffigue at gmail dot com>

krnname=linux-bazzite
pkgver="6.13.7.106" # 6.13.7.103
fedver="6.13.7-106.bazzite.fc41.x86_64" # 6.13.7-103-bazzite.fc41.x86_64
relver="6.13.7-106" # 6.13.7-103

pkgname=${krnname}-bin
pkgrel=1
pkgdesc='The Linux kernel and modules of Bazzite, prebuilt by Bazzite.'
url="https://github.com/bazzite-org/kernel-bazzite"
arch=(x86_64)
license=(GPL2)
options=('!strip')
depends=(coreutils kmod initramfs)
optdepends=('crda: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
provides=(${krnname}
          VIRTUALBOX-GUEST-MODULES
          WIREGUARD-MODULE
          KSMBD-MODULE
          NTFS3-MODULE)
conflicts=(${krnname})
source=("${url}/releases/download/${relver}/kernel-core-${fedver}.rpm"
        "${url}/releases/download/${relver}/kernel-modules-${fedver}.rpm"
        "${url}/releases/download/${relver}/kernel-modules-core-${fedver}.rpm"
        "${url}/releases/download/${relver}/kernel-modules-extra-${fedver}.rpm"
        "${url}/releases/download/${relver}/kernel-modules-internal-${fedver}.rpm"
        "${url}/releases/download/${relver}/kernel-devel-${fedver}.rpm")
#        "kernel-uki-virt-${pkgver}-${extras}.x86_64.rpm")

sha256sums=('12842ff89758e74ffb4a2c11afc9608f927c966c32ade601faf2f4a48d2e7a0b'
            'd169f2c4c0f4a2daf697b8cda9b48174b8a842bf35fb2ffefb9b3358b8498aea'
            '429f5dcdec03c71899da021edc3188f975f461f742bfc2911687d239136632fe'
            '7ddc38a4a176cbe2996a79b0f42022d5ba2460531241288c51e27edb62c9b904'
            '6c34f413d93b36975f765e6a1f31e4aa4167749aec088f6a6c7f454cf0c64592'
            '19085e4da8233a3035fb668eee1773e556a678ff0b8085b806896e831dcfe28c')

package() {
  local srcmodulesdir="${srcdir}/lib/modules/${fedver}"
  local modulesdir="${pkgdir}/usr/lib/modules/${fedver}"
  mkdir -p "${modulesdir}"

  msg2 "Installing modules..."
  cp -r ${srcmodulesdir} "${pkgdir}/usr/lib/modules"
  cp -r "${srcdir}/usr" "${pkgdir}/"

  # Used by dmks
  rm -fv "${pkgdir}"/usr/lib/modules/${fedver}/build
  mv -v "${pkgdir}"/usr/src/kernels/${fedver} "${pkgdir}"/usr/lib/modules/${fedver}/build
  rmdir -v "${pkgdir}"/usr/src/kernels
  cd "${pkgdir}"/usr/lib/modules/${fedver}
  ln -sr "${pkgdir}"/usr/lib/modules/${fedver}/build "$pkgdir/usr/src/$krnname"

  # Perms
  chmod 644 "${pkgdir}"/usr/lib/modules/${fedver}/vmlinuz

  # Used by mkinitcpio to name the kernel
  echo "${krnname}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"
}

# vim:set ts=8 sts=2 sw=2 et:
