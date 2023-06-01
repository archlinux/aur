# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>

pkgname=zfsbootmenu-efi-bin
_pkgname=zfsbootmenu
pkgver=2.2.0
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems - EFI binary"
license=('MIT')
url="https://github.com/zbm-dev/${_pkgname}"
arch=('x86_64')
depends=('zfs')
optdepends=('efibootmgr' 'refind' 'syslinux' 'grub')
source=("${_pkgname}-release-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-release-$CARCH-v${pkgver}-vmlinuz.EFI"
        "${_pkgname}-recovery-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-recovery-$CARCH-v${pkgver}-vmlinuz.EFI")
sha256sums=('8fa860a58d197a8cb48c618ffda9420b0786c5d67bc66b7e02a28cd27c2fdf2c'
            '31ee31edc4e648ac7bcc07195928111a8962ad3f9827fdf7fd78d530616f1ee7')

package() {
        efimounts=$(lsblk -rno parttypename,mountpoint | awk -e '/EFI\\x20\(FAT-12\/16\/32\)|EFI\\x20System/ {print $2}' | tr -s '\n')
        
        if [ -z "${efimounts-}" ]; then
           echo "No ESP found, you must have a EFI partition mounted. Exiting...."
           exit 1
        fi

        efidirs=$(for mount in $efimounts; do find $mount -type d -name "EFI"; done)

        if [ -z "${efidirs-}" ]; then
           efidirs=()
           for mount in ${efimounts}; do
        	   efidirs+=("$mount/EFI")
           done
        fi
       
        for dir in ${efidirs}; do
          install -Dm 644 ${srcdir}/${_pkgname}-release-vmlinuz-$CARCH.EFI "$pkgdir$dir/zbm/${_pkgname}-release-vmlinuz-$CARCH.EFI"
          install -Dm 644 ${srcdir}/${_pkgname}-recovery-vmlinuz-$CARCH.EFI "$pkgdir$dir/zbm/${_pkgname}-recovery-vmlinuz-$CARCH.EFI"
        done
}
