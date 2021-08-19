# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

_appname='gnunet'
pkgname="${_appname}-git"
pkgver='0.15.0.r29763.71a70133a'
pkgrel=2
pkgdesc="A framework for secure peer-to-peer networking"
arch=('i686' 'x86_64')
url="http://${_appname}.org"
license=('GPL')
provides=("${_appname}")
conflicts=("${_appname}" "${_appname}-bin")
depends=('bash' 'which' 'gnutls' 'gnurl' 'libgcrypt' 'libunistring' 'libidn2'
	'libmicrohttpd' 'jansson' 'nss' 'libtool' 'sqlite' 'zlib' 'libsodium'
	'openssl' 'libextractor' 'brotli' 'gettext')
makedepends=('gettext' 'pkgconfig' 'libtool' 'bluez-libs' 'python' 'libpulse'
             'git' 'opus')
optdepends=('bluez: for bluetooth transport'
            'libzbar: for reading/writing GNUnet URIs from/to QR codes using gnunet-qr'
            'texlive-core: for generating GNS business cards via gnunet-bcd'
            'miniupnpc: for NAT uPnP support'
	    'libpulse: for conversation service'
	    'opus: for conversation service'
            'pbc: for Attribute-Based Encryption (experimental)'
            'libgabe: for Attribute-Based Encryption (experimental)'
            'libpabc: for re:claimID zero-knowledge privacy credentials')
backup=("etc/${_appname}.conf")
options=('!makeflags')
source=("git+https://${_appname}.org/git/${_appname}.git"
        "${_appname}.service"
        "${_appname}.sysusers"
        "${_appname}.tmpfiles"
        "${_appname}.conf")
install="${pkgname}.install"

sha256sums=('SKIP'
            '2fb156b5bda51ef7c0659ca19113e7c8cd651637ffb379264e2b61f65be367d1'
            '65daa9fb07bdc8b8a11ca06f320b94ce6cfcc9681c6693ac655ca54881645a39'
            '4832e45c02ad768a713ca7f2a04b58794e268a49130b5b8ab6b91917e3d4f945'
            '6453b443ff660e5dd1bdcb6afcd4fc781ca128263faeda9cb50101911a0779d2')

pkgver() {

	cd "${_appname}"

	printf "'%s.r%s.%s'" \
		"$(grep 'AC_INIT' configure.ac | grep -o '[0-9]\(\.[0-9]\+\)\+')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_appname}"

	./bootstrap
	sed -i 's|contrib doc|doc|' Makefile.*
	export GNUNET_PREFIX='/usr/lib'

}

build() {

	cd "${srcdir}/${_appname}"

	test -f Makefile || ./configure --prefix='/usr' --without-mysql
	make
	make -C contrib

}

package() {

	cd "${srcdir}/${_appname}"

	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" -C contrib install

	# rm -rf "${pkgdir}/usr/include/libltdl" "${pkgdir}"/usr/lib/libltdl.* "${pkgdir}/usr/include/ltdl.h"

	install -dm755 "${pkgdir}/etc"
	install -Dm644 "${srcdir}/${_appname}.conf" "${pkgdir}/etc/${_appname}.conf"

	install -dm755 "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

	install -dm755 "${pkgdir}/usr/lib/sysusers.d"
	install -Dm644 "${srcdir}/${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"

	install -dm755 "${pkgdir}/usr/lib/tmpfiles.d"
	install -Dm644 "${srcdir}/${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

}

