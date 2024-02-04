# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>

pkgname=zfsbootmenu-efi-bin
_pkgname=zfsbootmenu
pkgver=2.3.0
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems - EFI binary"
license=('MIT')
url="https://github.com/zbm-dev/${_pkgname}"
arch=('x86_64')
depends=('zfs')
optdepends=('efibootmgr' 'refind' 'syslinux' 'grub')
source=("${_pkgname}-release-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-release-$CARCH-v${pkgver}-vmlinuz.EFI"
        "${_pkgname}-recovery-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-recovery-$CARCH-v${pkgver}-vmlinuz.EFI")
sha512sums=('15c7935f1733da12b99996ad10e34635bb141f459487c1cdafd38ce625bc91e75dda34e2247a467c1b231b1cc75e00b83c3be049a3dd5ee9d84a888f7d98aa7a'
            '41e852c08f5e74668c3a4a839fc48f02b16dcc5446d51b1c64e95e2a1001bd0bd29ece736ea5777ea5f2d2de117dc14d00ebf4fc24e584f8b9d21c346172e82e')

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
