# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname="gnu-efi-libs-fedora-git"
pkgver="20121112"
pkgrel="1"
pkgdesc="Library for building x86_64 and i386 UEFI Applications using GNU toolchain - Fedora GIT Version"
url="http://sourceforge.net/projects/gnu-efi/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('pciutils')
options=('!strip' '!makeflags')

if [[ "${CARCH}" == "x86_64" ]]; then
	makedepends+=('lib32-glibc')
fi

conflicts=('gnu-efi-libs')
provides=('gnu-efi-libs')

source=('gnu-efi-fix-x86_64-uefi-call-wrapper.patch'
        'gnu-efi-fedora-disable-USE_MS_ABI.patch'
        'gnu-efi-fedora-IA32-build-fix.patch'
        'gnu-efi-fedora-fix-makefile-vars.patch')

sha1sums=('8918de3aefba2a3dc367bbb28611394c4c300a6d'
          '5e6b30cdf2c1d89ccb3f5314bb3e0ef0d45b0001'
          '51ac3eb4667f75dd50acbc3b8805f75fa64b4d7e'
          '09144dd3ec664b96714fe92d823e31bd1bb747e9')

_gitroot="git://github.com/vathpela/gnu-efi.git"
_gitname="gnu-efi-fedora"
_gitbranch="fedora"

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

_build_gnu-efi-libs-x86_64() {
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build-x86_64"
	cd "${srcdir}/${_gitname}_build-x86_64/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	
	ARCH="x86_64" make -j1
	echo
	
	ARCH="x86_64" make -j1 -C apps all
	echo
}

_build_gnu-efi-libs-i386() {
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build-i386"
	cd "${srcdir}/${_gitname}_build-i386/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	
	ARCH="ia32" make -j1
	echo
	
	ARCH="ia32" make -j1 -C apps all
	echo
}

build() {
	_update_git
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build"
	
	## Fix x86_64 UEFI call wrapper http://sourceforge.net/tracker/?func=detail&aid=3576537&group_id=163609&atid=828423
	patch -Np1 -i "${srcdir}/gnu-efi-fix-x86_64-uefi-call-wrapper.patch"
	echo
	
	## Disable GCC MS_ABI CFLAGS
	patch -Np1 -i "${srcdir}/gnu-efi-fedora-disable-USE_MS_ABI.patch"
	echo
	
	## Fix missing header file for IA32 build
	patch -Np1 -i "${srcdir}/gnu-efi-fedora-IA32-build-fix.patch"
	echo
	
	## Fix Makefiles to enable compile for both UEFI arch
	patch -Np1 -i "${srcdir}/gnu-efi-fedora-fix-makefile-vars.patch"
	echo
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		_build_gnu-efi-libs-x86_64
	fi
	
	_build_gnu-efi-libs-i386
}

_package_gnu-efi-libs-x86_64() {
	cd "${srcdir}/${_gitname}_build-x86_64/"
	
	make ARCH="x86_64" INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/x86_64/"
	install -D -m0644 "${srcdir}/${_gitname}_build-x86_64/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/x86_64/"
}

_package_gnu-efi-libs-i386() {
	cd "${srcdir}/${_gitname}_build-i386/"
	
	make ARCH="ia32" INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/${_LIBDIR32}" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/i386/"
	install -D -m0644 "${srcdir}/${_gitname}_build-i386/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/i386/"
}

package() {
	if [[ "${CARCH}" == "x86_64" ]]; then
		_package_gnu-efi-libs-x86_64
		
		_LIBDIR32="lib32"
		_package_gnu-efi-libs-i386
	else
		_LIBDIR32="lib"
		_package_gnu-efi-libs-i386
	fi
}
