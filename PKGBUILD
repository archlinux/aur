# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

pkgname='gnunet'
pkgver='0.15.0'
pkgrel=9
pkgdesc='A framework for secure peer-to-peer networking'
arch=('i686' 'x86_64')
url="http://${pkgname}.org"
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('bash' 'which' 'gnutls' 'gnurl' 'libgcrypt' 'libunistring' 'libidn2'
	'libmicrohttpd' 'jansson' 'nss' 'libtool' 'sqlite' 'zlib' 'libsodium'
	'openssl' 'libextractor' 'brotli' 'gettext')
makedepends=('pkgconfig' 'libtool' 'bluez-libs' 'python' 'libpulse'
             'opus')
optdepends=('bluez: for bluetooth transport'
            'libzbar: for reading/writing GNUnet URIs from/to QR codes using gnunet-qr'
            'texlive-core: for generating GNS business cards via gnunet-bcd'
            'miniupnpc: for NAT uPnP support'
	    'libpulse: for conversation service'
	    'opus: for conversation service'
            'pbc: for Attribute-Based Encryption (experimental)'
            'libgabe: for Attribute-Based Encryption (experimental)'
            'libpabc: for re:claimID zero-knowledge privacy credentials')
backup=("etc/${pkgname}.conf")
options=('!makeflags')
source=("http://ftpmirror.gnu.org/gnunet/${pkgname}-${pkgver}.tar.gz"{,.sig}
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
validpgpkeys=('19647543F7861D3BF4E64FF7BF60708B48426C7E'
              '3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('cca23d6fb40890a5eb2ccae4b8f7e74c8e4e84d3fca2f419d775cb4a58dd9a67'
            'SKIP'
            '577a6fd803d7f2a00380a200778dc0515efb26011e5b8ea4888554e7216a9042'
            '66299dbbdd0219d2f5f0520e69fc094f38f789724d973c2f63a421257ea4f755'
            'aa82707160c57e77ab3c426d16177283eb8d0bc018c04dcba3db689e6bea835f')

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
	install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

	install -dm755 "${pkgdir}/usr/lib/sysusers.d"
	install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

	install -dm755 "${pkgdir}/usr/lib/tmpfiles.d"
	install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -dm755 "${pkgdir}/etc"

	# Automatically generate a configuration file using the content of
	# `/usr/share/gnunet/config.d/` as model; in this way we can ensure
	# that this configuration file is the one backed up with each update,
	# while `/usr/share/gnunet/config.d/` is kept as immutable default
	# configuration.
	{
		echo "# /etc/${pkgname}.conf"
		(cd "${pkgdir}" > /dev/null 2>&1 && find "usr/share/${pkgname}/config.d" -type f -name '*.conf' \
			-printf '\n\n# The following lines have been copied from /%p\n\n' \
			-exec cat '{}' ';')
	} > "${pkgdir}/etc/${pkgname}.conf"

}

