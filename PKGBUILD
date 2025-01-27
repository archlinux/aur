# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>

pkgname=zfsbootmenu-efi-bin
_pkgname=zfsbootmenu
_binkernelver="6.12.11_1"
pkgver=3.0.0
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems - EFI binary"
license=('MIT')
url="https://github.com/zbm-dev/${_pkgname}"
arch=('x86_64')
depends=('zfs')
optdepends=('efibootmgr' 'refind' 'syslinux' 'grub')
source=("${_pkgname}-release-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-release-$CARCH-v${pkgver}-vmlinuz-${_binkernelver}.EFI"
        "${_pkgname}-recovery-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-recovery-$CARCH-v${pkgver}-vmlinuz-${_binkernelver}.EFI")
sha512sums=('f1596d663bd1943b2e4ce89a2d3bc2a84d08f14f8320ad0bba4b93aafd85191289c85986751c9b5aae7966333e0845fba9faf4ec984b8bf8d7eb9cf2ba9cf1e4'
            '5bc44381c998f8ca9b5fa49931591aadcafb6312aea52ffd1c355184cbb4c6afb21196f1a95b0e372c3614fbcf0ac3c2d8f82dd690af9621d188460f3ccede6a')

package() {
        efimounts=$(lsblk -lno mountpoint --filter 'PARTTYPENAME=="EFI System"')
        
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
