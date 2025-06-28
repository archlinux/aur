# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: monson (https://aur.archlinux.org/account/monson)
# Contributor: James An (https://aur.archlinux.org/account/jamesan)

_pkgname=clover-efi
pkgname="${_pkgname}"
pkgver=5162
pkgrel=1
pkgdesc='Bootloader for macOS, Windows and Linux in UEFI and in legacy mode'
arch=(
  'x86_64'
)
url='https://github.com/CloverHackyColor/CloverBootloader'
license=('BSD-2-Clause')
depends=(
  'bash'
)
makedepends=()
optdepends=()
checkdepends=()
profides=()
conflicts=()
replaces=()
backup=('boot/EFI/CLOVER/config.plist')
source=(
  "Clover-${pkgver}-X64.iso.7z::https://github.com/CloverHackyColor/CloverBootloader/releases/download/${pkgver}/Clover-${pkgver}-X64.iso.7z"
  "Clover-LICENSE.txt::https://raw.githubusercontent.com/CloverHackyColor/CloverBootloader/master/LICENSE"
  "80_cloverboot"
)
noextract=(
  "Clover-${pkgver}-X64.iso.7z"  # We are going to manually extract some file from the iso.7z.
)
sha256sums=(
  'f8c46fc7471b4e9f67e8cb6b24d4caac38691366f34fccc8a9d55a380e23fd64'  # Clover-${pkgver}-X64.iso.7z
  '9ad38268029f8604cdadb30d598d42f67697cddb738a962250bc966bda2edcd2'  # Clover-LICENSE.txt"
  '2729e87d17f1c467f7589b0f3dc8b246efccfdb8224c87a1cd81e1abc3dd53b1'  #  80_cloverboot
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

  install -dvm755 "${pkgdir}/boot/EFI/CLOVER"

  cp -rv 'EFI/CLOVER'/* "${pkgdir}/boot/EFI/CLOVER"/

  install -Dvm755 -t "${pkgdir}/etc/grub.d"  "80_cloverboot"  

  if [ -e "${pkgdir}/boot/EFI/CLOVER/.DS_Store" ]; then
    rm -f "${pkgdir}/boot/EFI/CLOVER/.DS_Store"
  fi

  install -Dvm644 "${srcdir}/Clover-LICENSE.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
