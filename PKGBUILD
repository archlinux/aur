# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Timothée Ravier <tim at siosm dot fr>
# Contributor: Tom <reztho at archlinux dot org>

_pkgbase=tuned
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-git" "${_pkgbase}-ppd-git")
pkgver=2.26.0.r0.g181472a
pkgrel=1
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url="https://github.com/redhat-performance/${_pkgbase}"
license=('GPL-2.0-or-later')
depends=('ethtool' 'gawk' 'hdparm' 'polkit' 'perf' 'python-configobj'
	'python-dbus' 'python-gobject' 'python-linux-procfs' 'python-pyudev')
makedepends=('desktop-file-utils' 'git')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/^v//g;s/-/./g'
}

prepare() {
	cd "${_pkgbase}"

	sed -i 's|/sbin/|/bin/|g' tuned.service tuned-gui.py tuned-gui.desktop tuned/ppd/tuned-ppd.service
}

package_tuned-git() {
	optdepends=('virt-what: Virtual machine detection'
		'systemtap: Detailed system monitoring'
		'tuned-ppd: power-profiles-daemon api translation'
		'wireless_tools: Wireless device power management'
		'x86_energy_perf_policy: Energy Performance Bias (EPB) support')
	provides=("${_pkgbase}")
	conflicts=("${_pkgbase}")
	backup=('etc/tuned/active_profile'
		'etc/tuned/bootcmdline'
		'etc/tuned/cpu-partitioning-powersave-variables.conf'
		'etc/tuned/cpu-partitioning-variables.conf'
		'etc/tuned/post_loaded_profile'
		'etc/tuned/profile_mode'
		'etc/tuned/realtime-variables.conf'
		'etc/tuned/realtime-virtual-guest-variables.conf'
		'etc/tuned/realtime-virtual-host-variables.conf'
		'etc/tuned/tuned-main.conf')

	cd "${_pkgbase}"

	make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" LIBEXECDIR="/usr/lib" install
	rm -rv "${pkgdir}"/{run,var}

	python -m compileall -d /usr/lib "${pkgdir}/usr/lib"
	python -O -m compileall -d /usr/lib "${pkgdir}/usr/lib"
}

package_tuned-ppd-git() {
	pkgdesc='Daemon that allows applications to easily transition to TuneD from power-profiles-daemon (PPD)'
	depends=("${_pkgbase}" 'python-pyinotify')
	provides=("${_pkgbase}-ppd" 'power-profiles-daemon')
	conflicts=("${_pkgbase}-ppd" 'power-profiles-daemon')
	backup=('etc/tuned/ppd.conf')

	cd "${_pkgbase}"

	make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" LIBEXECDIR="/usr/lib" install-ppd
}
