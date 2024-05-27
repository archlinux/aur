# Maintainer:  dreick
# Contributor: Ismael Castiñeira (https://aur.archlinux.org/account/bibaheu)

_pkgbasename=plop-bootmanager
_pkgmajorver=6
_pkgmbrreleasedate=20240301
_pkgefireleasedate=20230206
if [ "${_pkgefireleasedate}" -ge "${_pkgmbrreleasedate}" ]; then
  _pkgreleasedate="${_pkgefireleasedate}"
else
  _pkgreleasedate="${_pkgmbrreleasedate}"
fi
_pkgname="${_pkgbasename}-${_pkgmajorver}"
pkgname="${_pkgname}-bin"
epoch=0
pkgver="${_pkgmajorver}.${_pkgreleasedate}"
pkgrel=1
pkgdesc="EFI and BIOS Bootloaders that can also boot CDROM images and others."
arch=(
  'i686'
  'x86_64'
)
url="https://www.plop.at/en/pbm6/index.html"
license=(
  'custom:freeware noncommercial'
  'custom:GNU-EFI-BSD'
  'custom:Boost Software License 1.0'
)
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=(
  "grub: To add ${_pkgname} to the GRUB boot menu."
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
  "${_pkgname}-mbr=${pkgver}"
  "${_pkgname}-efi=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-doc"
  "${_pkgname}-mbr"
  "${_pkgname}-efi"
)
replaces=()
backup=()
options=()
source=(
  "pbm${_pkgmajorver}-mbr-${_pkgmbrreleasedate}.zip::https://download.plop.at/pbm${_pkgmajorver}/pbm${_pkgmajorver}-${_pkgmbrreleasedate}.zip"
  "pbm${_pkgmajorver}-efi-${_pkgefireleasedate}.zip::https://download.plop.at/pbm${_pkgmajorver}/pbm${_pkgmajorver}-efi-${_pkgefireleasedate}.zip"
  "pbm${_pkgmajorver}-mbr-${_pkgmbrreleasedate}.html::https://www.plop.at/en/pbm6/bios.html"
  "pbm${_pkgmajorver}-efi-${_pkgefireleasedate}.html::https://www.plop.at/en/pbm6/efi.html"
  "pbm${_pkgmajorver}-blog-${_pkgreleasedate}.html::https://www.plop.at/en/pbm6/blog.html"
  "80_plop6boot"
)
sha256sums=(
  '21aef43be45bc8e0f0fcbc29c02ba962ec139921921d3c38b2ebd8ab23b92ddc'  # MBR bootloader ZIP
  '211be9374482bc82aa5b2c50df3f00460f36f2e6b54ca9c260faf908d4423a49'  # EFI bootloader ZIP
  'afeab673953b2835542b7a9d6e8c8304cd24b232336241ee407cb53d9159d04a'  # bios.html
  '79872af6bd4ec11843a39520f305ac69ab1db807096d18745cdd95e739efeefb'  # efi.html
  'SKIP'                                                              # blog.html
  '1d69a6eb72d761848de1e8e953590a2765657f20e9ca0c5215342c7a35e81412'  # Grub config file
)
noextract=()
validpgpkeys=()


package() {
  install -Dvm755 -t "${pkgdir}/etc/grub.d" "${srcdir}/80_plop6boot"
  install -dvm755 "${pkgdir}/boot/plop"
  cp -rv "pbm${_pkgmajorver}-${_pkgmbrreleasedate}/1_native"/* "${pkgdir}/boot/plop"/

  install -dvm755 "${pkgdir}/boot/EFI/plop"
  for _efifile in pbm6.cfg pbm6-efi.iso README.txt; do
    install -Dvm644 -t "${pkgdir}/boot/EFI/plop" "${srcdir}/pbm${_pkgmajorver}-efi-${_pkgefireleasedate}/${_efifile}"
  done
  for _efiexecutable in pbm6-x64.efi; do
    install -Dvm755 -t "${pkgdir}/boot/EFI/plop" "${srcdir}/pbm${_pkgmajorver}-efi-${_pkgefireleasedate}/${_efiexecutable}"
  done

  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}"

  install -Dvm644 "${srcdir}/pbm${_pkgmajorver}-mbr-${_pkgmbrreleasedate}.html"            "${pkgdir}/usr/share/doc/${_pkgname}/doc/bios.html"
  install -Dvm644 "${srcdir}/pbm${_pkgmajorver}-efi-${_pkgefireleasedate}.html"            "${pkgdir}/usr/share/doc/${_pkgname}/doc/efi.html"
  install -Dvm644 "${srcdir}/pbm${_pkgmajorver}-blog-${_pkgreleasedate}.html"           "${pkgdir}/usr/share/doc/${_pkgname}/doc/blog.html"

  install -Dvm644 "${srcdir}/pbm${_pkgmajorver}-${_pkgmbrreleasedate}/1_native/README.txt" "${pkgdir}/usr/share/doc/${_pkgname}/README_MBR.txt"
  install -Dvm644 "${srcdir}/pbm${_pkgmajorver}-efi-${_pkgefireleasedate}/README.txt"      "${pkgdir}/usr/share/doc/${_pkgname}/README_EFI.txt"
  install -Dvm644 "${srcdir}/pbm${_pkgmajorver}-efi-${_pkgefireleasedate}/AUTHOR"          "${pkgdir}/usr/share/doc/${_pkgname}/AUTHOR.txt"

  install -Dvm644 "${srcdir}/pbm${_pkgmajorver}-${_pkgmbrreleasedate}/LICENCE.txt"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_PlopBootManager6.txt"
  install -Dvm644 "${srcdir}/pbm${_pkgmajorver}-efi-${_pkgefireleasedate}/LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GNU-EFI-and-fonts.txt"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_PlopBootManager6.txt"  "${pkgdir}/usr/share/doc/${_pkgname}"/
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GNU-EFI-and-fonts.txt" "${pkgdir}/usr/share/doc/${_pkgname}"/

}
