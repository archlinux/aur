# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
# PKGBUILD Originally by: Joan Figueras <ffigue at gmail dot com>

krnname=linux-bazzite
pkgver="6.17.5.ba11" # 6.13.7.103
fedver="6.17.5-ba11.fc43.x86_64" # 6.13.7-103-bazzite.fc41.x86_64
relver="6.17.5-ba11" # 6.13.7-103

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

sha256sums=('6ae3366e8346debb719482c0ba1c4f9ca5b274f66eaaff6e7fa61cf21280dfb0'
            '9ca4f8d6f2882cae624aad6b198eb7d1d3335ba1425f137daa688b3b8cb4a931'
            'f09da18556e8e58dc9425fcdf7da0bc656eeb6d6b8fad8dbdaa9e25d85f793b2'
            '9ed13a203f693ea66284843da4f5a916414f9c7cb5ad1e134b616835504c495e'
            'ef4335acd71f493538aad1fa1fd70daaeb13e6ca84eec2603cca95d03b7dc853'
            '0920eb3006e71796e22e5432ddf290ff6bb6d77428d6e4c90e12a2f133f4c381'
            '192db0b4c52b3146b7b29d0a17d167c9c145a3446dfe642b545eba87684d59a3')

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
