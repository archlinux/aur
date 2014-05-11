# Maintainer: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_gitroot="https://github.com/mjg59/shim.git"
_gitname="shim"
_gitbranch="master"

_pkgname="shim-efi"
pkgname="${_pkgname}-git"

pkgver=0.7.25.g5103c3b
pkgrel=1
pkgdesc="Simple bootloader for x86_64 UEFI Secure Boot - GIT Version"
url="https://github.com/mjg59/shim"
arch=('x86_64')
license=('GPL')
options=('!strip')

makedepends=('git' 'gnu-efi-libs')
depends=('pesign' 'dosfstools' 'efivar' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}" 'shim-efi-x86_64' 'shim-efi-x86_64-git')
provides=("${_pkgname}=${pkgver}" "shim-efi-x86_64=${pkgver}" "shim-efi-x86_64-git=${pkgver}")

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags)" | sed -e 's|-|.|g'
}

build() {
	
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
	install -D -m0644 "${srcdir}/${_gitname}_build/MokManager.efi.signed" "${pkgdir}/usr/lib/shim/MokManager.efi.signed"
	install -D -m0644 "${srcdir}/${_gitname}_build/fallback.efi.signed" "${pkgdir}/usr/lib/shim/fallback.efi.signed"
	
}
