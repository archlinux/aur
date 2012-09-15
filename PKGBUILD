# Maintainer: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

# _GNU_EFI_LIB_DIR="/usr/lib"

_actualname="gummiboot"
_pkgname="${_actualname}-efi-x86_64"
pkgname="${_pkgname}-git"

pkgver=20120915
pkgrel=1
pkgdesc="Simple x86_64 UEFI Boot Manager for EFISTUB Kernels - GIT Development Version"
url="http://freedesktop.org/wiki/Software/gummiboot"
arch=('any')
license=('GPL2')

makedepends=('git' 'gnu-efi')

depends=('dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

backup=('boot/efi/loader/loader.conf'
        'boot/efi/loader/entries/archlinux-core.conf'
        'boot/efi/loader/entries/archlinux-core-fallback.conf')

options=('!strip' 'docs')
install="${_pkgname}.install"

source=('loader.conf'
        'archlinux-core.conf'
        'archlinux-core-fallback.conf')

sha256sums=('9f53946a3efa4005031ec9f8247a874b8857c1363a2401624e0a909436b558ed'
            '4d4a0d59ca3e7ab93428c817a04ca717e5295a1536f13649f4b4007495f3921c'
            '48b20ba6684f65c24508ab7cadd0467201de0b158514c384500b622eaa97efff')

_gitroot="git://anongit.freedesktop.org/gummiboot"
_gitname="${_actualname}"
_gitbranch="master"

_update_git() {
	
	cd "${srcdir}/"
	
	msg "Connecting to GIT server...."
	
	if [[ -d "${srcdir}/${_gitname}/" ]]; then
		cd "${srcdir}/${_gitname}/"
		git reset --hard
		git fetch
		git checkout "${_gitbranch}"
		git merge "remotes/origin/${_gitbranch}"
		msg "The local GIT repo has been updated."
	else
		git clone "${_gitroot}" "${_gitname}"
		cd "${srcdir}/${_gitname}/"
		git checkout "${_gitbranch}"
		msg "GIT checkout done or server timeout"
	fi
	
	echo
	
}

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	else
		_update_git
		echo
	fi
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build"
	echo
	
	make clean || true
	echo
	
	make
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build"
	
	## Install gummiboot x86_64 UEFI application
	install -d "${pkgdir}/boot/efi/EFI/arch/gummiboot/"
	install -D -m0644 "${srcdir}/${_gitname}_build/gummiboot.efi" "${pkgdir}/boot/efi/EFI/arch/gummiboot/gummibootx64.efi"
	
	## Install gummiboot configuration files
	install -d "${pkgdir}/boot/efi/loader/entries/"
	install -D -m0644 "${srcdir}/loader.conf" "${pkgdir}/boot/efi/loader/loader.conf"
	install -D -m0644 "${srcdir}/archlinux-core.conf" "${pkgdir}/boot/efi/loader/entries/archlinux-core.conf"
	install -D -m0644 "${srcdir}/archlinux-core-fallback.conf" "${pkgdir}/boot/efi/loader/entries/archlinux-core-fallback.conf"
	
}
