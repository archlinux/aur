# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=check_lm_sensors
pkgver=4.1.1
pkgrel=2
pkgdesc="Nagios plugin to monitor the values of on board sensors and hard disk temperatures"
arch=('any')
url="https://github.com/matteocorti/check_lm_sensors"
license=('GPL')
depends=('perl-monitoring-plugin' 'perl-readonly' 'perl-list-moreutils')
optdepends=('sudo: check localhost without authentication' 'hddtemp: check HDD temperatures')
source=("https://github.com/matteocorti/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
    'sudo.patch'
	'sudoers')
sha256sums=('c4487804a3f31db5333d8fdc5e31dec122ea5f15395e4bb6531d8e88e4a73511'
            '2aef426881e478ed621c3fe072edd5301bb95cfeed817a4bd2e8e494badec7a5'
            '3c47dda8eb4a0b6ce697d665882618f0387831072be7e9e2c3c45086fea644e3')

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

	install -Dm 0755 check_lm_sensors "${pkgdir}/usr/lib/monitoring-plugins/check_lm_sensors"
    install -Dm 0755 check_lm_sensors.1 "${pkgdir}/usr/share/man/man1/check_lm_sensors.1"
	install -dm 0750 "${pkgdir}/etc/sudoers.d"
	install -Dm 0440 "${srcdir}/sudoers" "${pkgdir}/etc/sudoers.d/check_lm_sensors"
}

# vim: sts=4 ts=4 et ft=sh:
