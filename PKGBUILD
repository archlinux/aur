# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="ia32"

__pkgname="gnu-efi"

_src_rootdir="${__pkgname}-3.0"

_pkgname="gnu-efi-libs"
pkgname="${_pkgname}-git"

_pkgver="3.0v"
pkgver=3.0v.43.f16d93f
pkgrel=1

pkgdesc="Library for building UEFI Applications using GNU toolchain - Sourceforge GIT Version"
url="http://sourceforge.net/projects/gnu-efi/"
license=('GPL')
arch=('x86_64' 'i686')
makedepends=('git' 'pciutils')
options=('staticlibs' '!strip' '!makeflags')

conflicts=('gnu-efi-libs')
provides=("gnu-efi-libs=${pkgver}")

source=("${__pkgname}::git+http://git.code.sf.net/p/gnu-efi/code#branch=master"
        'gnu-efi-3.0v-revert-makefile-commit.patch')

sha1sums=('SKIP'
          'db411a1f2f545924dc59f8a0c2331acfcb10bb54')

pkgver() {
	cd "${srcdir}/${__pkgname}/"
	echo "${_pkgver}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" | sed -e 's|-|.|g'
}

prepare() {
	
	rm -rf "${srcdir}/${__pkgname}_build/" || true
	cp -r "${srcdir}/${__pkgname}" "${srcdir}/${__pkgname}_build"
	
	cd "${srcdir}/${__pkgname}_build/"
	
	msg "Clean git repo"
	git clean -x -d -f
	echo
	
	msg "Fix Makefiles"
	# git revert --no-commit 06744d69273de4945cf0ffcaa4a6abf7cec707b6
	patch -Np1 -i "${srcdir}/gnu-efi-3.0v-revert-makefile-commit.patch" || true
	echo
	
	msg "Fix stdarg.h issue"
	sed 's|#include "stdarg.h"|#include <stdarg.h>|g' -i "${srcdir}/${__pkgname}_build/${_src_rootdir}/inc/efistdarg.h" || true
	
}

build() {
	
	cd "${srcdir}/${__pkgname}_build/${_src_rootdir}/"
	
	msg "Unset all compiler FLAGS"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Run make"
	make -j1
	echo
	
	msg "Run make apps"
	make -j1 -C apps all
	echo
	
}

package() {
	
	cd "${srcdir}/${__pkgname}_build/${_src_rootdir}/"
	
	msg "Run make install"
	make INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib" install
	echo
	
	msg "Install gnu-efi apps"
	install -d "${pkgdir}/usr/share/gnu-efi/apps/${_EFI_ARCH}/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/${_src_rootdir}/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/apps/${_EFI_ARCH}/"
	
}
