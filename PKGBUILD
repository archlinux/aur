# Maintainer: crystaly <crystaly [ at ] posteo [ dot ] de>
pkgname=spotify-connect-web
pkgver=r57.ef8430d
pkgrel=3
pkgdesc="Simple Web client for accessing Spotify connect api (Raspberry Pi 2)"
arch=('armv7h')
url="https://github.com/chukysoria/spotify-connect-web"
license=('unknown')
groups=()
depends=('python2-flask' 'python2-flask-bootstrap' 'python2-pyalsaaudio' 'python2-gevent' 'python2-cffi' 'python2-pycparser' 'python2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install="${pkgname}.install"
source=('git+https://github.com/chukysoria/spotify-connect-web#branch=master'
	'https://github.com/sashahilton00/spotify-connect-resources/raw/master/armhf%20version/libspotify_embedded_shared.so'
	'spotify-connect-web@.service'
	'spotify-connect-web.install'
	'0001-Fix-0.8.patch')
noextract=()
sha256sums=('SKIP'
            '05a1d441fee75bae6d6b8c94538389e232bea79133cda673e780ca3b97e6a95d'
            '2f418748822fb87caf84c603478be9e409651b6a62a5957882138b37b0b37987'
            '876ca4593670c1ca9b968e93413b90f51b4d10c325a7dbb313052037e6a9888c'
            '5cf33136d33b756e9ed55f92d579d4056df3338b58977d058e29b6c63865fba6')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# merge pull-request wich fixes alsaaudio
	git merge ef8430d

	# patch pyalsaaudio 0.8
	patch -p1 -i "$srcdir/0001-Fix-0.8.patch"
	
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
