# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_gitroot="git://github.com/vathpela/libefivar.git"
_gitname="libefivar"
_gitbranch="master"

_pkgname="libefivar"
pkgname="${_pkgname}-git"

pkgdesc="Library to manipulate EFI variables - GIT Version"

pkgver=17dc893
pkgrel=1
arch=('x86_64')
url="https://github.com/vathpela/libefivar"
license=('GPL2')

depends=('glibc')
options=('!strip' '!emptydirs' 'zipman' '!libtool' 'docs')

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
	
	make clean || true
	echo
	
	sed 's|/usr/lib64/|/usr/lib/|g' -i "${srcdir}/${_gitname}_build/Make.defaults"
	sed 's|CFLAGS	?=|CFLAGS	+=|g' -i "${srcdir}/${_gitname}_build/Make.defaults"
	sed 's|CCLDFLAGS ?=|CCLDFLAGS +=|g' -i "${srcdir}/${_gitname}_build/Make.defaults"
	
	LIBDIR="/usr/lib/" make all
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	make INSTALLROOT="${pkgdir}/" LIBDIR="/usr/lib/" install
	echo
	
	chmod 0644 "${pkgdir}/usr/lib/libefivar.a"
	
	# install -d "${pkgdir}/usr/bin"
	# install -D -m0755 "${srcdir}/${_gitname}_build/src/test/tester" "${pkgdir}/usr/bin/libefivar-tester"
	
}
