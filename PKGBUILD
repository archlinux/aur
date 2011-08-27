# Maintainer : Keshav P R <(skodabenz) (aatt) (rocketmail) (ddoott) (ccoomm)>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

_pkgname="efibootmgr"
pkgname="${_pkgname}-git"

pkgver=20110705
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

source=('efibootmgr_default_to_grub2.patch')
sha256sums=('5306a6f952d17215b129392953ae6551df0e4cf1960a959ab98c60f27fab9b90')

_gitroot="http://linux.dell.com/git/${_pkgname}.git"
_gitname="${_pkgname}"


_update_git() {
	
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	
	if [ -d "${srcdir}/${_gitname}/" ]
	then
		cd "${srcdir}/${_gitname}/"
		git reset --hard
		git fetch
		git checkout master
		git merge remotes/origin/master
		msg "The local GIT repo has been updated."
	else
		git clone "${_gitroot}" "${_gitname}"
		msg "GIT checkout done or server timeout"
	fi
	
	echo
	
}


build() {
	
	_update_git
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	patch -Np1 -i "${srcdir}/efibootmgr_default_to_grub2.patch"
	echo
	
	CFLAGS="" make
	echo
	
}


package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	install -d "${pkgdir}/usr/sbin/"
	install -D -m755 "${srcdir}/${_gitname}_build/src/efibootmgr/efibootmgr" "${pkgdir}/usr/sbin/efibootmgr"
	
	install -d "${pkgdir}/usr/share/man/man8/"
	install -D -m644 "${srcdir}/${_gitname}_build/src/man/man8/efibootmgr.8" "${pkgdir}/usr/share/man/man8/efibootmgr.8"
	
}
