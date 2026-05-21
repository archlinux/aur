# Maintainer: AoiNyanko <AoiNyanko@outlook.jp>, Hanahime King <hanahimeking@gmail.com>

pkgname=shim-msft2023sig
pkgver=16.1+fedora+7
pkgrel=1
_shimver="${pkgver%%+fedora+*}"
_fedora_pkgrel="${pkgver##*+fedora+}" 
pkgdesc='Fedora Rawhide-signed x64 and aa64 shim with Microsoft UEFI CA 2023 signature support'
url='https://github.com/rhboot/shim/'
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
options=('!strip' '!debug')
install="${pkgname}.install"
makedepends=('rpmextract')
optdepends=(
  'shim-msft2023sig-helper: deploy shim to an ESP safely'
  'sbsigntools: inspect Authenticode signatures with sbverify'
  'binutils: inspect SBAT sections with objdump'
  'mokutil: inspect Secure Boot and MOK state'
)

source_x86_64=(
  "shim-x64-${_shimver}-${_fedora_pkgrel}.x86_64.rpm::https://download.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/s/shim-x64-${_shimver}-${_fedora_pkgrel}.x86_64.rpm"
)
source_aarch64=(
  "shim-aa64-${_shimver}-${_fedora_pkgrel}.aarch64.rpm::https://download.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/aarch64/os/Packages/s/shim-aa64-${_shimver}-${_fedora_pkgrel}.aarch64.rpm"
)

sha256sums_x86_64=('04b7132d6316bff71427120b6aba85eb4490b2621ccb2f2559bd321ccb25f028')
sha256sums_aarch64=('33758c9391c0ea1cada0a4d2ad04ecf76506b7a820fc87d56dc7a4c75f1ca0f0')

package() {
  local verdir="${_shimver}-${_fedora_pkgrel}"
  local srcroot="${srcdir}/usr/lib/efi/shim/${verdir}"
  local dest="${pkgdir}/usr/share/${pkgname}/${verdir}"

  install -dm0755 "${dest}"

  if [[ "${CARCH}" == "x86_64" ]]; then
    install -Dm0644 "${srcroot}/EFI/fedora/shimx64.efi" "${dest}/shimx64.efi"
    install -Dm0644 "${srcroot}/EFI/fedora/shim.efi"    "${dest}/shim.efi"
    install -Dm0644 "${srcroot}/EFI/fedora/mmx64.efi"   "${dest}/mmx64.efi"
    install -Dm0644 "${srcroot}/EFI/BOOT/fbx64.efi"     "${dest}/fbx64.efi"
    install -Dm0644 "${srcroot}/EFI/BOOT/BOOTX64.EFI"   "${dest}/BOOTX64.EFI"
    install -Dm0644 "${srcroot}/EFI/fedora/BOOTX64.CSV" "${dest}/BOOTX64.CSV"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    install -Dm0644 "${srcroot}/EFI/fedora/shimaa64.efi" "${dest}/shimaa64.efi"
    install -Dm0644 "${srcroot}/EFI/fedora/shim.efi"     "${dest}/shim.efi"
    install -Dm0644 "${srcroot}/EFI/fedora/mmaa64.efi"   "${dest}/mmaa64.efi"
    install -Dm0644 "${srcroot}/EFI/BOOT/fbaa64.efi"     "${dest}/fbaa64.efi"
    install -Dm0644 "${srcroot}/EFI/BOOT/BOOTAA64.EFI"   "${dest}/BOOTAA64.EFI"
    install -Dm0644 "${srcroot}/EFI/fedora/BOOTAA64.CSV" "${dest}/BOOTAA64.CSV"
  fi

  ln -s "${verdir}" "${pkgdir}/usr/share/${pkgname}/current"

  install -dm0755 "${pkgdir}/usr/share/doc/${pkgname}"
  cat > "${pkgdir}/usr/share/doc/${pkgname}/README.md" <<README
# shim-msft2023sig

This package redistributes Fedora-signed shim EFI binaries.

It does not modify the EFI System Partition.

Installed files:

- /usr/share/${pkgname}/${verdir}/
- /usr/share/${pkgname}/current

Supported Arch Linux package architectures:

- x86_64
- aarch64

Suggested verification:

\`\`\`bash
sbverify --list /usr/share/${pkgname}/current/shim*.efi
objdump -s -j .sbat /usr/share/${pkgname}/current/shim*.efi
\`\`\`
README
}
