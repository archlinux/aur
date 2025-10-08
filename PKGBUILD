# Maintainer: mikusiowy2
pkgname=grub-efi
pkgver=2.12
pkgrel=3
pkgdesc="Arch-based EFI boot structure using system GRUB (full module support)"
arch=('x86_64')
license=('GPL3')
depends=('grub' 'freetype2' 'efi-filesystem')
source=()
sha256sums=()

package() {
  # Utwórz katalogi
  mkdir -p "${pkgdir}/boot/efi/EFI/arch"
  mkdir -p "${pkgdir}/boot/grub/fonts"
  mkdir -p "${pkgdir}/boot/loader/entries"

  # 🔧 Pobierz wszystkie moduły z systemowego GRUB-a
  grub_modules=$(ls /usr/lib/grub/x86_64-efi/*.mod | sed 's|.*/||;s|\.mod$||' | tr '\n' ' ')

  # 🧩 Utworzenie grubx64.efi z pełnym zestawem modułów
  grub-mkimage -O x86_64-efi \
    -o "${pkgdir}/boot/efi/EFI/arch/grubx64.efi" \
    -p /grub \
    $grub_modules

  # 🔤 Skopiowanie gotowego fontu unicode.pf2
  install -Dm644 /usr/share/grub/unicode.pf2 "${pkgdir}/boot/grub/fonts/unicode.pf2"

  # 🧱 Pusty grubenv
  touch "${pkgdir}/boot/grub/grubenv"
  chmod 600 "${pkgdir}/boot/grub/grubenv"
}
