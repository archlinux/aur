# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=check_lm_sensors
pkgver=3.1.1
pkgrel=1
pkgdesc="Nagios plugin to monitor the values of on board sensors and hard disk temperatures"
arch=('any')
url="https://trac.id.ethz.ch/projects/nagios_plugins/wiki/check_lm_sensors"
license=('GPL')
depends=('perl-nagios-plugin')
optdepends=('sudo: check localhost without authentication' 'hddtemp: check HDD temperatures')
source=("${pkgname}-${pkgver}.tar.gz::https://trac.id.ethz.ch/projects/nagios_plugins/downloads/125"
    'sudo.patch'
	'sudoers')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p0 -i "$srcdir/sudo.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's|#!perl|#!/usr/bin/perl|' check_lm_sensors
    pod2man check_lm_sensors.pod > check_lm_sensors.1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm 0755 check_lm_sensors "${pkgdir}/usr/share/nagios/libexec/check_lm_sensors"
    install -Dm 0755 check_lm_sensors.1 "${pkgdir}/usr/share/man/man1/check_lm_sensors.1"
	install -dm 0750 "${pkgdir}/etc/sudoers.d"
	install -Dm 0440 "${srcdir}/sudoers" "${pkgdir}/etc/sudoers.d/check_lm_sensors"
}

sha256sums=('e226cb81bc7bda5a3bb26141f3406132ae0d01e23ab03d451896e9b7128d2318'
            '2aef426881e478ed621c3fe072edd5301bb95cfeed817a4bd2e8e494badec7a5'
            '3c47dda8eb4a0b6ce697d665882618f0387831072be7e9e2c3c45086fea644e3')
