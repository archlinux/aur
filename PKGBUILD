# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>

pkgname=zfsbootmenu-efi-bin
_pkgname=zfsbootmenu
pkgver=2.0.0
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems - EFI binary"
license=('MIT')
url="https://github.com/zbm-dev/${_pkgname}"
arch=('x86_64')
depends=('zfs')
optdepends=('efibootmgr' 'refind' 'syslinux' 'grub')
source=("${_pkgname}-release-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-release-vmlinuz-$CARCH-v${pkgver}.EFI"
        "${_pkgname}-recovery-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-recovery-vmlinuz-$CARCH-v${pkgver}.EFI")
sha256sums=('ce035bd5f2313b41cc7c6fcfe8f4b21293e6988bf391bbd0fd6e4b1256cb606c'
            'e13244739e28eb041116e636734cb64d9fd2c6b66d118ca7275441251e839d65')

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
