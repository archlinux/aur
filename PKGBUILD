# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

_gitroot="http://linux.dell.com/git/efibootmgr.git"
_gitname="efibootmgr"
_gitbranch="master"

_pkgname="efibootmgr"
pkgname="${_pkgname}-git"

pkgver=Release_0_6_0
pkgrel=3
pkgdesc="Tool to modify UEFI Firmware Boot Manager Variables - GIT Version"
arch=('i686' 'x86_64')
url="http://linux.dell.com/efibootmgr/"
license=('GPL2')
makedepends=('git')
depends=('pciutils')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=(strip purge docs zipman !emptydirs !libtool)

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}"
        'efibootmgr-tilt_slashes-func.patch')

sha1sums=('SKIP'
          'abe85252cdd9fcc3050fb1cb2c3652bbe8d67efa')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --always | sed 's|-|.|g'
}

build() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	## Apply tilt_slashes patch
	patch -Np1 -i "${srcdir}/efibootmgr-tilt_slashes-func.patch" || true
	echo
	
	make
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	install -d "${pkgdir}/usr/bin/"
	install -D -m0755 "${srcdir}/${_gitname}_build/src/efibootmgr/efibootmgr" "${pkgdir}/usr/bin/efibootmgr"
	
	install -d "${pkgdir}/usr/share/man/man8/"
	install -D -m0644 "${srcdir}/${_gitname}_build/src/man/man8/efibootmgr.8" "${pkgdir}/usr/share/man/man8/efibootmgr.8"
	
}
