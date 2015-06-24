# Maintainer: artoo <artoo@manjaro.org>

_gentoo_uri="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86"

pkgbase=openrc-base
pkgname=('cronie-openrc'
		'cryptsetup-openrc'
		'dbus-openrc'
		'dhcpcd-openrc'
		'device-mapper-openrc'
		'glibc-openrc'
		'inetutils-openrc'
		'lvm2-openrc'
		'mdadm-openrc')
pkgver=20150613
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc-base')
conflicts=('initscripts'
		'systemd-sysvcompat'
		'openrc'
		'openrc-git'
		'openrc-sysvinit')
source=("cronie.initd::${_gentoo_uri}/sys-process/cronie/files/cronie-1.3-initd"
		"dmcrypt.confd::${_gentoo_uri}/sys-fs/cryptsetup/files/1.6.7-dmcrypt.confd"
		"dmcrypt.initd::${_gentoo_uri}/sys-fs/cryptsetup/files/1.6.7-dmcrypt.rc"
		"dbus.initd::${_gentoo_uri}/sys-apps/dbus/files/dbus.initd"
		"nscd.initd::${_gentoo_uri}/sys-libs/glibc/files/nscd"
		"device-mapper.confd::${_gentoo_uri}/sys-fs/lvm2/files/device-mapper.conf-1.02.22-r3"
		"device-mapper.initd::${_gentoo_uri}/sys-fs/lvm2/files/device-mapper.rc-2.02.105-r2"
		"dmeventd.initd::${_gentoo_uri}/sys-fs/lvm2/files/dmeventd.initd-2.02.67-r1"
		"lvm.confd::${_gentoo_uri}/sys-fs/lvm2/files/lvm.confd-2.02.28-r2"
		"lvm.initd::${_gentoo_uri}/sys-fs/lvm2/files/lvm.rc-2.02.105-r2"
		"lvm-monitoring.initd::${_gentoo_uri}/sys-fs/lvm2/files/lvm-monitoring.initd-2.02.105-r2"
		"lvmetad.initd::${_gentoo_uri}/sys-fs/lvm2/files/lvmetad.initd-2.02.105-r2"
		"mdadm.confd::${_gentoo_uri}/sys-fs/mdadm/files/mdadm.confd"
		"mdadm.initd::${_gentoo_uri}/sys-fs/mdadm/files/mdadm.rc"
		"mdraid.confd::${_gentoo_uri}/sys-fs/mdadm/files/mdraid.confd"
		"mdraid.initd::${_gentoo_uri}/sys-fs/mdadm/files/mdraid.rc"
		"dhcpcd.initd::${_gentoo_uri}/net-misc/dhcpcd/files/dhcpcd.initd"
		'ftpd.confd'
		'ftpd.initd')
sha256sums=('292a7b20fe33bd027357475fea6aa1194afa7e5c1c47a85299db945b9d1c847e'
            '3d933a54abe62a547294b83208dbf5d7615d9c7f380d6504c91fff3620530803'
            '4bec4e67e2447a4472eecdd2fb31325b4dd558e1fe283683f86707629b9d192d'
            '98e37b8b6ed25004e48c5855d74c9361eea06d3fee13cefcc0ed10ccf452aa01'
            '6165db3a2fcb251d4f3655c0461e018ce9c92a37f7f22a8fd2b75178b5435bc8'
            '57777904f12a35617e5a4193c964ebb32396452487fd02353e71e16e7b46bc22'
            '036b6de05e6cbd921a667d6fc6b01d30c8f9b720e1a0d0e2453ecd62d32573fb'
            '0c051388991ba69afbf2f6baf36ba227d7c26fc8f0d7588d8de76d9a74886d79'
            '28370c089c39c248d7ded0960b8d8a9256bada44d44c22ce3cec87d512ef6844'
            'a5754ffa0a05a0c29a9f6b5acf1b21dd313581fd6156c1ef722dc620e0114676'
            'd7655cadd3a3a9d3683a540413365310ca9503c38fd21a9bfccec40630ca72f1'
            '60accb4b6114753232f2db0adf3fc3f46d4459bfedf79b888801a13c55d79fa9'
            'ec55674955af7a31da51b8b72b599e8519809287dad796a9b16155bcba471b79'
            '3073b14619cb7b2c99c33f2d6cfd1e59ce5557899bffebaa65fa52f3caffadc7'
            'b489ced10391d4295bb8ca29e128b0d4217c290f1b4e37b05f5a9275048d289d'
            '003b2c832909f1b89ffd283fb02d2712791d922394e201de0e42c0b463b2b1bd'
            '72b42c9939fda3fb56666813513029ed36194c1708bddce06bcb3e131e547492'
            '59fe1aa68c43f4958afc397a0d6b35da263a20fcdb457005123a0d64cb1f7477'
            '7f46e5e9ac9f204fb1564560c506a5bb4cede8823b89e3f1844e4f8be258e9ef')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_cronie-openrc() {
	pkgdesc="OpenRC cronie init script"
	groups=('openrc-base' 'openrc-desktop')
	depends=('openrc-core' 'cronie')
	provides=('openrc-cron')
	conflicts=('fcron'
			'fcron-openrc'
			'openrc'
			'openrc-git'
			'openrc-arch-services-git'
			'initscripts'
			'systemd-sysvcompat')
	backup=('etc/init.d/cronie')
	install=cronie.install

	_inst_initd 'cronie'

	sed -e 's|/usr/sbin|/usr/bin|g' -i ${pkgdir}/etc/init.d/cronie
}

