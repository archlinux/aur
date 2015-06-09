# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="ia32"

__pkgname="gnu-efi"
_pkgname="gnu-efi-libs"
pkgname="${_pkgname}-git"

_pkgver="3.0.2"
pkgver=3.0.2.81.d4c242e
pkgrel=1

pkgdesc="Library for building UEFI Applications using GNU toolchain - GIT Version"
url="http://sourceforge.net/projects/gnu-efi/"
license=('GPL')
arch=('x86_64' 'i686')
makedepends=('git' 'pciutils')
options=('staticlibs' '!strip' '!makeflags')

conflicts=('gnu-efi-libs')
provides=("gnu-efi-libs=${pkgver}")

source=("gnu-efi::git+https://github.com/vathpela/gnu-efi.git#branch=fedora")
sha1sums=('SKIP')

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
	sed 's|/gnuefi/crt0-efi|/x86_64/gnuefi/crt0-efi|g' -i "${srcdir}/${__pkgname}_build/apps/Makefile"
	sed 's|L../lib|L../x86_64/lib|g' -i "${srcdir}/${__pkgname}_build/apps/Makefile"
	sed 's|L../gnuefi|L../x86_64/gnuefi|g' -i "${srcdir}/${__pkgname}_build/apps/Makefile"
	
}

build() {
	
	cd "${srcdir}/${__pkgname}_build/"
	
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
	
	cd "${srcdir}/${__pkgname}_build/"
	
	msg "Run make install"
	make INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib" install
	echo
	
	msg "Install gnu-efi apps"
	install -d "${pkgdir}/usr/share/gnu-efi/apps/${_EFI_ARCH}/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/apps/${_EFI_ARCH}/"
	
}
