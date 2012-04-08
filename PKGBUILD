# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

_pkgname="efibootmgr"
pkgname="${_pkgname}-git"

pkgver=20120408
pkgrel=1
pkgdesc="Tool to modify UEFI Firmware Boot Manager Variables. Needs the kernel module 'efivars'."
arch=('i686' 'x86_64')
url="http://linux.dell.com/efibootmgr/"
license=('GPL2')
makedepends=('git')
depends=('pciutils')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=(strip purge docs zipman !emptydirs !libtool)

source=('efibootmgr_default_to_rEFInd.patch')
sha256sums=('0fb3053f74bb083f50e7fd9fd0820fc90682a3c9986aaf5dfadf1e3f59b01039')

_gitroot="http://linux.dell.com/git/${_pkgname}.git"
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
	
	patch -Np1 -i "${srcdir}/efibootmgr_default_to_rEFInd.patch"
	echo
	
	CFLAGS="" make
	echo
	
}


package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	install -d "${pkgdir}/usr/sbin/"
	install -D -m0755 "${srcdir}/${_gitname}_build/src/efibootmgr/efibootmgr" "${pkgdir}/usr/sbin/efibootmgr"
	
	install -d "${pkgdir}/usr/share/man/man8/"
	install -D -m0644 "${srcdir}/${_gitname}_build/src/man/man8/efibootmgr.8" "${pkgdir}/usr/share/man/man8/efibootmgr.8"
	
}
