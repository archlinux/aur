# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

pkgname='gnunet'
pkgver='0.19.2'
pkgrel=1
pkgdesc='A framework for secure peer-to-peer networking'
arch=('i686' 'x86_64')
url="http://${pkgname}.org"
license=('AGPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('brotli' 'gettext' 'gnutls' 'iptables' 'jansson' 'libcurl-gnutls'
         'libextractor' 'libgcrypt' 'libidn2' 'libmicrohttpd' 'libsodium'
         'libtool' 'libunistring' 'miniupnpc' 'nss' 'openssl' 'sqlite' 'which'
         'zlib')
makedepends=('bluez-libs' 'libpulse' 'libtool' 'opus' 'pkgconfig' 'postgresql'
             'python' 'python-sphinx' 'python-sphinx_rtd_theme')
optdepends=('bluez: for bluetooth transport'
            'gnunet-gtk: for handling the gnunet:// URI scheme'
            'jose: for re:claimID OpenID Connect plugin'
	    'libogg: for conversation service'
            'libpabc: for re:claimID zero-knowledge privacy credentials'
	    'libpulse: for conversation service'
            'mysql: for an alternative to sqlite in the database plugin'
	    'opus: for conversation service'
            'postgresql: for an alternative to sqlite in the database plugin'
            'python: for test suite'
            'texi2mdoc: for automatic mdoc generation'
            'texinfo: for building the documentation'
            'texlive-core: for generating GNS business cards via gnunet-bcd'
            'zbar: for reading/writing QR codes using gnunet-qr')
backup=("etc/${pkgname}.conf")
source=("ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig}
        "${pkgname}-system.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}-user.conf"
        "${pkgname}-user.service")
install="${pkgname}.install"
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('86034d92ebf8f6623dad95f1031ded1466e064b96ffac9d3e9d47229ac2c22ff'
            'SKIP'
            '163818b89beddcaf78937daba5bdf0ae060b2975de0731aa13d1ccdd813cf262'
            '66299dbbdd0219d2f5f0520e69fc094f38f789724d973c2f63a421257ea4f755'
            '5c34e1ecc6208900426f8e399e8c3edbef12cce19eba605fd7364ddb3547d9f0'
            '3f17b9ed2c1f8cc0f919fe477df99678c17778a31f1eeb56517e285e3cef30f2'
            '60caee20b53bcc69522556b35ac3d35d89e28c49b9a22a2ed5121df4a2c33be5')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	export GNUNET_PREFIX='/usr/lib'
	autoreconf -i

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix='/usr' --enable-experimental
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	install -dm755 "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/${pkgname}-system.service" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

	install -dm755 "${pkgdir}/usr/lib/systemd/user"
	install -Dm644 "${srcdir}/${pkgname}-user.service" \
		"${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

	install -dm755 "${pkgdir}/usr/lib/sysusers.d"
	install -Dm644 "${srcdir}/${pkgname}.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

	install -dm755 "${pkgdir}/usr/lib/tmpfiles.d"
	install -Dm644 "${srcdir}/${pkgname}.tmpfiles" \
		"${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -dm700 "${pkgdir}/etc/skel/.config"
	install -Dm600 "${srcdir}/${pkgname}-user.conf" \
		"${pkgdir}/etc/skel/.config/${pkgname}.conf"

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
