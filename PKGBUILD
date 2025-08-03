# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
# PKGBUILD Originally by: Joan Figueras <ffigue at gmail dot com>

krnname=linux-bazzite
pkgver="6.15.9.102" # 6.13.7.103
fedver="6.15.9-102.bazzite.fc42.x86_64" # 6.13.7-103-bazzite.fc41.x86_64
relver="6.15.9-102" # 6.13.7-103

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

sha256sums=('e7b040d8bb9649f0bb0dc00c2a8d3af68505fb3a3931a17e7c18d3538e23fcb2'
            '758d88b96ef4d9cf186d15706b08b6b5e55614d3b5f5dd75746fed630f3a0408'
            '14377a69bff76d108f522a2d5c924b205f3f767a3c3b8a6f4f7ea0848ac5b9d2'
            '8e40189c28e00791fa41b7b3c3a9490e316e7a8c812d7943f553e89ec9bea6bd'
            '74c969a615ccabf2fc12cabf3af156bda5652877738f8ac3905e0123ee6bfcec'
            '18cfd23ea7e5fa1b9404ba2e42f585c690ef5ed844ae164af9f456daf364d01f')

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
