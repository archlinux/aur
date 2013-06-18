# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_gitroot="git://github.com/vathpela/efivar.git"
_gitname="efivar"
_gitbranch="master"

_pkgname="efivar"
pkgname="${_pkgname}-git"

pkgdesc="Library to manipulate EFI variables - GIT Version"

pkgver=0.4_13_g3beac07
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/vathpela/efivar"
license=('LGPL2.1')
depends=('glibc')
conflicts=("${_pkgname}" 'libefivar' 'libefivar-git')
provides=("${_pkgname}" 'libefivar' 'libefivar-git')
options=('strip' 'emptydirs' 'zipman' 'libtool' 'docs')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags)" | sed 's|-|_|g'
}

build() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make V=1 -j1 clean || true
	echo
	
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
