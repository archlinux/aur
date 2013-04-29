# Maintainer : Keshav Padram (the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_gitroot="git://git.kernel.org/pub/scm/boot/syslinux/syslinux.git"
_gitname="syslinux"
_gitbranch="firmware"

__pkgname="syslinux"
_pkgname="${__pkgname}-efi"
pkgname="${_pkgname}-git"

pkgver=6.00.pre4
pkgrel=1
arch=('any')
pkgdesc="SYSLINUX built for x86_64 and i386 UEFI firmwares - GIT (Alpha) Version"
url="http://syslinux.zytor.com/"
license=('GPL2')

makedepends=('git' 'python2' 'gnu-efi-libs' 'nasm')
depends=('dosfstools' 'efibootmgr')

install="${_pkgname}.install"

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=('!strip' 'docs' '!libtool' 'emptydirs' 'zipman' '!purge' '!makeflags')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}"
        'syslinux.cfg')

sha1sums=('SKIP'
          '7477f166ae0ed26c69f03d95c13078e146b90fe1')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --always | sed 's|-|.|g' | sed 's|syslinux.||g'
}

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	fi
	
	rm -rf "${srcdir}/${_gitname}_build" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build"
	
	## Unset all compiler FLAGS for UEFI build
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	rm -rf "${srcdir}/${_gitname}_build/BUILD/" || true
	mkdir -p "${srcdir}/${_gitname}_build/BUILD/"
	
	make O="${srcdir}/${_gitname}_build/BUILD" PYTHON="python2" efi64
	echo
	
	make O="${srcdir}/${_gitname}_build/BUILD" PYTHON="python2" efi64 installer
	echo
	
	make O="${srcdir}/${_gitname}_build/BUILD" PYTHON="python2" efi32
	echo
	
	make O="${srcdir}/${_gitname}_build/BUILD" PYTHON="python2" efi32 installer
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	make O="${srcdir}/${_gitname}_build/BUILD" INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux" efi64 install
	echo
	
	make O="${srcdir}/${_gitname}_build/BUILD" INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux" efi32 install
	echo
	
	install -d "${pkgdir}/usr/lib/syslinux/config"
	install -D -m0644 "${srcdir}/syslinux.cfg" "${pkgdir}/usr/lib/syslinux/config/syslinux.cfg"
	
}
