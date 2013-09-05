# Maintainer : Keshav Padram Amburay <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="efivar"
pkgname="${_pkgname}-git"

_gitroot="https://github.com/vathpela/efivar.git"
_gitname="${_pkgname}"
_gitbranch="master"

pkgdesc="Library to manipulate EFI variables - GIT Version"

pkgver=0.5
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/vathpela/efivar"
license=('LGPL2.1')
depends=('popt')
conflicts=("${_pkgname}" 'libefivar' 'libefivar-git')
provides=("${_pkgname}" 'libefivar' 'libefivar-git')
options=('!strip' 'emptydirs' 'zipman' 'libtool' 'docs' '!makeflags')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags)" | sed -e 's|-|\.|g'
}

build() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	git clean -x -d -f
	echo
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	sed 's|-rpath=$(TOPDIR)/src/|-rpath=$(libdir)|g' -i "${srcdir}/${_gitname}_build/src/test/Makefile" || true
	
	make libdir="/usr/lib/" bindir="/usr/bin/" mandir="/usr/share/man/" includedir="/usr/include/" V=1 -j1
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	make -j1 V=1 DESTDIR="${pkgdir}/" libdir="/usr/lib/" bindir="/usr/bin/" mandir="/usr/share/man/" includedir="/usr/include/" install
	echo
	
	install -d "${pkgdir}/usr/bin"
	install -D -m0755 "${srcdir}/${_gitname}_build/src/test/tester" "${pkgdir}/usr/bin/efivar-tester"
	
}
