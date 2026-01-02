# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>

pkgname=zfsbootmenu-efi-bin
_pkgname=zfsbootmenu
_binkernelver="6.18"
pkgver=3.1.0
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems - EFI binary"
license=('MIT')
url="https://github.com/zbm-dev/${_pkgname}"
arch=('x86_64')
depends=('zfs')
optdepends=('efibootmgr' 'refind' 'syslinux' 'grub')
source=("${_pkgname}-release-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-release-$CARCH-v${pkgver}-linux${_binkernelver}.EFI"
        "${_pkgname}-recovery-vmlinuz-$CARCH.EFI::${url}/releases/download/v${pkgver}/${_pkgname}-recovery-$CARCH-v${pkgver}-linux${_binkernelver}.EFI")
sha256sums=('0a2a192de90be4935c21a810f9e5281f0cbf625a76b2d6e9125c39c13becfe83'
            '06c3c9409fa92b26e45c88f3bb4a35a544e6ef19ca76513b04d1494320eafc05')

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
		install -Dm 644 "${srcdir}/${_pkgname}-release-vmlinuz-$CARCH.EFI" "$pkgdir$dir/zbm/${_pkgname}-release-vmlinuz-$CARCH.EFI"
		install -Dm 644 "${srcdir}/${_pkgname}-recovery-vmlinuz-$CARCH.EFI" "$pkgdir$dir/zbm/${_pkgname}-recovery-vmlinuz-$CARCH.EFI"
	done
}