package_dhcpcd-openrc() {
	pkgdesc="OpenRC dhcpcd init script"
	groups=('openrc-base' 'openrc-desktop')
	depends=('openrc-core' 'dhcpcd')
	install=dhcpcd.install

	_inst_initd 'dhcpcd'

	sed -e 's|/sbin|/usr/bin|g' -i "${pkgdir}/etc/init.d/dhcpcd"
}

package_dbus-openrc() {
	pkgdesc="OpenRC dbus init script"
	groups=('openrc-base' 'openrc-desktop')
	depends=('openrc-core' 'dbus')
	install=dbus.install

	_inst_initd 'dbus'

	sed -e 's|dbus.pid|dbus/pid|g' -i "${pkgdir}/etc/init.d/dbus"
}

package_device-mapper-openrc() {
	pkgdesc="OpenRC device-mapper init script"
	depends=('openrc-core' 'device-mapper')
	backup=('etc/conf.d/device-mapper')
	install=device-mapper.install

	_inst_confd 'device-mapper'
	_inst_initd 'device-mapper'
	_inst_initd 'dmeventd'

	for f in ${pkgdir}/etc/init.d/*; do
		sed -e 's|/sbin|/usr/bin|g' -i $f
	done
}

package_cryptsetup-openrc() {
	pkgdesc="OpenRC cryptsetup init script"
	depends=('device-mapper-openrc' 'cryptsetup')
	backup=('etc/conf.d/dmcrypt')
	install=cryptsetup.install

	_inst_confd 'dmcrypt'
	_inst_initd 'dmcrypt'

	sed -e 's|/usr/sbin|/usr/bin|g' -i "${pkgdir}/etc/init.d/dmcrypt"
}

package_glibc-openrc() {
	pkgdesc="OpenRC nscd init script"
	depends=('openrc-core' 'glibc')
	optdepends=('openldap-openrc'
			'bind-openrc')
	install=glibc.install

	_inst_initd 'nscd'

	sed -e 's|/usr/sbin|/usr/bin|g' -i "${pkgdir}/etc/init.d/nscd"
}

package_inetutils-openrc() {
	pkgdesc="OpenRC ftpd init script"
	depends=('openrc-core' 'inetutils')
	backup=('etc/conf.d/ftpd')
	install=inetutils.install

	_inst_confd 'ftpd'
	_inst_initd 'ftpd'
}

package_lvm2-openrc() {
	pkgdesc="OpenRC lvm2 init script"
	depends=('device-mapper-openrc' 'lvm2')
	backup=('etc/conf.d/lvm')
	install=lvm2.install

	_inst_confd 'lvm'
	_inst_initd 'lvm'
	_inst_initd 'lvm-monitoring'
	_inst_initd 'lvmetad'

	for f in ${pkgdir}/etc/init.d/*; do
		sed -e 's|/sbin|/usr/bin|g' -i $f
	done
}

package_mdadm-openrc() {
	pkgdesc="OpenRC mdadm init script"
	depends=('openrc-core' 'mdadm')
	optdepends=('bind-openrc')
	backup=('etc/conf.d/mdadm')
	install=mdadm.install

	_inst_confd 'mdadm'
	_inst_initd 'mdadm'

	_inst_confd 'mdraid'
	_inst_initd 'mdraid'
}
