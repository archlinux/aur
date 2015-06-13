# Maintainer: artoo <artoo@manjaro.org>
# Contributor: williamh <williamh@gentoo.org>

_pkgname="openrc"

_src_uri="http://dev.gentoo.org/~williamh/dist"
_net_uri="http://dev.gentoo.org/~robbat2/distfiles"
_g_uri="https://github.com/gentoo/gentoo-functions/archive" #/0.10.tar.gz

_udev="udev-init-scripts"
_uver=29

_net="netifrc"
_nver=0.3.1

_genf="gentoo-functions"
_gver=0.10

pkgname=openrc-core
pkgdesc="Gentoo's universal init system, udev enabled."
pkgver=0.16.4
pkgrel=2
pkgdesc="Gentoo's universal init system, udev enabled."
arch=('i686' 'x86_64')
url="http://www.gentoo.org/proj/en/base/openrc/"
license=('BSD2' 'GPL2')
depends=('inetutils' 'psmisc' 'sysvinit' 'udev>=186')
optdepends=('dhcpcd-openrc: dhcpcd initscript')
conflicts=('openrc' 'openrc-git' 'initscripts' 'systemd-sysvcompat' 'openrc-sysvinit' 'eudev-openrc')
backup=('etc/rc.conf'
	'etc/conf.d/consolefont'
	'etc/conf.d/keymaps'
	'etc/conf.d/hostname'
	'etc/conf.d/modules'
	'etc/conf.d/net'
	'etc/conf.d/hwclock'
	'etc/inittab')
install=${_pkgname}.install
source=("${_src_uri}/${_pkgname}-${pkgver}.tar.bz2"
	"${_src_uri}/${_udev}-${_uver}.tar.gz"
	"${_net_uri}/${_net}-${_nver}.tar.bz2"
	"${_genf}-${_gver}::${_g_uri}/${_gver}.tar.gz"
	"${_pkgname}.logrotate"
	'kmod-static-nodes')
sha256sums=('6771257e208da2e4d20b4ac2e3e7f065eb8873566644ff385e9dbd6bc5221d21'
            '63fd923b259f216d8a1b1b64d8e541d67fb5ef86ac163ad087306017fa6426d9'
            'a92a96b6f065981ee1c0232a507f3695230eeb7fb6172ec9048c2538b36cfea8'
            '709c8b22f404001a512e47a7a4d3192070b3e150fb9d0f943de09736d665b0db'
            '0b44210db9770588bd491cd6c0ac9412d99124c6be4c9d3f7d31ec8746072f5c'
            'fc90e8d480de39aff90e41477f79720a98bee2a2359c53c209d0ca7bb75fb6ba')

_base_args=(SYSCONFDIR=/etc)
if [ -f /etc/os-release ]; then
    . /etc/os-release
    _base_args+=(BRANDING="$NAME")

else
    _base_args+=(BRANDING='Unknown Linux')
fi
_base_args+=(PREFIX=/usr)
_base_args+=(SBINDIR=/usr/bin)

_rc_args=( "${_base_args[@]}" )
_rc_args+=(LIBEXECDIR=/usr/lib/rc)
_rc_args+=(MKSELINUX=no)
_rc_args+=(MKPAM=pam)
_rc_args+=(MKTERMCAP=ncurses)
_rc_args+=(MKNET=no)

_f_args+=(ROOTPREFIX=/usr)
_f_args+=(ROOTSBINDIR=/usr/bin)
_f_args+=(ROOTLIBEXECDIR=/usr/lib/manjaro)

_net_args=( "${_base_args[@]}" )
_net_args+=(LIBEXECDIR=/usr/lib/${_net})

prepare(){
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed -e "s|/sbin|/usr/bin|g" -i support/sysvinit/inittab
	#sed -i 's:0444:0644:' mk/sys.mk
}

build(){
	# make openrc
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make "${_rc_args[@]}"
	# make netifrc
	cd "${srcdir}/${_net}-${_nver}"
	make "${_net_args[@]}"
	cd ${srcdir}/${_genf}-${_gver}
	make "${_f_args[@]}"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" "${_rc_args[@]}" install
	install -m644 "${srcdir}/${_pkgname}-${pkgver}/support/sysvinit/inittab" "${pkgdir}/etc/inittab"
	install -Dm644 "${srcdir}/${_pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"

	sed -e 's/#unicode="NO"/unicode="YES"/' \
	    -e 's/#rc_logger="YES"/rc_logger="YES"/' \
	    -i "${pkgdir}/etc/rc.conf"

	install -d ${pkgdir}/usr/lib/rc/cache

	# udev
	cd "${srcdir}/${_udev}-${_uver}"
	make DESTDIR="${pkgdir}" install
	sed -e "s|/sbin/udevd|/usr/bin/udevd|g" \
		-e "s|#!/sbin/runscript|#!/usr/bin/openrc-run|" \
		-i ${pkgdir}/etc/init.d/udev
	for f in ${pkgdir}/etc/init.d/udev-trigger ${pkgdir}/etc/init.d/udev-settle;do
		sed -e "s|#!/sbin/openrc-run|#!/usr/bin/openrc-run|" \
			-e "s|/bin/udevadm|/usr/bin/udevadm|g" \
			-i "$f"
	done
	cd "${srcdir}/${_pkgname}-${pkgver}"
	ln -sf "/etc/init.d/udev" "${pkgdir}/etc/runlevels/sysinit/udev"
	ln -sf "/etc/init.d/udev-trigger" "${pkgdir}/etc/runlevels/sysinit/udev-trigger"

	# netifrc
	cd "${srcdir}/${_net}-${_nver}"
	make DESTDIR="${pkgdir}" "${_net_args[@]}" install
	install -Dm 644 "${srcdir}/${_net}-${_nver}/doc/net.example" "${pkgdir}/etc/conf.d/net"

	sed -e 's|#!/usr/bin/runscript|#!/usr/bin/openrc-run|' \
	    -i "${pkgdir}/etc/init.d/net.lo"
	ln -sf "/etc/init.d/net.lo" "${pkgdir}/etc/runlevels/boot/net.lo"
	sed -e 's|/lib/gentoo/functions.sh|/usr/lib/manjaro/functions.sh|g' \
		-i "${pkgdir}/usr/lib/netifrc/sh/functions.sh"

	# kmod-static-nodes
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/kmod-static-nodes" "${pkgdir}/etc/init.d/kmod-static-nodes"
	ln -sf "/etc/init.d/kmod-static-nodes" "${pkgdir}/etc/runlevels/sysinit/kmod-static-nodes"

	cd ${srcdir}/${_genf}-${_gver}
	make DESTDIR="${pkgdir}" "${_f_args[@]}" install
}
