# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>

pkgname=zfsbootmenu-efi-bin
_pkgname=zfsbootmenu
pkgver=2.1.0
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems - EFI binary"
license=('MIT')
url="https://github.com/zbm-dev/${_pkgname}"
arch=('x86_64')
depends=('zfs')
optdepends=('efibootmgr' 'refind' 'syslinux' 'grub')
source=("${_pkgname}-release-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-release-$CARCH-v${pkgver}-vmlinuz.EFI"
        "${_pkgname}-recovery-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-recovery-$CARCH-v${pkgver}-vmlinuz.EFI")
sha256sums=('df99e6acc312c5d388ec4b5a49438f71fc022c61bb031e54159236ae22ab2252'
            '8d5245c6d4e568f1320902800cce2ede36fae09d353b72ef5ca3aa9b906d3eba')

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
