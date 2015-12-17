# Maintainer: SSF <punx69 at gmx dot net>

pkgbase=thinkfan-git
pkgname=('thinkfan-openrc' 'thinkfan-systemd')
pkgver=1.0.r150
pkgrel=1
pkgdesc="Thinkfan is a simple, lightweight fan control program. Originally designed
specifically for IBM/Lenovo Thinkpads, it now supports any kind of system via
the sysfs hwmon interface (/sys/class/hwmon). It is designed to eat as little
CPU power as possible."
arch=('i686' 'x86_64')
url="http://thinkfan.sourceforge.net"
license=('GPL3')
makedepends=('git' 'cmake' 'make' 'sed')
optdepends=('libatasmart: read HDD temperatures' 'lm_sensors: hwmon support')
#source=("$pkgname::git://git.code.sf.net/p/thinkfan/code#branch=master")
##using new fork!
source=("${pkgbase}::git://github.com/vmatare/thinkfan#branch=master")
md5sums=('SKIP')

###if installed add to deps
if (pacman -Q libatasmart >/dev/null); then
	depends+=('libatasmart')
fi
if (pacman -Q lm_sensors >/dev/null); then
	depends+=('lm_sensors')
fi

pkgver() {
	cd "${pkgbase}"
	_rev=$(git rev-list --count HEAD)
	printf "1.0.r$_rev"
}

build() {
	cd "${pkgbase}"
	if (pacman -Q libatasmart >/dev/null); then
		msg "building against libatasmart"
		cmake -DUSE_ATASMART:BOOL=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DUSE_NVML=ON -DCMAKE_INSTALL_SBINDIR=/usr/bin .
	else
		msg "building without libatasmart"
		cmake -DUSE_ATASMART:BOOL=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DUSE_NVML=ON -DCMAKE_INSTALL_SBINDIR=/usr/bin .
	fi
	make
}

commonstuff() {
	provides=("${pkgname}=$pkgver"  "${pkgname}-git=$pkgver")
	conflicts=("${pkgname}<=$pkgver" "${pkgname}-git<=$pkgver")
	replaces=("${pkgname}<=$pkgver" "${pkgname}-git<=$pkgver")
	depends+=('openrc')
	cd "${pkgbase}"
	make install DESTDIR="${pkgdir}"
	install -d "${pkgdir}"/etc
###let this thing run at full speed(7) until configured
	printf "#full speed see /usr/share/doc/thinkfan for proper configuration\n(7,0,32767)\n" > "${pkgdir}"/etc/thinkfan.conf
	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/thinkfan/COPYING
###thinkpad modules load
	install -d "${pkgdir}"/etc/modprobe.d
	printf "options thinkpad_acpi fan_control=1" > "${pkgdir}"/etc/modprobe.d/thinkfan-thinkpad.conf
}

package_thinkfan-openrc() {
	install="openrc.install"
	commonstuff
	sed -i 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' rcscripts/thinkfan.gentoo
	install -Dm755 rcscripts/thinkfan.gentoo "${pkgdir}"/etc/init.d/thinkfan
}

package_thinkfan-systemd() {
	install="systemd.install"
	commonstuff
	install -Dm644 rcscripts/thinkfan.service "${pkgdir}"/usr/lib/systemd/system/thinkfan.service
}

