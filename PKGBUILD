# Maintainer: AoiNyanko <AoiNyanko@outlook.jp>, Hanahime King <hanahimeking@gmail.com>

pkgname=shim-msft2023sig
pkgver=16.1
pkgrel=7
_fedora_pkgrel=7
_fedora_pkg="shim-x64-${pkgver}-${_fedora_pkgrel}.x86_64.rpm"
pkgdesc='Fedora-signed x64 shim with Microsoft UEFI CA 2023 signature support'
arch=('x86_64')
url='https://github.com/rhboot/shim/'
license=('BSD-3-Clause')
makedepends=('rpmextract')
optdepends=(
  'shim-msft2023sig-helper: deploy shim to an ESP safely'
  'sbsigntools: inspect Authenticode signatures with sbverify'
  'binutils: inspect SBAT sections with objdump'
  'mokutil: inspect Secure Boot and MOK state'
)
install='shim-msft2023sig.install'
source_x86_64=("${_fedora_pkg}::https://mirror.de.leaseweb.net/fedora/development/rawhide/Everything/x86_64/os/Packages/s/${_fedora_pkg}")
# TODO before AUR upload: run `updpkgsums` on an Arch host with network access.
# Keeping SKIP here makes the first draft buildable, but AUR release should pin the real SHA-256.
sha256sums_x86_64=('04b7132d6316bff71427120b6aba85eb4490b2621ccb2f2559bd321ccb25f028')

package() {
  cd "${srcdir}"
  rm -rf usr
  rpmextract.sh "${_fedora_pkg}"

  local dest="${pkgdir}/usr/share/${pkgname}/${pkgver}-${pkgrel}"
  install -d "${dest}"

  install -Dm0644 "usr/lib/efi/shim/${pkgver}-${pkgrel}/EFI/fedora/shimx64.efi" "${dest}/shimx64.efi"
  install -Dm0644 "usr/lib/efi/shim/${pkgver}-${pkgrel}/EFI/fedora/shim.efi" "${dest}/shim.efi"
  install -Dm0644 "usr/lib/efi/shim/${pkgver}-${pkgrel}/EFI/fedora/mmx64.efi" "${dest}/mmx64.efi"
  install -Dm0644 "usr/lib/efi/shim/${pkgver}-${pkgrel}/EFI/BOOT/fbx64.efi" "${dest}/fbx64.efi"
  install -Dm0644 "usr/lib/efi/shim/${pkgver}-${pkgrel}/EFI/BOOT/BOOTX64.EFI" "${dest}/BOOTX64.EFI"
  install -Dm0644 "usr/lib/efi/shim/${pkgver}-${pkgrel}/EFI/fedora/BOOTX64.CSV" "${dest}/BOOTX64.CSV"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cat > "${pkgdir}/usr/share/doc/${pkgname}/README.md" <<README
# shim-msft2023sig

This package redistributes Fedora's Microsoft-signed x64 shim binaries under:

\`/usr/share/shim-msft2023sig/${pkgver}-${pkgrel}/\`

It intentionally does not modify the EFI System Partition.

Suggested validation after install:

\`\`\`bash
sbverify --list /usr/share/shim-msft2023sig/current/shimx64.efi
objdump -s -j .sbat /usr/share/shim-msft2023sig/current/shimx64.efi
\`\`\`

Deploy manually or install \`shim-msft2023sig-helper\` and run:

\`\`\`bash
sudo shim-msft2023sig-install --esp /boot/efi --target arch
\`\`\`
README

  ln -sfn "${pkgver}-${pkgrel}" "${pkgdir}/usr/share/${pkgname}/current"
}
