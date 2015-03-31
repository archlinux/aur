# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor : Tobias Powalowski <tpowa@archlinux.org>

_pkgname="efivar"
pkgname="${_pkgname}-git"

pkgdesc="Tools and library to manipulate EFI variables - GIT master branch"
pkgver=0.15.17.gc1d0945
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/rhinstaller/efivar"
license=('LGPL2.1')
makedepends=('git')
depends=('popt')
conflicts=("${_pkgname}" 'libefivar' 'libefivar-git')
provides=("${_pkgname}=${pkgver}" "libefivar=${pkgver}" "libefivar-git=${pkgver}")
options=('!strip' 'zipman' 'docs')

source=("${_pkgname}::git+https://github.com/rhinstaller/efivar.git#branch=master")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	echo "$(git describe --tags)" | sed -e 's|-|\.|g'
}

prepare() {
	
	cd "${srcdir}/${_pkgname}/"
	
	git clean -x -d -f
	echo
	
	rm -rf "${srcdir}/${_pkgname}_build/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}_build"
	
	cd "${srcdir}/${_pkgname}_build/"
	
	sed 's|-O0|-Os|g' -i "${srcdir}/${_pkgname}_build/Make.defaults" || true
	sed 's|-rpath=$(TOPDIR)/src/|-rpath=$(libdir)|g' -i "${srcdir}/${_pkgname}_build/src/test/Makefile" || true
	
}

build() {
	
	cd "${srcdir}/${_pkgname}_build/"
	
	make libdir="/usr/lib/" bindir="/usr/bin/" mandir="/usr/share/man/" includedir="/usr/include/" V=1 -j1
	echo
	
}

package() {
	
	cd "${srcdir}/${_pkgname}_build/"
	
	make -j1 V=1 DESTDIR="${pkgdir}/" libdir="/usr/lib/" bindir="/usr/bin/" mandir="/usr/share/man/" includedir="/usr/include/" install
	echo
	
	install -d "${pkgdir}/usr/bin"
	install -D -m0755 "${srcdir}/${_pkgname}_build/src/test/tester" "${pkgdir}/usr/bin/efivar-tester"
	
}
