# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

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

_gitroot="git://github.com/vathpela/libefivar.git"
_gitname="${_pkgname}"
_gitbranch="master"

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --always | sed 's|-|.|g'
}

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
	
}
