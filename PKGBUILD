# Maintainer: 7Ji <pugokughin@gmail.com>

_desc="flippy's AArch64-focused fork aiming to increase usability. Prebuilt by ophub."
_pkgver_main=6.1.5
_pkgver_suffix=happy-new-year
_pkgver_uname="${_pkgver_main}-${_pkgver_suffix}"
_url_repo="https://github.com/ophub/kernel"
_url_raw="${_url_repo}/raw/main/pub/stable/${_pkgver_main}"
_pkgbase=linux-aarch64-flippy

pkgbase="${_pkgbase}-bin"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-headers"
  "${pkgbase}-dtb-allwinner"
  "${pkgbase}-dtb-amlogic"
  "${pkgbase}-dtb-rockchip"
)
pkgver="${_pkgver_main}"
pkgrel=1
arch=('aarch64')
url="${_url_repo}"
license=('GPL2')
options=(!strip)
source=(
  "${_url_raw}/boot-${_pkgver_uname}.tar.gz"
  "${_url_raw}/dtb-allwinner-${_pkgver_uname}.tar.gz"
  "${_url_raw}/dtb-amlogic-${_pkgver_uname}.tar.gz"
  "${_url_raw}/dtb-rockchip-${_pkgver_uname}.tar.gz"
  "${_url_raw}/header-${_pkgver_uname}.tar.gz"
  "${_url_raw}/modules-${_pkgver_uname}.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=(
  '557954b3d6ad5ba99fd51c7a18350adddf415c6eae7ee9e67d48c9a943c4e85c'
  'bbcb8ae7a9714b665bb31349778589ea4518b162dcb6b513ed13d05c1c8d6168'
  'e78bd8f6aed0c41303c69c59eacfba241dfe474a6e169faecf54400ae0526104'
  'a3f5c09bfe86a178bbe9470daf99c07d9b12ff1566936e19a7cc12a1f525301a'
  'f282ab01559afc24e125381f8fc6426fb0527e25ddb51b90f2e76abc847a696b'
  '608c1d9b4bff5bb9797394c26b1adc63c595e54db941ce8791b6e93b1b4c674a'
)

_dtb_common_pkg="${_pkgbase}-dtb"

package_linux-aarch64-flippy-bin() {
  pkgdesc="The Linux Kernel and module - ${_desc}"
  depends=(
    "${_dtb_common_pkg}"
    'coreutils'
    'initramfs'
    'kmod'
  )
  optdepends=(
    'uboot-legacy-initrd-hooks: to generate uboot legacy initrd images'
    'linux-firmware-amlogic-ophub: firmware for Amlogic SoCs'
    'wireless-regdb: to set the correct wireless channels of your country'
    "${_pkgbase}-dtb-allwinner: dtbs for Allwinner SoCs"
    "${_pkgbase}-dtb-amlogic: dtbs for Amlogic SoCs"
    "${_pkgbase}-dtb-rockchip: dtbs for Rockchip SoCs"
  )
  provides=(
    "${_pkgbase}=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}"
  )
  backup=(
    "etc/mkinitcpio.d/${_pkgbase}.preset"
  )

  # Install modules
  install -d -m 755 "${pkgdir}/usr/lib/modules"
  tar -C "${pkgdir}/usr/lib/modules" -xvzf "${srcdir}/modules-${_pkgver_uname}.tar.gz"

  # Install pkgbase
  local _dir_module="${pkgdir}/usr/lib/modules/${_pkgver_uname}"
    echo "${_pkgbase}" | install -D -m 644 /dev/stdin "${_dir_module}/pkgbase"

  # Install kernel itself
  local _vmlinuz="vmlinuz-${_pkgver_uname}"
  tar -C "${_dir_module}" -xvzf "${srcdir}/boot-${_pkgver_uname}.tar.gz" "${_vmlinuz}"
  mv -v "${_dir_module}/${_vmlinuz}" "${_dir_module}/vmlinuz"

  # Remove non-standard folders
  rm -f "${pkgdir}/usr/lib/modules/${_pkgver_uname}/"{build,source}

  # install mkinitcpio preset file
  sed "s|%PKGBASE%|${_pkgbase}|g" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${_pkgbase}.preset"
}

package_linux-aarch64-flippy-bin-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - ${_desc}"
  provides=(
    "${_pkgbase}-headers=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}-headers"
  )
  install -d -m 755 "${pkgdir}/usr/lib/modules/${_pkgver_uname}/build"
  tar -C "${pkgdir}/usr/lib/modules/${_pkgver_uname}/build" -xvzf "${srcdir}/header-${_pkgver_uname}.tar.gz"
  install -d -m 755 "${pkgdir}/usr/src"
  ln -sf "../lib/modules/${_pkgver_uname}/build" "${pkgdir}/usr/src/${_pkgbase}"
}

_dtb_common_provides="${_dtb_common_pkg}=${pkgver}"

package_linux-aarch64-flippy-bin-dtb-allwinner() {
  pkgdesc="DTB files for Allwinner SoCs for flippy's AArch64 kernel"
  provides=(
    "${_dtb_common_provides}"
    "${_pkgbase}-dtb-allwinner=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}-dtb-allwinner"
  )
  install -d -m 755 "${pkgdir}/boot/dtbs/${_pkgbase}/allwinner"
  tar -C "${pkgdir}/boot/dtbs/${_pkgbase}/allwinner" -xvzf "${srcdir}/dtb-allwinner-${_pkgver_uname}.tar.gz"
}

package_linux-aarch64-flippy-bin-dtb-amlogic() {
  pkgdesc="DTB files for Amlogic SoCs for flippy's AArch64 kernel"
  provides=(
    "${_dtb_common_provides}"
    "${_pkgbase}-dtb-amlogic=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}-dtb-amlogic"
  )
  install -d -m 755 "${pkgdir}/boot/dtbs/${_pkgbase}/amlogic"
  tar -C "${pkgdir}/boot/dtbs/${_pkgbase}/amlogic" -xvzf "${srcdir}/dtb-amlogic-${_pkgver_uname}.tar.gz"
}

package_linux-aarch64-flippy-bin-dtb-rockchip() {
  pkgdesc="DTB files for Rockchip SoCs for flippy's AArch64 kernel"
  provides=(
    "${_dtb_common_provides}"
    "${_pkgbase}-dtb-rockchip=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}-dtb-rockchip"
  )
  install -d -m 755 "${pkgdir}/boot/dtbs/${_pkgbase}/rockchip"
  tar -C "${pkgdir}/boot/dtbs/${_pkgbase}/rockchip" -xvzf "${srcdir}/dtb-rockchip-${_pkgver_uname}.tar.gz"
}