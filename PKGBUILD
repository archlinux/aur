# Maintainer: Keshav Padram Amburay <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_gitroot="git://github.com/vathpela/pesign.git"
_gitname="pesign"
_gitbranch="master"

_pkgname="pesign"
pkgname="${_pkgname}-git"

pkgver=0.108.2.gf2cf2c5
pkgrel=1
pkgdesc="Tools for manipulating signed PE-COFF binaries - GIT Version"
url="https://github.com/vathpela/pesign"
arch=('x86_64')
license=('GPL2')
makedepends=('git')
depends=('popt' 'nss')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

options=('!strip' '!emptydirs' 'docs')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags)" | sed -e 's|-|.|g'
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
	
	make PREFIX="/usr/" LIBDIR="/usr/lib/"
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build"
	
	make INSTALLROOT="${pkgdir}/" PREFIX="/usr/" LIBDIR="/usr/lib/" install
	
	chmod 0644 "${pkgdir}/usr/lib/libdpe.a"
	
	rm -rf "${pkgdir}/etc/rpm/"
	
}
