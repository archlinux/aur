# Maintainer : Keshav Padram Amburay <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="devpath"
pkgname="${_pkgname}-git"

_gitroot="https://github.com/vathpela/devpath.git"
_gitname="${_pkgname}"
_gitbranch="master"

pkgdesc="Library and Utility for dealing with UEFI Device Paths - GIT Version"

pkgver=0.1.9.e71ed30
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/vathpela/devpath"
license=('LGPL2.1')
makedepends=('git')
depends=('popt')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
options=('!strip' 'emptydirs' 'zipman' '!libtool' 'docs')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	
	_ACTUAL_VER="$(grep 'VERSION' "${srcdir}/${_gitname}/Makefile" | head -1 | sed -e 's|VERSION = ||g')"
	
	echo "${_ACTUAL_VER}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	
	cd "${srcdir}/${_gitname}"
	
	git clean -x -d -f
	echo
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
}

build() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	make LIBDIR="/usr/lib/" bindir="/usr/bin/" mandir="/usr/share/man/" includedir="/usr/include/" V=1 -j1
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	make -j1 V=1 DESTDIR="${pkgdir}/" LIBDIR="/usr/lib/" bindir="/usr/bin/" mandir="/usr/share/man/" includedir="/usr/include/" install
	echo
	
}
