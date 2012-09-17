# Maintainer: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

# _GNU_EFI_LIB_DIR="/usr/lib"

_actualname="shim"
_pkgname="${_actualname}-efi-x86_64"
pkgname="${_pkgname}-git"

pkgver=20120917
pkgrel=1
pkgdesc="Simple bootloader for x86_64 UEFI Secure Boot - GIT Development Version"
url="https://github.com/mjg59/shim"
arch=('any')
license=('GPL')

makedepends=('git' 'gnu-efi')

depends=('dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

# backup=()

options=('!strip' 'docs')
install="${_pkgname}.install"

# source=()

# sha256sums=()

_gitroot="git://github.com/mjg59/shim.git"
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
	
	sed 's|/usr/lib64/gnuefi|/usr/lib|g' -i "${srcdir}/${_gitname}_build/Makefile"
	sed 's|/usr/lib64|/usr/lib|g' -i "${srcdir}/${_gitname}_build/Makefile"
	echo
	
	make clean || true
	rm -f "${srcdir}/${_gitname}_build/shim.so" || true
	rm -f "${srcdir}/${_gitname}_build/shim.efi" || true
	rm -f "${srcdir}/${_gitname}_build/shim.efi.debug" || true
	echo
	
	make
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build"
	
	## Install shim x86_64 UEFI application
	install -d "${pkgdir}/boot/efi/EFI/arch/shim/"
	install -D -m0644 "${srcdir}/${_gitname}_build/shim.efi" "${pkgdir}/boot/efi/EFI/arch/shim/shimx64.efi"
	
}
