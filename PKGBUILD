# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

_gitroot="git://git.code.sf.net/p/gnu-efi/code"
_gitname="gnu-efi"
_gitbranch="master"

_src_rootdir="gnu-efi-3.0"

pkgname="gnu-efi-libs-git"
pkgver=0ca0dac
pkgrel=1
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

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}"
        'gnu-efi-fix-makefile-vars.patch'
        'gnu-efi-disable-mmx-and-sse.patch'
        'gnu-efi-disable-USE_MS_ABI.patch')

sha1sums=('SKIP'
          'eec2b954aa44407b38342be567e767cea302b7c8'
          '9c9ed8bc8bf76105302b9d57a516f3bab5d6ffa9'
          '5e6b30cdf2c1d89ccb3f5314bb3e0ef0d45b0001')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --always | sed 's|-|.|g'
}

_build_gnu-efi-libs-x86_64() {
	rm -rf "${srcdir}/${_gitname}_build-x86_64" || true
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build-x86_64"
	
	cd "${srcdir}/${_gitname}_build-x86_64/${_src_rootdir}/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	ARCH="x86_64" make -j1
	echo
	
	ARCH="x86_64" make -j1 -C apps all
	echo
}

_build_gnu-efi-libs-i386() {
	rm -rf "${srcdir}/${_gitname}_build-i386" || true
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build-i386"
	
	cd "${srcdir}/${_gitname}_build-i386/${_src_rootdir}/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	ARCH="ia32" make -j1
	echo
	
	ARCH="ia32" make -j1 -C apps all
	echo
}

build() {
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/${_src_rootdir}/"
	
	## Fix Makefiles to enable compile for both UEFI arch
	patch -Np1 -i "${srcdir}/gnu-efi-fix-makefile-vars.patch" || true
	echo
	
	## Disable MMX and SSE in GCC 4.8
	patch -Np1 -i "${srcdir}/gnu-efi-disable-mmx-and-sse.patch" || true
	echo
	
	## Disable GCC MS_ABI CFLAGS
	# patch -Np1 -i "${srcdir}/gnu-efi-disable-USE_MS_ABI.patch" || true
	# echo
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		_build_gnu-efi-libs-x86_64
	fi
	
	_build_gnu-efi-libs-i386
}

_package_gnu-efi-libs-x86_64() {
	cd "${srcdir}/${_gitname}_build-x86_64/${_src_rootdir}/"
	
	make ARCH="x86_64" INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/x86_64/"
	install -D -m0644 "${srcdir}/${_gitname}_build-x86_64/${_src_rootdir}/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/x86_64/"
}

_package_gnu-efi-libs-i386() {
	cd "${srcdir}/${_gitname}_build-i386/${_src_rootdir}/"
	
	make ARCH="ia32" INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/${_LIBDIR32}" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/i386/"
	install -D -m0644 "${srcdir}/${_gitname}_build-i386/${_src_rootdir}/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/i386/"
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
