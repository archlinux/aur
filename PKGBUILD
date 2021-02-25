# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Philip Müller <philm[at]garuda[dog]org>
# Contributor: artoo <artoo@garuda.org>
# Contributor: anex <assassin.anex[@]gmail.com>

_repo=croco-tools-livecd

pkgbase=croco-live
pkgname=('croco-live-base'
	#'croco-live-openrc'
	'croco-live-systemd'
	'croco-live-skel'
	'croco-live-portable-efi')
pkgver=r3.19f1cf0
pkgrel=1
pkgdesc='croco Linux live session'
arch=('any')
url="https://gitlab.com/croco-os/tools/croco-tools-livecd"
license=('GPL')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/croco-tools-livecd
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${_repo} #-${pkgver}
	make PREFIX=/usr SYSCONFDIR=/etc
}

package_croco-live-base() {
	pkgdesc='croco Linux live base scripts'
	depends=('croco-tools-base>=0.13')
	conflicts=('croco-livecd-base')
	replaces=('croco-livecd-base')

	cd ${srcdir}/${_repo} #-${pkgver}
	make PREFIX=/usr SYSCONFDIR=/etc DESTDIR=${pkgdir} install_base
}

package_croco-live-openrc() {
	pkgdesc='croco Linux live openrc init scripts'
	depends=('openrc' 'croco-live-base')
	conflicts=('croco-livecd-openrc')
# 	replaces=('croco-livecd-openrc')

	cd ${srcdir}/${_repo} #-${pkgver}
	make PREFIX=/usr SYSCONFDIR=/etc DESTDIR=${pkgdir} install_rc
}

package_croco-live-systemd() {
	pkgdesc='croco Linux live systemd units'
	depends=('systemd' 'croco-live-base' 'reflector')
	conflicts=('croco-livecd-systemd')
# 	replaces=('croco-livecd-systemd')

	cd ${srcdir}/${_repo} #-${pkgver}
	make PREFIX=/usr SYSCONFDIR=/etc DESTDIR=${pkgdir} install_sd
}

package_croco-live-skel() {
	pkgdesc='croco Linux live session autostart items'

	cd ${srcdir}/${_repo} #-${pkgver}
	make PREFIX=/usr SYSCONFDIR=/etc DESTDIR=${pkgdir} install_xdg
}


package_croco-live-portable-efi() {
	pkgdesc='croco Linux live session portable efi settings'
    depends=('grub')

	cd ${srcdir}/${_repo} #-${pkgver}
	make PREFIX=/usr SYSCONFDIR=/etc DESTDIR=${pkgdir} install_portable_efi
}
