# Maintainer : Keshav Padram Amburay <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

__pkgname="efibootmgr"
_pkgname="${__pkgname}-pjones"
pkgname="${_pkgname}-git"

_gitroot="https://github.com/vathpela/efibootmgr.git"
_gitname="${_pkgname}"
_gitbranch="libefivars"

pkgver=0.6.0.138.1132342
pkgrel=1
pkgdesc="Tool to modify UEFI Firmware Boot Manager Variables - Built from Fedora's Peter Jones GitHub Repo - libefivars branch"
arch=('x86_64' 'i686')
url="https://github.com/vathpela/efibootmgr"
license=('GPL2')
makedepends=('git')
depends=('pciutils' 'efivar')
conflicts=("${__pkgname}" "${__pkgname}-git" "${_pkgname}")
provides=("${__pkgname}" "${__pkgname}-git" "${_pkgname}")
options=('!strip' 'zipman' '!emptydirs' '!libtool')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	
	_RELEASE_MAJOR="$(grep 'RELEASE_MAJOR' "${srcdir}/${_gitname}/Makefile" | head -1 | sed -e 's|RELEASE_MAJOR := ||g')"
	_RELEASE_MINOR="$(grep 'RELEASE_MINOR' "${srcdir}/${_gitname}/Makefile" | head -1 | sed -e 's|RELEASE_MINOR := ||g')"
	_RELEASE_SUBLEVEL="$(grep 'RELEASE_SUBLEVEL' "${srcdir}/${_gitname}/Makefile" | head -1 | sed -e 's|RELEASE_SUBLEVEL := ||g')"
	
	_ACTUAL_VER="$(echo ${_RELEASE_MAJOR}.${_RELEASE_MINOR}.${_RELEASE_SUBLEVEL} | sed 's| ||g')"
	
	echo "${_ACTUAL_VER}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	make EXTRA_CFLAGS="-Os"
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	install -d "${pkgdir}/usr/bin/"
	install -D -m0755 "${srcdir}/${_gitname}_build/src/efibootmgr/efibootmgr" "${pkgdir}/usr/bin/efibootmgr"
	
	install -d "${pkgdir}/usr/share/man/man8/"
	install -D -m0644 "${srcdir}/${_gitname}_build/src/man/man8/efibootmgr.8" "${pkgdir}/usr/share/man/man8/efibootmgr.8"
	
}
