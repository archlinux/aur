# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

_appname='gnunet'
pkgname="${_appname}-git"
pkgver='0.13.3.r29153.87467c4aa'
pkgrel=1
pkgdesc="A framework for secure peer-to-peer networking"
arch=('i686' 'x86_64')
url="http://${_appname}.org"
license=('GPL')
provides=("${_appname}")
conflicts=("${_appname}")
depends=('gmp' 'libgcrypt' 'libextractor' 'sqlite' 'gnurl' 'libsodium'
	 'libmicrohttpd' 'libunistring' 'libidn' 'jansson' 'zbar')
makedepends=('gettext' 'pkgconfig' 'autoconf' 'gst-plugins-base-libs'
	     'bluez-libs' 'python' 'glpk' 'libpulse' 'git' 'opus')
optdepends=('bluez-libs'
	    'python'
	    'glpk'
	    'libpulse'
	    'opus'
            'gst-plugins-base-libs: for gnunet-helper-audio-record')
backup=('etc/gnunetd.conf')
options=('!makeflags')
install="${_appname}.install"
source=("git+https://${_appname}.org/git/${_appname}.git"
        "${_appname}.service"
        "${_appname}.sysusers"
        "${_appname}.tmpfiles"
        'gnunetd.conf')

sha256sums=('SKIP'
            '2fb156b5bda51ef7c0659ca19113e7c8cd651637ffb379264e2b61f65be367d1'
            '65daa9fb07bdc8b8a11ca06f320b94ce6cfcc9681c6693ac655ca54881645a39'
            '4832e45c02ad768a713ca7f2a04b58794e268a49130b5b8ab6b91917e3d4f945'
            '52185d9f89eab7cdf10b8de4e5b651a854b05cc9d22e0c8139056a945b01f4cc')

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

}

build() {

	cd "${srcdir}/${_appname}"

	test -f Makefile || ./configure --prefix=/usr --without-mysql
	make
	make -C contrib

}

package() {

	cd "${srcdir}/${_appname}"

	install -dm755 "${pkgdir}/etc"
	install -Dm644 "${srcdir}/gnunetd.conf" "${pkgdir}/etc/gnunetd.conf"

	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" -C contrib install

	install -Dm644 "${srcdir}/${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"
	install -Dm644 "${srcdir}/${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
	install -Dm644 "${srcdir}/${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

}

