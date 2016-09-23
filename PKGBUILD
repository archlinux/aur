# Maintainer: crystaly <crystaly [ at ] posteo [ dot ] de>
pkgname=spotify-connect-web
pkgver=0.0.3.alpha.r8.gf160e43
pkgrel=1
pkgdesc="Simple Web client for accessing Spotify connect api (Raspberry Pi 2)"
arch=('armv7h')
url="https://github.com/Fornoth/spotify-connect-web"
license=('MIT')
groups=()
depends=('python2-flask' 'python2-flask-bootstrap' 'python2-flask-cors' 'python2-pyalsaaudio' 'python2-gevent' 'python2-cffi' 'python2-pycparser' 'python2' 'alsa-utils')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'python2-pyspotify-connect')
replaces=()
backup=()
options=()
install="${pkgname}.install"
source=('git+https://github.com/Fornoth/spotify-connect-web#branch=master'
	'https://github.com/sashahilton00/spotify-connect-resources/raw/master/armhf%20version/libspotify_embedded_shared.so'
	'spotify-connect-web@.service'
	'spotify-connect-web.install')
noextract=()
sha256sums=('SKIP'
            '05a1d441fee75bae6d6b8c94538389e232bea79133cda673e780ca3b97e6a95d'
            '30b31e9688eb621ed3e6f42ce6689ee0ad079ce3aa7354d8d42830255685934a'
            '876ca4593670c1ca9b968e93413b90f51b4d10c325a7dbb313052037e6a9888c')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# replace python by python2
	sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|g' *.py

}

build() {
	cd "$srcdir/${pkgname%-git}"
	python2 -m compileall *.py
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# copy libspotify.so to /usr/lib
	install -D -m644 "$srcdir/libspotify_embedded_shared.so" "${pkgdir}/usr/lib/libspotify_embedded_shared.so"
	
	# copy app files
	install -d -m755 "${pkgdir}/usr/lib/${pkgname}"
	install -D -m 644 *.py *.pyc *.h "${pkgdir}/usr/lib/${pkgname}"
	
	install -D -m644 "$srcdir/spotify-connect-web@.service" "${pkgdir}/usr/lib/systemd/system/spotify-connect-web@.service"

	# copy static files
	cp -r static "${pkgdir}/usr/lib/${pkgname}/"
	cp -r templates "${pkgdir}/usr/lib/${pkgname}/"

}
