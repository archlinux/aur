# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>

_url="https://raw.githubusercontent.com/gentoo/gentoo/master"

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g')
_prefix=true

$_prefix && _sed_args+=(-e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|g')

pkgbase=openrc-accessible
pkgname=('brltty-openrc'
        'espeakup-openrc')
pkgver=20170321
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc-accessible')
conflicts=('systemd-sysvcompat')
source=("brltty.initd::${_url}/app-accessibility/brltty/files/brltty.rc"
        "espeakup.confd::${_url}/app-accessibility/espeakup/files/espeakup.confd"
        "espeakup.initd::${_url}/app-accessibility/espeakup/files/espeakup.rc")
sha256sums=('4dd0338d2f9943165d5922c8964ca3456e8e8b67b37cf5f2652435bc1f644c41'
            '32e6de11417ebb199a7bf46eb8cf77054b1af1c9f4bcc80b856b34758830eb9f'
            '9bfaf3950744a9376cdd74240c3e6b9a92d7b17a16a3b9eb0485f5fd279ff963')

#pkgver() {
#	date +%Y%m%d
#}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed ${_sed_args[@]} -i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_espeakup-openrc() {
	pkgdesc="OpenRC espeakup init script"
	depends=('openrc' 'espeakup')
	optdepends=('alsa-utils-openrc: alsa support')
	backup=('etc/conf.d/espeakup')

	_inst_confd 'espeakup'
	_inst_initd 'espeakup'
}

package_brltty-openrc() {
	pkgdesc="OpenRC brltty init script"
	depends=('openrc' 'brltty')

	_inst_initd 'brltty'

	sed -e 's|/bin/brltty|/usr/bin/brltty|' \
		-i "${pkgdir}/etc/init.d/brltty"
}
