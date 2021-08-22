# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

_appname='gnunet'
pkgname="${_appname}-git"
pkgver='0.15.0.r29764.9ef7f0704'
pkgrel=3
pkgdesc="A framework for secure peer-to-peer networking"
arch=('i686' 'x86_64')
url="http://${_appname}.org"
license=('AGPL3')
conflicts=("${_appname}" "${_appname}-bin")
provides=("${_appname}")
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
        "${_appname}.tmpfiles")
sha256sums=('SKIP'
            '81310f5df1790d9e4d806ac2ed9fe761b13eeafdae584eb59ec2e8a52b088485'
            '66299dbbdd0219d2f5f0520e69fc094f38f789724d973c2f63a421257ea4f755'
            '4e3f8015dcc83ea4efb913abb9eb7d8d15ba3a5834218634ee2f350b903ef77b')

pkgver() {

	cd "${_appname}"

	printf "'%s.r%s.%s'" \
		"$(grep 'AC_INIT' configure.ac | grep -o '[0-9]\(\.[0-9]\+\)\+')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_appname}"

	export GNUNET_PREFIX='/usr/lib'
	./bootstrap

}

build() {

	cd "${srcdir}/${_appname}"

	test -f Makefile || ./configure --prefix='/usr'
	make
	make -C contrib

}

package() {

	cd "${srcdir}/${_appname}"

	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" -C contrib install

	install -dm755 "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

	install -dm755 "${pkgdir}/usr/lib/sysusers.d"
	install -Dm644 "${srcdir}/${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"

	install -dm755 "${pkgdir}/usr/lib/tmpfiles.d"
	install -Dm644 "${srcdir}/${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

	install -dm755 "${pkgdir}/etc"

	# Automatically generate a configuration file using the content of
	# `/usr/share/gnunet/config.d/` as model; in this way we can ensure
	# that this configuration file is the one backed up with each update,
	# while `/usr/share/gnunet/config.d/` is kept as immutable default
	# configuration.
	{
		echo "# /etc/${_appname}.conf"
		(cd "${pkgdir}" > /dev/null 2>&1 && find "usr/share/${_appname}/config.d" -type f -name '*.conf' \
			-printf '\n\n# The following lines have been copied from /%p\n\n' \
			-exec cat '{}' ';')
	} > "${pkgdir}/etc/${_appname}.conf"

}

