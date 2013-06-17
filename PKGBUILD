# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_gitroot="git://github.com/vathpela/libefivar.git"
_gitname="libefivar"
_gitbranch="master"

_pkgname="libefivar"
pkgname="${_pkgname}-git"

pkgdesc="Library to manipulate EFI variables - GIT Version"

pkgver=138640c
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/vathpela/libefivar"
license=('LGPL2.1')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('strip' 'emptydirs' 'zipman' 'libtool' 'docs')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --always | sed 's|-|.|g'
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
	
	make LIBDIR="/usr/lib/" V=1 -j1
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	make -j1 V=1 INSTALLROOT="${pkgdir}/" LIBDIR="/usr/lib/" install
	echo
	
	chmod 0644 "${pkgdir}/usr/lib/libefivar.a"
	
	install -d "${pkgdir}/usr/bin"
	install -D -m0755 "${srcdir}/${_gitname}_build/src/test/tester" "${pkgdir}/usr/bin/libefivar-tester"
	
}
