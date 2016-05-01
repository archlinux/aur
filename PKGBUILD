# Maintainer: crystaly <crystaly [ at ] posteo [ dot ] de>
pkgname=spotify-connect-web
pkgver=r55.979f510
pkgrel=1
pkgdesc="Simple Web client for accessing Spotify connect api (Raspberry Pi 2)"
arch=('any')
url="https://github.com/chukysoria/spotify-connect-web"
license=('Apache')
groups=()
depends=('python2-flask' 'python2-flask-bootstrap' 'python2-flask-cors' 'python2-pyalsaaudio' 'python2-gevent' 'python2-cffi' 'python2-pycparser' 'python2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install="${pkgname}.install"
source=('git+https://github.com/chukysoria/spotify-connect-web#branch=master'
	'spotify-connect-web@.service'
	'spotify-connect-web.install')
noextract=()
sha256sums=('SKIP'
            '42a8a539419e6841cb3b00570ca998f884eae899b4275a072ce5e8c57bf23527'
            'b70e8014ef0bc217e8837d8979930d2f1d2ff3cfd18aff8e117f8e9736e9789e')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# fix volmin/volmax parameters not being applied
	sed -i 's|.mixer_load()|.mixer_load(self.args.mixer, self.args.volmin, self.args.volmax)|g' connect_console.py

	# replace python by python2
	sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|g' *.py

}

build() {
	cd "$srcdir/${pkgname%-git}"
	python2 -m compileall *.py
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# copy app files
	install -d -m755 "${pkgdir}/usr/lib/${pkgname}"
	install -D -m 644 *.py *.pyc "${pkgdir}/usr/lib/${pkgname}"
	
	install -D -m644 "$srcdir/spotify-connect-web@.service" "${pkgdir}/usr/lib/systemd/system/spotify-connect-web@.service"

	# copy static files
	cp -r static "${pkgdir}/usr/lib/${pkgname}/"
	cp -r templates "${pkgdir}/usr/lib/${pkgname}/"

}
