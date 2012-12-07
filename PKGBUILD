# Maintainer: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_pkgname="gummiboot-efi"
pkgname="${_pkgname}-git"

pkgver=20121207
pkgrel=1
pkgdesc="Simple text-mode UEFI Boot Manager - GIT Version"
url="http://freedesktop.org/wiki/Software/gummiboot"
arch=('any')
license=('GPL2')

makedepends=('git' 'gnu-efi-libs')
depends=('dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')

source=('loader.conf'
        'arch.conf')

sha1sums=('82a59f90d9138c26f8db52bb8e94991602cf1edd'
          '007178db11d524b15eb4566d930752d211e7dd78')

_gitroot="git://anongit.freedesktop.org/gummiboot"
_gitname="gummiboot"
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
	
	## Fix Makefiles to enable compile for both x86_64 and i386 UEFI
	sed 's|ARCH=|ARCH?=|g' -i "${srcdir}/${_gitname}_build/Makefile"
	sed 's|LIBDIR=|LIBDIR?=|g' -i "${srcdir}/${_gitname}_build/Makefile"
	sed 's|CFLAGS =|CFLAGS +=|g'  -i "${srcdir}/${_gitname}_build/Makefile"
	
	## Compile gummiboot for x86_64 UEFI
	rm -rf "${srcdir}/${_gitname}_build-x86_64/" || true
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build-x86_64"
	cd "${srcdir}/${_gitname}_build-x86_64/"
	
	ARCH="x86_64" make clean
	echo
	
	CFLAGS="-m64" ARCH="x86_64" LIBDIR="/usr/lib" make
	echo
	
	## Compile gummiboot for i386 aka IA32 UEFI
	rm -rf "${srcdir}/${_gitname}_build-i386/" || true
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build-i386"
	cd "${srcdir}/${_gitname}_build-i386/"
	
	ARCH="ia32" make clean
	echo
	
	CFLAGS="-m32" ARCH="ia32" LIBDIR="/usr/lib32" make
	echo
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	
}

package() {
	
	install -d "${pkgdir}/usr/lib/gummiboot/loader/entries/"
	
	## Install gummiboot UEFI applications
	install -D -m0644 "${srcdir}/${_gitname}_build-x86_64/gummiboot.efi" "${pkgdir}/usr/lib/gummiboot/gummibootx64.efi"
	install -D -m0644 "${srcdir}/${_gitname}_build-i386/gummiboot.efi" "${pkgdir}/usr/lib/gummiboot/gummibootia32.efi"
	
	## Install gummiboot example configuration files
	install -D -m0644 "${srcdir}/loader.conf" "${pkgdir}/usr/lib/gummiboot/loader/loader.conf"
	install -D -m0644 "${srcdir}/arch.conf" "${pkgdir}/usr/lib/gummiboot/loader/entries/arch.conf"
	
}
