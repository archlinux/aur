# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: monson (https://aur.archlinux.org/account/monson)
# Contributor: James An (https://aur.archlinux.org/account/jamesan)

_pkgname=clover-efi
pkgname="${_pkgname}"
pkgver=5157
pkgrel=1
pkgdesc='Bootloader for macOS, Windows and Linux in UEFI and in legacy mode'
arch=(
  'x86_64'
)
url='https://github.com/CloverHackyColor/CloverBootloader'
license=('BSD')
depends=()
makedepends=()
optdepends=()
checkdepends=()
profides=()
conflicts=()
replaces=()
backup=('boot/EFI/CLOVER/config.plist')
backup=('boot/EFI/CloverV2/config.plist')
source=(
  "Clover-${pkgver}-X64.iso.7z::https://github.com/CloverHackyColor/CloverBootloader/releases/download/${pkgver}/Clover-${pkgver}-X64.iso.7z"
  #"CLOVERX64-${pkgver}.efi.zip::https://github.com/CloverHackyColor/CloverBootloader/releases/download/${pkgver}/CLOVERX64.efi.zip"
  "CloverV2-${pkgver}.zip::https://github.com/CloverHackyColor/CloverBootloader/releases/download/${pkgver}/CloverV2-${pkgver}.zip"
  "Clover-LICENSE.txt::https://raw.githubusercontent.com/CloverHackyColor/CloverBootloader/master/LICENSE"
  "80_cloverboot"
)
noextract=(
  "Clover-${pkgver}-X64.iso.7z"
  # "CLOVERX64-${pkgver}.efi.zip"
  # "CloverV2-${pkgver}.zip"
)
sha256sums=(
  'a13904da4a33fae39e5e1061df939904169db4fb29e7bc5d188caeae2fd9f50f'  # Clover-${pkgver}-X64.iso.7z
  #'32e7b36a3caa0f1161a49f7f980add0bb6656d0503d5c7f25de22065acd2296a'  # CLOVERX64-${pkgver}.efi.zip
  '30244157274ec4d4a1a49b670c8ae05c7ea0d56ba8b21c3303ac7f96f86111ac'  # CloverV2-${pkgver}.zip
  '9ad38268029f8604cdadb30d598d42f67697cddb738a962250bc966bda2edcd2'  # Clover-LICENSE.txt"
  'SKIP' #  80_cloverboot
)

prepare() {
  cd "${srcdir}"

  if [ -d EFI ]; then
    rm -rf EFI/*
    rmdir EFI
  fi

  msg2 '%s\n' "Extracting 'EFI/CLOVER' from 'Clover-$pkgver-X64.iso.7z' ..."
  bsdtar -xf "Clover-$pkgver-X64.iso.7z" -O | bsdtar -xf - 'EFI/CLOVER'
}

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/boot/EFI/CLOVER"
  install -dm755 "${pkgdir}/boot/EFI/CloverV2"

  cp -rv 'EFI/CLOVER'/* "${pkgdir}/boot/EFI/CLOVER"/
  cp -rv 'CloverV2/EFI/CLOVER'/* "${pkgdir}/boot/EFI/CloverV2"/

  install -Dvm755 -t "${pkgdir}/etc/grub.d"  "80_cloverboot"  

  if [ -e "${pkgdir}/boot/EFI/CLOVER/.DS_Store" ]; then
    rm -f "${pkgdir}/boot/EFI/CLOVER/.DS_Store"
  fi
  if [ -e "${pkgdir}/boot/EFI/CloverV2/.DS_Store" ]; then
    rm -f "${pkgdir}/boot/EFI/CloverV2/.DS_Store"
  fi

  install -Dvm644 "${srcdir}/Clover-LICENSE.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
