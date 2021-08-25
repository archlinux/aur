# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

pkgname='gnunet'
pkgver='0.15.2'
pkgrel=1
pkgdesc='A framework for secure peer-to-peer networking'
arch=('i686' 'x86_64')
url="http://${pkgname}.org"
license=('AGPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('bash' 'which' 'gnutls' 'gnurl' 'libgcrypt' 'libunistring' 'libidn2'
	'libmicrohttpd' 'jansson' 'nss' 'libtool' 'sqlite' 'zlib' 'libsodium'
	'openssl' 'libextractor' 'brotli' 'gettext')
makedepends=('pkgconfig' 'libtool' 'bluez-libs' 'python' 'libpulse'
             'opus')
optdepends=('bluez: for bluetooth transport'
            'zbar: for reading/writing GNUnet URIs from/to QR codes using gnunet-qr'
            'texlive-core: for generating GNS business cards via gnunet-bcd'
            'miniupnpc: for NAT uPnP support'
	    'libpulse: for conversation service'
	    'opus: for conversation service'
            'pbc: for Attribute-Based Encryption'
            'libgabe: for Attribute-Based Encryption'
            'libpabc: for re:claimID zero-knowledge privacy credentials')
backup=("etc/${pkgname}.conf")
options=('!makeflags')
source=("ftp://ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"{,.sig}
        "${pkgname}-system.service"
        "${pkgname}-user.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('23e6af170bb47aacb15d27bbe244d871dbc4d0523b1139bd2f12f4b42b65102e'
            'SKIP'
            'ef221a4cbdc2270d7a1b1447e6e8a498653ec16d2f73fa57a7c6888980af4dfb'
            '13760ecc1523a9acd030df34e6a90edcd2971271766c8e159c9e66341a9168c4'
            '66299dbbdd0219d2f5f0520e69fc094f38f789724d973c2f63a421257ea4f755'
            '4e3f8015dcc83ea4efb913abb9eb7d8d15ba3a5834218634ee2f350b903ef77b')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	export GNUNET_PREFIX='/usr/lib'

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	test -f Makefile || ./configure --prefix='/usr'
	make
	make -C contrib

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" -C contrib install

	install -dm755 "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/${pkgname}-system.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

	install -dm755 "${pkgdir}/usr/lib/systemd/user"
	install -Dm644 "${srcdir}/${pkgname}-user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

	install -dm755 "${pkgdir}/usr/lib/sysusers.d"
	install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

	install -dm755 "${pkgdir}/usr/lib/tmpfiles.d"
	install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	# Automatically generate a configuration file using the content of
	# `/usr/share/gnunet/config.d/` as model; in this way we can ensure
	# that this configuration file is the one backed up with each update,
	# while `/usr/share/gnunet/config.d/` is kept as immutable default
	# configuration.
	install -dm755 "${pkgdir}/etc"
	{
		echo "# /etc/${pkgname}.conf"
		(cd "${pkgdir}" > /dev/null 2>&1 && find "usr/share/${pkgname}/config.d" -type f -name '*.conf' \
			-printf '\n\n# The following lines have been copied from /%p\n\n' \
			-exec cat '{}' ';')
	} > "${pkgdir}/etc/${pkgname}.conf"

}

