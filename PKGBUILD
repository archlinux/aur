# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
# PKGBUILD Originally by: Joan Figueras <ffigue at gmail dot com>

krnname=linux-bazzite
pkgver="6.17.7.ba19" # 6.13.7.103
fedver="6.17.7-ba19.fc43.x86_64" # 6.13.7-103-bazzite.fc41.x86_64
relver="6.17.7-ba19" # 6.13.7-103

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
        "${url}/releases/download/${relver}/kernel-modules-akmods-${fedver}.rpm"
        "${url}/releases/download/${relver}/kernel-modules-internal-${fedver}.rpm"
        "${url}/releases/download/${relver}/kernel-devel-${fedver}.rpm")
#        "kernel-uki-virt-${pkgver}-${extras}.x86_64.rpm")

sha256sums=('cf499ead1d66dd2daf3d913a408e8578b26f32162ca9448bfdf274363124ae63'
            'a9621292e07a51ca98d84bf5363e0d5312c512897fbcc53e77e86fc8a5a7e9f5'
            'd93c022e709378cc7d09b91a4b61fae8a2bf4360dcdaabf54cff75a32709ede3'
            'fc625fcc97fcb22fb6c80913ba16c158066255b50a5b3361edda5a2986e62ad6'
            '0777367fed9999a01546c83079695f89685db04d2ad67c60dca8a0c394f2342d'
            '411e09523da32530694f0999703d060f520389ca5c85c6eeeec82dfcef7b302f'
            '9e45db8e0f6f7c27b2cfe0e289fe8019fad9980c5dd671a9cd95905903416c16')

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
