# Maintainer: Oskari Rauta <oskari.rauta@gmail.com>

pkgname=('displaymanager-slim-openrc')
pkgver=20161011
pkgrel=2
pkgdesc="OpenRC dm init script with support for slim login manager"
depends=('openrc' 'xorg-server' 'xorg-xinit' 'udev-openrc')
optdepends=('consolekit-openrc: consolekit initscript'
	'dbus-openrc: dbus initscript'
        'slim: slim login manager')
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc-desktop')
provides=('displaymanager-openrc')
replaces=('displaymanager-openrc')
conflicts=('displaymanager-openrc')
backup=('etc/conf.d/xdm')
install=displaymanager.install
_url="https://raw.githubusercontent.com/gentoo/gentoo/master"

source=("xdm.confd"
	"xdm.initd"
	"xdm-setup.initd"
	"startDM.sh"
	"xdg-user-dirs")
sha256sums=('09cab78a234ee5e2b0e99621e63a1d71a81441c701335ca0982588c1af1ecb81'
            '46a7c2c2efff14d52ac4ff4cb67a1748f0b9e5a0f888782efaf90c2b5f86cdc2'
            '2bfd09c3e20ffaee7634a9ef08ee9ce42dc5490cc425cbbe5414f4398ac14936'
            'da3efeaa0e5becefbbd5fe82e89a76a1efa1969b9afc1b5bd0abf83a93fc0bee'
            'f0f27de23d849b2fa4ebf59e448b5a843b577d14dc2c1070e228999091fa7f5e')

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

package() {
	pkgdesc="OpenRC dm init script"
	depends=('openrc' 'xorg-server' 'xorg-xinit' 'udev-openrc')
	optdepends=('consolekit-openrc: consolekit initscript'
                    'dbus-openrc: dbus initscript')
	backup=('etc/conf.d/xdm')
	install=displaymanager.install

	install -Dm755 ${srcdir}/xdm.confd ${pkgdir}/etc/conf.d/xdm
	
	_inst_initd 'xdm'
	_inst_initd 'xdm-setup'

	install -Dm755 "${srcdir}/startDM.sh" "${pkgdir}/etc/X11/startDM.sh"

	sed -e 's|/etc/profile.env|/etc/profile|g' \
		-e 's|{ROOTPATH}|{PATH}|g' \
		-i "${pkgdir}/etc/init.d/xdm"

	install -D ${srcdir}/xdg-user-dirs "$pkgdir/etc/X11/xinit/xinitrc.d/xdg-user-dirs"
}

