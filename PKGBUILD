# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

_gitroot="git://github.com/vathpela/gnu-efi.git"
_gitname="gnu-efi-fedora"
_gitbranch="fedora"

pkgname="gnu-efi-libs-fedora-git"
pkgver=430c83a
pkgrel=1
pkgdesc="Library for building x86_64 and ia32 UEFI Applications using GNU toolchain - Fedora GIT Version"
url="http://sourceforge.net/projects/gnu-efi/"
license=('GPL')
arch=('x86_64' 'i686')
makedepends=('pciutils')
options=('!strip' '!makeflags')

if [[ "${CARCH}" == "x86_64" ]]; then
	makedepends+=('gcc-multilib')
fi

conflicts=('gnu-efi-libs')
provides=('gnu-efi-libs')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}"
        'gnu-efi-fix-x86_64-uefi-call-wrapper.patch')

sha1sums=('SKIP'
          '8918de3aefba2a3dc367bbb28611394c4c300a6d')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --always | sed 's|-|.|g'
}

_build_gnu-efi-libs-x86_64() {
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build-x86_64"
	cd "${srcdir}/${_gitname}_build-x86_64/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make ARCH="x86_64" -j1
	echo
	
	make ARCH="x86_64" -j1 -C apps all
	echo
}

_build_gnu-efi-libs-ia32() {
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build-ia32"
	cd "${srcdir}/${_gitname}_build-ia32/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make ARCH="ia32" -j1
	echo
	
	make ARCH="ia32" -j1 -C apps all
	echo
}

build() {
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	## Fix x86_64 UEFI call wrapper http://sourceforge.net/tracker/?func=detail&aid=3576537&group_id=163609&atid=828423
	patch -Np1 -i "${srcdir}/gnu-efi-fix-x86_64-uefi-call-wrapper.patch"
	echo
	
	## Disable GNU_EFI_USE_MS_ABI CFLAGS
	# sed 's|-DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11|--std=c11|g' -i "${srcdir}/${_gitname}_build/Make.defaults" || true
	
	## Add  -fno-stack-check to CFLAGS
	sed 's|-fno-stack-protector|-fno-stack-protector -fno-stack-check|g' -i "${srcdir}/${_gitname}_build/Make.defaults" || true
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		_build_gnu-efi-libs-x86_64
	fi
	
	_build_gnu-efi-libs-ia32
}

_package_gnu-efi-libs-x86_64() {
	cd "${srcdir}/${_gitname}_build-x86_64/"
	
	make ARCH="x86_64" INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/apps/x86_64/"
	install -D -m0644 "${srcdir}/${_gitname}_build-x86_64/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/apps/x86_64/"
}

_package_gnu-efi-libs-ia32() {
	cd "${srcdir}/${_gitname}_build-ia32/"
	
	make ARCH="ia32" INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/${_LIBDIR32}" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/apps/ia32/"
	install -D -m0644 "${srcdir}/${_gitname}_build-ia32/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/apps/ia32/"
}

package() {
	if [[ "${CARCH}" == "x86_64" ]]; then
		_package_gnu-efi-libs-x86_64
		
		_LIBDIR32="lib32"
		_package_gnu-efi-libs-ia32
	else
		_LIBDIR32="lib"
		_package_gnu-efi-libs-ia32
	fi
}
