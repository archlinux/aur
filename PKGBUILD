# Maintainer: Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_gitroot="git://github.com/mjg59/shim.git"
_gitname="shim"
_gitbranch="master"

_pkgname="shim-efi-x86_64"
pkgname="${_pkgname}-git"

pkgver=0.4.1.g23002e8.23002e8
pkgrel=1
pkgdesc="Simple bootloader for x86_64 UEFI Secure Boot - GIT Version"
url="https://github.com/mjg59/shim"
arch=('any')
license=('GPL')

makedepends=('git' 'gnu-efi-libs')

depends=('pesign' 'dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

options=('!strip' 'docs')
install="${_pkgname}.install"

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags).$(git describe --always)" | sed 's|-|.|g'
}

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	fi
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	git clean -x -d -f
	echo
	
	sed 's|/usr/lib64/gnuefi|/usr/lib|g' -i "${srcdir}/${_gitname}_build/Makefile"
	sed 's|/usr/lib64|/usr/lib|g' -i "${srcdir}/${_gitname}_build/Makefile"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build"
	
	## Install shim x86_64 UEFI application
	install -d "${pkgdir}/usr/lib/shim/"
	install -D -m0644 "${srcdir}/${_gitname}_build/shim.efi" "${pkgdir}/usr/lib/shim/shimx64.efi"
	
}
