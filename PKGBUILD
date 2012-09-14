# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="libefivar"
pkgname="${_pkgname}-git"    ## For AUR interface

pkgdesc="Library to manipulate EFI variables"

pkgver=20120914
pkgrel=1
arch=('x86_64')
url="https://github.com/vathpela/libefivar"
license=('GPL2')

# makedepends=()
depends=('glibc')
options=('!strip' '!emptydirs' 'zipman' '!libtool' 'docs')

# source=()
# sha256sums=()

_gitroot="git://github.com/vathpela/libefivar.git"
_gitname="${_pkgname}"
_gitbranch="master"

_update_git() {
	
	cd "${srcdir}/"
	
	msg "Connecting to GIT server...."
	
	if [[ -d "${srcdir}/${_gitname}/" ]]; then
		cd "${srcdir}/${_gitname}/"
		git reset --hard
		git fetch
		git checkout "${_gitbranch}"
		git merge "remotes/origin/${_gitbranch}"
		msg "The local GIT repo has been updated."
	else
		git clone "${_gitroot}" "${_gitname}"
		cd "${srcdir}/${_gitname}/"
		git checkout "${_gitbranch}"
		msg "GIT checkout done or server timeout"
	fi
	
	echo
	
}

build() {
	
	_update_git
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	unset CFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make clean || true
	echo
	
	sed 's|/usr/lib64/|/usr/lib/|g' -i "${srcdir}/${_gitname}_build/Make.defaults"
	sed 's|CFLAGS	?=|CFLAGS	+=|g' -i "${srcdir}/${_gitname}_build/Make.defaults"
	sed 's|CCLDFLAGS ?=|CCLDFLAGS +=|g' -i "${srcdir}/${_gitname}_build/Make.defaults"
	
	CFLAGS="" LDFLAGS="" LIBDIR="/usr/lib/" make all
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	make INSTALLROOT="${pkgdir}/" LIBDIR="/usr/lib/" install
	echo
	
	chmod 0644 "${pkgdir}/usr/lib/libefivar.a"
	
	# install -d "${pkgdir}/usr/bin"
	# install -D -m0755 "${srcdir}/${_gitname}_build/src/test/tester" "${pkgdir}/usr/bin/libefivar-tester"
	# echo
	
}
