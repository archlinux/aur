# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

_gitroot="git://git.code.sf.net/p/gnu-efi/code"
_gitname="gnu-efi"
_gitbranch="master"

_src_rootdir="${_gitname}-3.0"

pkgname="gnu-efi-libs-git"
pkgver=0.30.b32a578
pkgrel=1
pkgdesc="Library for building UEFI Applications using GNU toolchain - Sourceforge GIT Version"
url="http://sourceforge.net/projects/gnu-efi/"
license=('GPL')
arch=('x86_64' 'i686')
makedepends=('git' 'pciutils')
options=('staticlibs' '!strip' '!makeflags')

conflicts=('gnu-efi-libs')
provides=('gnu-efi-libs')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" | sed -e 's|-|.|g'
}

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="ia32"

build() {
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	git clean -x -d -f
	echo
	
	## Unset all compiler FLAGS
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/${_gitname}_build/${_src_rootdir}/"
	
	make -j1
	echo
	
	make -j1 -C apps all
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/${_src_rootdir}/"
	
	make INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/apps/${_EFI_ARCH}/"
	install -D -m0644 "${srcdir}/${_gitname}_build/${_src_rootdir}/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/apps/${_EFI_ARCH}/"
	
}
