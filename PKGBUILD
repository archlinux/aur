# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=anki-sync-server-git
pkgver=2.0.6.g4391731
pkgrel=1
pkgdesc='A personal Anki sync server (so you can sync against your own server rather than AnkiWeb)'
url='https://github.com/dsnopek/anki-sync-server'
license=('GPL')
provides=('anki-sync-server')
conflicts=('anki-sync-server')
depends=('python2' 'python2-webob' 'python2-sqlalchemy' 'python2-simplejson' 'python2-paste-script' 'anki') # TODO Replace anki with libanki
makedepends=('patch' 'python2-setuptools')
backup=('etc/webapps/anki-sync-server/production.ini' 'etc/webapps/anki-sync-server/logging.conf')
source=("git://github.com/dsnopek/${pkgname%-git}"
        'ankiserverctl.py.patch'
        "${pkgname%-git}.service")
sha512sums=('SKIP'
            'f247d0b64a8d9df9b636e1e8f9fe8894982f3a26e0cf9297cebcb8bf51b7526e451e495e15c7f1cc1c250c265d44723f710c8a13d5cabeede4ebe222d3e3dff0'
            '1d0666f17c181b4946fd37cc5d323a53d674b0b7e330eac515f4bea74e726162bd357b51e00bf162de7f2229aabec6859363f8c4aa7ce5e8e1974d72661b2860')
arch=('any')
install="${pkgname%-git}.install"

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --tags --always | sed 's/-[[:digit:]]*-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	patch -p0 -i "${srcdir}/ankiserverctl.py.patch"
}

package() {
	cd "${srcdir}/${pkgname%-git}"

	python2 setup.py install --root="${pkgdir}/" --optimize=1

	install -dm755 "${pkgdir}/etc/webapps/anki-sync-server"
	install -dm755 "${pkgdir}/var/lib/anki-sync-server"
	install -Dm644 "${srcdir}/anki-sync-server.service" "${pkgdir}/usr/lib/systemd/system/anki-sync-server.service"
	# Sanatize paths
	mv "${pkgdir}/usr/bin/ankiserverctl.py" "${pkgdir}/usr/bin/ankiserverctl"
	mv "${pkgdir}/usr/examples/example.ini" "${pkgdir}/etc/webapps/anki-sync-server/production.ini"
	mv "${pkgdir}/usr/examples/logging.conf" "${pkgdir}/etc/webapps/anki-sync-server/"
	# Remove useless files and directories
	rm -r "${pkgdir}/usr/examples" "${pkgdir}/usr/anki-bundled"
	# Fix paths
	sed -i \
		-e 's:logging.conf$:/etc/webapps/anki-sync-server/logging.conf:g' \
		-e 's:./collections:/var/lib/anki-sync-server/collections:g' \
		-e 's:./session.db:/var/lib/anki-sync-server/session.db:g' \
		-e 's:./auth.db:/var/lib/anki-sync-server/auth.db:g' \
		"${pkgdir}/etc/webapps/anki-sync-server/production.ini"
}

