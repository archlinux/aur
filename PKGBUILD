# Maintainer: artoo <artoo@manjaro.org>

_url="https://raw.githubusercontent.com/gentoo/gentoo/master"

pkgbase=openrc-ck
pkgname=('cgmanager-openrc'
		'consolekit-openrc')

pkgver=20170311
pkgrel=3
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
# groups=('openrc-desktop')
conflicts=('systemd-sysvcompat')
source=("consolekit.initd::${_url}/sys-auth/consolekit/files/consolekit-1.0.0.initd"
		"cgproxy.initd::${_url}/app-admin/cgmanager/files/cgproxy.initd-r1"
		"cgmanager.initd::${_url}/app-admin/cgmanager/files/cgmanager.initd-r1")
sha256sums=('c5e8db4e9d390bcaebcf203127a99b16d888a576d873920bd42dc56d20fa90c8'
            '97220fa0af6dcaa9d2cb726620ee3de8e216e55bab37cea40e5ed010ed637e35'
            'f162685428a6593630daf5d636c198caf4992843ced977dc6d7288b7559a062c')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
		-e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-e 's|/usr/sbin|/usr/bin|g' \
		-i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_cgmanager-openrc() {
	pkgdesc="OpenRC cgmanager init script"
	depends=('openrc' 'cgmanager')

	_inst_initd 'cgproxy'
	_inst_initd 'cgmanager'
}

package_consolekit-openrc() {
	pkgdesc="OpenRC consolekit init script"
	depends=('consolekit' 'dbus-openrc' 'cgmanager-openrc' 'udev-openrc')

	_inst_initd 'consolekit'
}
