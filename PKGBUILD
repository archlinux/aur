# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Timothée Ravier <tim at siosm dot fr>
# Contributor: Tom <reztho at archlinux dot org>

pkgbase=tuned
pkgname=("${pkgbase}" "${pkgbase}-ppd")
pkgver=2.22.0
pkgrel=3
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url="https://github.com/redhat-performance/${pkgbase}"
license=('GPL')
depends=('dbus-glib' 'ethtool' 'gawk' 'hdparm' 'polkit' 'python-configobj' 'python-dbus' 'python-gobject' 'python-linux-procfs' 'python-perf' 'python-pyudev')
makedepends=('desktop-file-utils')
options=('!emptydirs')
source=("https://github.com/redhat-performance/${pkgbase}/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz")
sha512sums=('653f946e8eff57eaa7e26b05c9215d60c8dcec6760b4a41a2855328e86b65f4dcbc0b2fd7d9f9355d00aae93f601c035a38d4e1611f30cb5003b417e31bea4dc')

prepare() {
	cd "${pkgbase}-${pkgver}"
	mv libexec lib

	sed -i 's/libexec/lib/g' Makefile
	sed -i 's/sbin/bin/g' Makefile
	sed -i 's/install-ppd: install$/install-ppd: install-dirs/' Makefile
}

package_tuned() {
	optdepends=('virt-what: virtual machine detection'
		'systemtap: detailed system monitoring'
		'tuned-ppd: power-profiles-daemon api translation')
	backup=('etc/tuned/active_profile'
		'etc/tuned/bootcmdline'
		'etc/tuned/cpu-partitioning-powersave-variables.conf'
		'etc/tuned/cpu-partitioning-variables.conf'
		'etc/tuned/post_loaded_profile'
		'etc/tuned/realtime-variables.conf'
		'etc/tuned/realtime-virtual-guest-variables.conf'
		'etc/tuned/realtime-virtual-host-variables.conf'
		'etc/tuned/tuned-main.conf')
	install="${pkgbase}.install"

	cd "${pkgbase}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	python -m compileall -d /usr/lib "${pkgdir}/usr/lib"
	python -O -m compileall -d /usr/lib "${pkgdir}/usr/lib"
}

package_tuned-ppd() {
	pkgdesc='Daemon that allows applications to easily transition to TuneD from power-profiles-daemon (PPD)'
	depends=('tuned')
	conflicts=('power-profiles-daemon')
	backup=('etc/tuned/ppd.conf')

	cd "${pkgbase}-${pkgver}"

	make DESTDIR="${pkgdir}" install-ppd
}
