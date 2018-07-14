# Maintainer: James An <james@jamesan.ca>

pkgname=apple_set_os
pkgver=1.r6.g7b6fa20
pkgrel=2
pkgdesc='Tiny EFI program for unlocking the Intel integrated graphics device on the Macbook Pro 11,3'
arch=('i686' 'x86_64')
url="https://github.com/0xbb/$pkgname.efi"
license=('MIT')
makedepends=('git' 'gnu-efi-libs')
optdepends=(
  'efibootmgr: manage UEFI boot entries'
  'grub: boot loader capable of UEFI chainloading'
  'refind-efi: boot loader capable of UEFI chainloading'
  'systemd: has boot loader capable of UEFI chainloading'
)
source=(
  "$pkgname"::"git+https://github.com/rudis/$pkgname.efi.git"
)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm644 "$pkgname.efi" "$pkgdir/boot/EFI/tools/$pkgname.efi"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
