# Maintainer: artoo <artoo@manjaro.org>
# Contributor: williamh <williamh@gentoo.org>

_pkgname="openrc"

_src_uri="http://dev.gentoo.org/~williamh/dist"
_net_uri="http://dev.gentoo.org/~robbat2/distfiles"

_udev="udev-init-scripts"
_uver=27

_net="netifrc"
_nver=0.2.4

pkgname=openrc-core
pkgdesc="Gentoo's universal init system, udev enabled."
pkgver=0.16.4
pkgrel=1
pkgdesc="Gentoo's universal init system, udev enabled."
arch=('i686' 'x86_64')
url="http://www.gentoo.org/proj/en/base/openrc/"
license=('GPL2')
depends=('inetutils' 'psmisc' 'sysvinit' 'udev>=186')
optdepends=('dhcpcd-openrc: dhcpcd initscript')
conflicts=('openrc' 'openrc-git' 'initscripts' 'systemd-sysvcompat' 'openrc-sysvinit')
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
	"${_src_uri}/${_udev}-${_uver}.tar.bz2"
	"${_net_uri}/${_net}-${_nver}.tar.bz2"
	"${_pkgname}.logrotate"
	'kmod-static-nodes')


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

_net_args=( "${_base_args[@]}" )
_net_args+=(LIBEXECDIR=/usr/lib/${_net})

prepare(){
	cd "${srcdir}/${_pkgname}-${pkgver}"
	local _bin='s|/sbin|/usr/bin|g'
	sed -e "${_bin}" -i support/sysvinit/inittab
	#sed -i 's:0444:0644:' mk/sys.mk

	#patch -p1 -i "$srcdir/aufs-unmount.patch"
}

build(){
	# make openrc
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make "${_rc_args[@]}"
	# make netifrc
	cd "${srcdir}/${_net}-${_nver}"
	make "${_net_args[@]}"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" "${_rc_args[@]}" install
	# inittab
	install -m644 "${srcdir}/${_pkgname}-${pkgver}/support/sysvinit/inittab" "${pkgdir}/etc/inittab"
	# logrotate
	install -Dm644 "${srcdir}/${_pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"
	# enable unicode & logger
	sed -e 's/#unicode="NO"/unicode="YES"/' \
	    -e 's/#rc_logger="YES"/rc_logger="YES"/' \
	    -i "${pkgdir}/etc/rc.conf"

	install -d ${pkgdir}/usr/lib/rc/cache

	# udev
	cd "${srcdir}/${_udev}-${_uver}"
	make DESTDIR="${pkgdir}" install
	# fix shebang & path to udevd
	local _bin='s|/sbin/udevd|/usr/bin/udevd|g' \
	      _shebang='s|#!/sbin/runscript|#!/usr/bin/openrc-run|'

	sed -e "${_shebang}" \
	    -e "${_bin}" \
	    -i "${pkgdir}/etc/init.d/udev"
	# create runlevel
	cd "${srcdir}/${_pkgname}-${pkgver}"
	ln -sf "/etc/init.d/udev" "${pkgdir}/etc/runlevels/sysinit/udev"

	# netifrc
	cd "${srcdir}/${_net}-${_nver}"
	make DESTDIR="${pkgdir}" "${_net_args[@]}" install
	install -Dm 644 "${srcdir}/${_net}-${_nver}/doc/net.example" "${pkgdir}/etc/conf.d/net"

	_shebang='s|#!/usr/bin/runscript|#!/usr/bin/openrc-run|'
	sed -e "${_shebang}" \
	    -i "${pkgdir}/etc/init.d/net.lo"

	# create runlevel
	ln -sf "/etc/init.d/net.lo" "${pkgdir}/etc/runlevels/boot/net.lo"

	# kmod-static-nodes
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/kmod-static-nodes" "${pkgdir}/etc/init.d/kmod-static-nodes"

	# create runlevel
	ln -sf "/etc/init.d/kmod-static-nodes" "${pkgdir}/etc/runlevels/sysinit/kmod-static-nodes"
}
sha256sums=('6771257e208da2e4d20b4ac2e3e7f065eb8873566644ff385e9dbd6bc5221d21'
            '1a091c361e9845861c138b505881edcb7b68fcf91708db526dff0b320243c936'
            '9b53eb3c8e6e80cd4073a34f911a28055c28b9f7a9f119a397002b0de7ac0691'
            '0b44210db9770588bd491cd6c0ac9412d99124c6be4c9d3f7d31ec8746072f5c'
            'fc90e8d480de39aff90e41477f79720a98bee2a2359c53c209d0ca7bb75fb6ba')
