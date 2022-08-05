# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

_appname='gnunet'
pkgname="${_appname}-git"
pkgver=0.17.2.r22.g8582b511a
pkgrel=1
pkgdesc='A framework for secure peer-to-peer networking'
arch=('i686' 'x86_64')
url="http://${_appname}.org"
license=('AGPL')
conflicts=("${_appname}" "${_appname}-bin")
provides=("${_appname}")
depends=('brotli' 'gettext' 'gnurl' 'gnutls' 'iptables' 'jansson'
         'libextractor' 'libgcrypt' 'libidn2' 'libmicrohttpd' 'libsodium'
         'libtool' 'libunistring' 'miniupnpc' 'nss' 'openssl' 'sqlite' 'which'
         'zlib')
makedepends=('bluez-libs' 'gettext' 'git' 'libpulse' 'libtool' 'opus'
             'pkgconfig' 'postgresql' 'python' 'python-sphinx'
             'python-sphinx_rtd_theme' 'recutils')
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
backup=("etc/${_appname}.conf")
source=("git+https://git.${_appname}.org/${_appname}.git"
        "${_appname}-system.service"
        "${_appname}.sysusers"
        "${_appname}.tmpfiles"
        "${_appname}-user.conf"
        "${_appname}-user.service")
install="${_appname}.install"
sha256sums=('SKIP'
            '163818b89beddcaf78937daba5bdf0ae060b2975de0731aa13d1ccdd813cf262'
            '66299dbbdd0219d2f5f0520e69fc094f38f789724d973c2f63a421257ea4f755'
            '5c34e1ecc6208900426f8e399e8c3edbef12cce19eba605fd7364ddb3547d9f0'
            '3f17b9ed2c1f8cc0f919fe477df99678c17778a31f1eeb56517e285e3cef30f2'
            '60caee20b53bcc69522556b35ac3d35d89e28c49b9a22a2ed5121df4a2c33be5')

pkgver() {

	cd "${_appname}" > /dev/null 2>&1
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {

	cd "${srcdir}/${_appname}"

	export GNUNET_PREFIX='/usr/lib'
	./bootstrap

}

build() {

	cd "${srcdir}/${_appname}"

	./configure --prefix='/usr' --enable-experimental
	make
	make -C contrib

}

package() {

	cd "${srcdir}/${_appname}"

	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" -C contrib install

	install -dm755 "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/${_appname}-system.service" \
		"${pkgdir}/usr/lib/systemd/system/${_appname}.service"

	install -dm755 "${pkgdir}/usr/lib/systemd/user"
	install -Dm644 "${srcdir}/${_appname}-user.service" \
		"${pkgdir}/usr/lib/systemd/user/${_appname}.service"

	install -dm755 "${pkgdir}/usr/lib/sysusers.d"
	install -Dm644 "${srcdir}/${_appname}.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"

	install -dm755 "${pkgdir}/usr/lib/tmpfiles.d"
	install -Dm644 "${srcdir}/${_appname}.tmpfiles" \
		"${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

	install -dm700 "${pkgdir}/etc/skel/.config"
	install -Dm600 "${srcdir}/${_appname}-user.conf" \
		"${pkgdir}/etc/skel/.config/${_appname}.conf"

	# Automatically generate a configuration file using the content of
	# `/usr/share/gnunet/config.d/` as model; in this way we can ensure
	# that this configuration file is the one backed up with each update,
	# while `/usr/share/gnunet/config.d/` is kept as immutable default
	# configuration.

	install -dm755 "${pkgdir}/etc"

	{
		echo "# /etc/${_appname}.conf"
		(cd "${pkgdir}" > /dev/null 2>&1 && find "usr/share/${_appname}/config.d" -type f -name '*.conf' \
			-printf '\n\n# For the default values of the the following lines please refer to\n# /%p\n\n' \
			-exec cat '{}' ';')
	} > "${pkgdir}/etc/${_appname}.conf"

}

