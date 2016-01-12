# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=matrix-synapse
_pkgver=0.12.0
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="Matrix reference homeserver"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/synapse"
depends=('python2-twisted>=15.1.0' 'python2-service-identity'
         'python2-pyopenssl' 'python2-yaml' 'python2-pyasn1' 'python2-pynacl'
         'python2-daemonize' 'python2-py-bcrypt' 'python2-frozendict'
         'python2-pillow' 'python2-pydenticon' 'python2-ujson' 'python2-blist'
         'python2-pysaml2' 'python2-requests' 'python2-dateutil' 'python2-pytz'
         'python2-systemd' 'python2-matrix-angular-sdk' 'python2-unpaddedbase64'
         'python2-canonicaljson' 'python2-signedjson' 'python2-pymacaroons-pynacl')
makedepends=('python2-twisted' 'python2-mock' 'python2-setuptools_trial')
source=("git://github.com/matrix-org/synapse#tag=v$_pkgver"
		'sysusers-synapse.conf')
md5sums=('SKIP'
         'dfbffdd307c5559357a2ff51a1906700')
backup=('etc/synapse/log_config.yaml')
install='synapse.install'

build() {
	cd "synapse"
	python2 setup.py build 
}

package() {
	cd "synapse"
	python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build

	for file in "$pkgdir/usr/lib/python2.7/site-packages/synapse"/{app,push}/*.py; do
		sed -re 's|env python$|&2.7|' -i "$file"
	done

	install -Dm644 "contrib/systemd/log_config.yaml" \
		"$pkgdir/etc/synapse/log_config.yaml"

	install -Dm644 "contrib/systemd/synapse.service" \
		"$pkgdir/usr/lib/systemd/system/synapse.service"

	install -Dm644 "$srcdir/sysusers-synapse.conf" \
		"$pkgdir/usr/lib/sysusers.d/synapse.conf"
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
