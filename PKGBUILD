# Maintainer: nous <nous@archlinux.us>
# Maintainer: artoo <artoo@manjaro.org>

_url="https://gitweb.gentoo.org/repo/gentoo.git/plain"
_sed_args=(-e 's|/var/run|/run|g')
prefix=true
$_prefix && _sed_args+=(-e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|g')

#pkgbase=openrc-base
pkgname=dbus-openrc
pkgver=20171115
pkgrel=1
pkgdesc="OpenRC dbus init script"
arch=('any')
url="https://github.com/OpenRC"
license=('GPL2')
groups=('openrc-base' 'openrc-desktop' 'openrc-system')
depends=('openrc' 'dbus-nosystemd')
conflicts=('dbus-openrc<=1.10.10-5')
source=("dbus.initd::${_url}/sys-apps/dbus/files/dbus.initd-r1")
sha256sums=('00a1a8f254d4f40b6f98a2777809b9c45ad81c4aeb4c0592793dd839777990bd')

pkgver() {
    date +%Y%m%d
}

_inst_initd(){
    install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

    sed ${_sed_args[@]} -i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
    install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package() {
    pkgdesc="OpenRC dbus init script"
    depends=('openrc' 'dbus')

    _inst_initd 'dbus'

    sed -e 's|dbus.pid|dbus/pid|g' -i "${pkgdir}/etc/init.d/dbus"
}
