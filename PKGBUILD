# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

_gitroot="git://git.code.sf.net/p/gnu-efi/code"
_gitname="gnu-efi"
_gitbranch="master"

_src_rootdir="${_gitname}-3.0"

pkgname="gnu-efi-libs-git"
pkgver=8cb1e87
pkgrel=1
pkgdesc="Library for building x86_64 and ia32 UEFI Applications using GNU toolchain - Sourceforge GIT Version"
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
        'gnu-efi-disable-use_ms_abi.patch')

sha1sums=('SKIP'
          'e9f2c6cc7414b021cd3297791f911f721f120afa')

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
	
	make ARCH="x86_64" -j1
	echo
	
	make ARCH="x86_64" -j1 -C apps all
	echo
}

_build_gnu-efi-libs-ia32() {
	rm -rf "${srcdir}/${_gitname}_build-ia32" || true
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build-ia32"
	
	cd "${srcdir}/${_gitname}_build-ia32/${_src_rootdir}/"
	
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
	
	cd "${srcdir}/${_gitname}_build/${_src_rootdir}/"
	
	## Disable ms_abi in gnu-efi Makefiles
	# patch -Np1 -i "${srcdir}/gnu-efi-disable-use_ms_abi.patch"
	# echo
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		_build_gnu-efi-libs-x86_64
	fi
	
	_build_gnu-efi-libs-ia32
}

_package_gnu-efi-libs-x86_64() {
	cd "${srcdir}/${_gitname}_build-x86_64/${_src_rootdir}/"
	
	make ARCH="x86_64" INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/apps/x86_64/"
	install -D -m0644 "${srcdir}/${_gitname}_build-x86_64/${_src_rootdir}/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/apps/x86_64/"
}

_package_gnu-efi-libs-ia32() {
	cd "${srcdir}/${_gitname}_build-ia32/${_src_rootdir}/"
	
	make ARCH="ia32" INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/${_LIBDIR32}" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/apps/ia32/"
	install -D -m0644 "${srcdir}/${_gitname}_build-ia32/${_src_rootdir}/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/apps/ia32/"
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
