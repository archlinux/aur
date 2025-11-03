# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
# PKGBUILD Originally by: Joan Figueras <ffigue at gmail dot com>

krnname=linux-bazzite
pkgver="6.17.7.ba02" # 6.13.7.103
fedver="6.17.7-ba02.fc43.x86_64" # 6.13.7-103-bazzite.fc41.x86_64
relver="6.17.7-ba02" # 6.13.7-103

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

sha256sums=('ac7db61c1c5589af7801b4c19c0dcc1e010b1b069546e01c57b7c38a08497c60'
            '2a09a82e9435b2334c6841564724685db28d60d6c5db31bbb2ae5fe74a9d5295'
            '27900ddfd81af796e0586c8e45fd92ff4e52837b61487b5de5d2c8ee803e8a14'
            '8644ba39f9556e8a911435b8f3f0a1366ffd9fa2632bfa9cf8f520690445a93e'
            '57b6dad376fc8a552fc08132f044098e567ec20537dca0e9adfb37e3f8cf3133'
            '6a08326288a5ba82d3f07c247fbbb0235ef01851bf9ed575f24654dbcd50c30d'
            'f31771c9dfb755f32964b82f3bb32e4732ade43416b49b48badf7468f68aecba')

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
