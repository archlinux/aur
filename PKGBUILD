# Maintainer: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_gitroot="git://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git"
_gitname="efitools"
_gitbranch="master"

_pkgname="efitools"
pkgname="${_pkgname}-git"

pkgver=1.4.2.1.g9af07a9
pkgrel=1
pkgdesc="Tools to Create and Setup own UEFI Secure Boot Certificates, Keys and Signed Binaries - GIT Version"
url="http://blog.hansenpartnership.com/efitools-1-4-with-linux-key-manipulation-utilities-released/"
arch=('x86_64')
license=('GPL2' 'LGPL2.1')

makedepends=('git' 'gnu-efi-libs' 'help2man' 'perl-file-slurp')
depends=('openssl' 'sbsigntool' 'efivar' 'efibootmgr' 'dosfstools')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")

options=('!strip' '!makeflags')
install="${_pkgname}.install"

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")

sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags)" | sed -e 's|^v||g' -e 's|-|.|g'
}

build() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	cd "${srcdir}/${_gitname}_build/"
	
	## Unset all compiler FLAGS
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	sed 's|-DEFI_FUNCTION_WRAPPER|-DEFI_FUNCTION_WRAPPER -DGNU_EFI_USE_MS_ABI|g' -i "${srcdir}/${_gitname}_build/Make.rules"
	
	make V=1 -j1
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	make DESTDIR="${pkgdir}/" install
	echo
	
	## Do not install LockDown.efi
	rm -f "${pkgdir}/usr/share/efitools/efi/LockDown.efi" || true
	
}
