# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

pkgname='gnunet'
pkgver='0.15.3'
pkgrel=2
pkgdesc='A framework for secure peer-to-peer networking'
arch=('i686' 'x86_64')
url="http://${pkgname}.org"
license=('AGPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('bash' 'which' 'gnutls' 'gnurl' 'libgcrypt' 'libunistring' 'libidn2'
         'libmicrohttpd' 'jansson' 'nss' 'libtool' 'sqlite' 'zlib' 'libsodium'
         'openssl' 'libextractor' 'brotli' 'gettext')
makedepends=('pkgconfig' 'libtool' 'bluez-libs' 'python' 'libpulse' 'opus')
optdepends=('postgresql: for an alternative to sqlite in the database plugin'
            'mysql: for an alternative to sqlite in the database plugin'
            'bluez: for bluetooth transport'
            'zbar: for reading/writing GNUnet URIs from/to QR codes using gnunet-qr'
            'texlive-core: for generating GNS business cards via gnunet-bcd'
            'miniupnpc: for NAT uPnP support'
	    'libpulse: for conversation service'
	    'libogg: for conversation service'
	    'opus: for conversation service'
            'pbc: for Attribute-Based Encryption'
            'libgabe: for Attribute-Based Encryption'
            'libpabc: for re:claimID zero-knowledge privacy credentials'
            'texi2mdoc: for automatic mdoc generation')
backup=("etc/${pkgname}.conf")
options=('!makeflags')
source=("ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig}
        "${pkgname}-system.service"
        "${pkgname}-user.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('d62669a8f41e078eaa220ce77a32f4f3f801e3099357ae8c705498fe73884ec5'
            'SKIP'
            '163818b89beddcaf78937daba5bdf0ae060b2975de0731aa13d1ccdd813cf262'
            '60caee20b53bcc69522556b35ac3d35d89e28c49b9a22a2ed5121df4a2c33be5'
            '66299dbbdd0219d2f5f0520e69fc094f38f789724d973c2f63a421257ea4f755'
            '842d800e06bf4e32398f7edf429d3e078c7fdee231f646df5209cfe0a1caacf9')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	export GNUNET_PREFIX='/usr/lib'

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix='/usr' --enable-experimental
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
			-printf '\n\n# For the default values of the the following lines please refer to\n# /%p\n\n' \
			-exec cat '{}' ';')
	} > "${pkgdir}/etc/${pkgname}.conf"

}

