# Maintainer:  Tim Rosulnik <tim.rosulnik@gmail.com>

_pkgname="forcepoint-client"
pkgname="${_pkgname}-bin"
pkgver=2.5.2
pkgrel=2
pkgdesc="SSL VPN client for Forcepoint NGFW"
arch=('x86_64')
url="https://www.forcepoint.com"
license=('proprietary')
depends=('libevent' 'libnl' 'openssl-1.1' 'libsecret')
provides=("${pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.zip::https://it.um.si/Documents/VPNClientLinux252.zip"
	"libevent-openssl.deb::http://ftp.si.debian.org/debian/pool/main/libe/libevent/libevent-openssl-2.1-7_2.1.12-stable-1_amd64.deb"
	"forcepoint-client-fix"
	"fp.conf")
sha256sums=('9f32441189c3c27488de12f52bab66af084f0d861c4978d361d8ce391a86a133'
	'26abb086df10d311ff355341e5297d220c21f1bab8659982f06bc06281e4c017'
	'1260bf77168abb3c235bfd0a584b0431393ffafe7028872633b25b9d8f84518b'
	'f948bc232fc632982e22d592aab1f4f926fcbb431a8499cd23869ff100dbf139')
noextract=("libevent-openssl.deb")
_libtool="!libtool"
_debug="!debug"

prepare() {
	# create dirs
	mkdir -p ext deb/fpc deb/essl "${srcdir}/${pkgname}-${pkgver}"

	# extract forcepoint client
	bsdtar -xf "ForcepointVPNClientLinux252.zip" -C ext
	bsdtar -xf "ext/forcepoint-client_${pkgver}+bullseye_amd64.deb" -C deb/fpc
	bsdtar -xf "deb/fpc/data.tar.gz" -C "${srcdir}/${pkgname}-${pkgver}"

	# extract required old libevent-openssl library
	bsdtar -xf "libevent-openssl.deb" -C deb/essl
	bsdtar -xf "deb/essl/data.tar.xz" -C "${srcdir}/${pkgname}-${pkgver}"
	mv "${srcdir}/${pkgname}-${pkgver}/usr/lib/x86_64-linux-gnu" "${srcdir}/${pkgname}-${pkgver}/usr/lib/${_pkgname}"

	# copy script to bin dir
	cp "forcepoint-client-fix" "${srcdir}/${pkgname}-${pkgver}/usr/sbin/${_pkgname}-fix"

	# check and install config
	CONF_DIR="${XDG_CONFIG_HOME:=$HOME/.config}/forcepoint"
	if [[ -f "$CONF_DIR/fp.conf" ]]; then
		msg "Using custom fp.conf"
	else
		install -d "$CONF_DIR"
		install -m700 "${srcdir}/fp.conf" "$CONF_DIR"
	fi
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# create dirs
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/man/man1
	install -d ${pkgdir}/usr/share/doc/${_pkgname}
	install -d ${pkgdir}/usr/lib/${_pkgname}

	# install forcepoint-client
	install -m755 usr/sbin/forcepoint-client ${pkgdir}/usr/bin/_forcepoint-client
	install -m744 usr/man/man1/forcepoint-client.1 ${pkgdir}/usr/share/man/man1
	install -m744 usr/share/doc/forcepoint-client/copyright ${pkgdir}/usr/share/doc/${_pkgname}

	# install libevent-openssl library
	install -m744 usr/lib/${_pkgname}/libevent_openssl-2.1.so.7* ${pkgdir}/usr/lib/${_pkgname}
	install -m744 usr/share/doc/libevent-openssl-2.1-7/* ${pkgdir}/usr/lib/${_pkgname}

	# install script
	install -m755 usr/sbin/forcepoint-client-fix ${pkgdir}/usr/bin/forcepoint-client
}
