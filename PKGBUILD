# Maintainer: Guillaume Binet <gbin@gootz.net>

pkgname=refindplus-bin
pkgver=0.14.2.AE
pkgrel=5
pkgdesc='A fork of rEFInd with additional Mac and UEFI-PC functionality (upstream x64 binary)'
arch=('x86_64')
url='https://github.com/RefindPlusRepo/RefindPlus'
license=(
  'BSD-2-Clause'
  'CC-BY-SA-3.0'
  'CC-BY-SA-4.0'
  'GPL-2.0-only'
  'GPL-2.0-or-later'
  'GPL-3.0-or-later'
  'LGPL-3.0-or-later'
)
depends=('bash')
optdepends=(
  'efibootmgr: register RefindPlus as a UEFI boot entry with refindplus-install --register'
  'sbsigntools: sign EFI binaries for Secure Boot'
)
provides=("refindplus=${pkgver}")
conflicts=('refindplus')
options=('!strip')

_release_archive='x64-RefindPlus_001402-AE.zip'
_release_dir='x64-RefindPlus_001402-AE'
_source_dir="RefindPlus-${pkgver}"

source=(
  "${_release_archive}::${url}/releases/download/v${pkgver}/${_release_archive}"
  "RefindPlus-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'refindplus-install'
)
sha256sums=(
  'd60e6157fa1d7bdb7e14ffafa77b2cd8f99c5ded8b08b1732d6b5f4913d4ee89'
  'bcf0a843c1c7593361f3d67736dcfd89c001a93009ea5949073082febd85642c'
  '5f894b5806a09e278530d593202f00ae38e397d8531eb20abf4c244f19848807'
)

package() {
  local boot_tree="${pkgdir}/usr/share/refindplus"
  local source_asset

  install -dm755 \
    "${boot_tree}" \
    "${boot_tree}/drivers_x64" \
    "${boot_tree}/tools" \
    "${pkgdir}/usr/bin"

  install -Dm644 "${_release_dir}/x64_RefindPlus_REL.efi" "${boot_tree}/x64_RefindPlus_REL.efi"
  install -Dm644 "${_release_dir}/x64_RefindPlus_DBG.efi" "${boot_tree}/x64_RefindPlus_DBG.efi"
  install -Dm644 "${_release_dir}/config.conf" "${boot_tree}/config.conf"
  install -Dm644 "${_source_dir}/config.conf-sample" "${boot_tree}/config.conf-sample"
  install -Dm644 "${_source_dir}/config.conf-sample-Dev" "${boot_tree}/config.conf-sample-Dev"

  install -Dm644 "${_release_dir}/OtherBinaries/Drivers/"*.efi -t "${boot_tree}/drivers_x64/"
  install -Dm644 "${_release_dir}/OtherBinaries/Tools/"*.efi -t "${boot_tree}/tools/"

  while IFS= read -r -d '' source_asset; do
    install -Dm644 "${source_asset}" "${boot_tree}/${source_asset#"${_source_dir}/"}"
  done < <(
    find \
      "${_source_dir}/icons" \
      "${_source_dir}/fonts" \
      "${_source_dir}/banners/png" \
      "${_source_dir}/keys" \
      -type f -print0
  )

  install -Dm755 refindplus-install "${pkgdir}/usr/bin/refindplus-install"

  install -Dm644 "${_release_dir}/ReadMe.html" "${pkgdir}/usr/share/doc/${pkgname}/ReadMe.html"
  install -Dm644 "${_release_dir}/INFO.txt" "${pkgdir}/usr/share/doc/${pkgname}/INFO.txt"
  install -Dm644 "${_source_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_source_dir}/BADRAM.md" "${pkgdir}/usr/share/doc/${pkgname}/BADRAM.md"
  install -Dm644 "${_source_dir}/CHANGELOG.txt" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.txt"
  install -Dm644 "${_source_dir}/CREDITS.txt" "${pkgdir}/usr/share/doc/${pkgname}/CREDITS.txt"
  install -Dm644 "${_source_dir}/fonts/README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.fonts.txt"
  install -Dm644 "${_source_dir}/icons/README" "${pkgdir}/usr/share/doc/${pkgname}/README.icons.txt"
  install -Dm644 "${_source_dir}/keys/README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.keys.txt"

  install -Dm644 "${_release_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${_source_dir}/filesystems/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.filesystems.txt"
  install -Dm644 "${_source_dir}/filesystems/LICENSE_GPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.filesystems-gpl.txt"
  install -Dm644 "${_source_dir}/icons/licenses/"* -t "${pkgdir}/usr/share/licenses/${pkgname}/icons/"
}
