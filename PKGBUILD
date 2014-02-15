# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Eric Mertens <emertens@gmail.com>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

_pkgname="biosdisk"
pkgname="${_pkgname}-git"

pkgver=20120219
pkgrel="1"
arch=('any')
pkgdesc="Utility for creating Dell BIOS flash disks"
url="http://linux.dell.com/biosdisk/"
license=("GPL")

makedepends=()
depends=('dos2unix' 'wget' 'syslinux' 'python2')
# optdepends=('python2: For /usr/sbin/blconf script')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
backup=("etc/biosdisk.conf")
options=('!strip' 'docs' 'libtool' 'emptydirs' 'zipman' '!purge' '!upx')

source=()
sha256sums=()

_gitroot="http://linux.dell.com/git/biosdisk.git"
_gitname="${_pkgname}"
_gitbranch="master"

_update_git() {
	
	cd "${srcdir}/"
	
	msg "Connecting to GIT server...."
	
	if [[ -d "${srcdir}/${_gitname}/" ]]; then
		cd "${srcdir}/${_gitname}/"
		git reset --hard
		
		git remote rm origin
		git remote add origin "${_gitroot}"
		
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
	
	cd "${srcdir}/${_gitname}/"
	
	_update_git
	
}

package() {
	
	cd "${srcdir}/${_gitname}/"
	
	install -d "${pkgdir}/usr/sbin"
	install -D -m0755 "${srcdir}/${_gitname}/biosdisk" "${pkgdir}/usr/sbin/biosdisk"
	install -D -m0755 "${srcdir}/${_gitname}/blconf" "${pkgdir}/usr/sbin/blconf"
	sed 's|#!/usr/bin/python|#!/usr/bin/env python2|g' -i "${pkgdir}/usr/sbin/blconf"
	
	install -d "${pkgdir}/etc"
	install -D -m0644 "${srcdir}/${_gitname}/biosdisk.conf" "${pkgdir}/etc/biosdisk.conf"
	
	install -d "${pkgdir}/usr/share/man/man8"
	install -D -m0644 "${srcdir}/${_gitname}/biosdisk.8.gz" "${pkgdir}/usr/share/man/man8"
	
	install -d "${pkgdir}/usr/share/biosdisk"
	install -D -m0644 "${srcdir}/${_gitname}/dosdisk.img" "${pkgdir}/usr/share/biosdisk/dosdisk.img"
	install -D -m0644 "${srcdir}/${_gitname}/dosdisk288.img" "${pkgdir}/usr/share/biosdisk/dosdisk288.img"
	install -D -m0644 "${srcdir}/${_gitname}/dosdisk8192.img" "${pkgdir}/usr/share/biosdisk/dosdisk8192.img"
	
	install -d "${pkgdir}/var/lib/biosdisk"
	
}
