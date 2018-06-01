# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=matrix-synapse-git
pkgver=0.30.0.r82.gc2c3092cc
pkgrel=1

pkgdesc="Matrix reference homeserver"
url="https://github.com/matrix-org/synapse"
arch=('any')
license=('Apache')

depends=('python2-jsonschema' 'python2-twisted' 'python2-service-identity'
         'python2-pyopenssl' 'python2-yaml' 'python2-pyasn1' 'python2-pynacl'
         'python2-daemonize' 'python2-bcrypt' 'python2-frozendict'
         'python2-pillow' 'python2-pydenticon' 'python2-ujson' 'python2-blist'
         'python2-pysaml2' 'python2-setuptools'
         'python2-systemd' 'python2-unpaddedbase64' 'python2-canonicaljson'
         'python2-signedjson' 'python2-pymacaroons-pynacl'
         'python2-service-identity' 'python2-msgpack'
         'python2-phonenumbers' 'python2-affinity' 'python2-sortedcontainers'
         'python2-jinja' 'python2-prometheus_client'
         'systemd')
makedepends=('python2-mock' 'git')
optdepends=('python2-psycopg2: PostgreSQL support (instead of built-in SQLite)'
            'python2-netaddr: URL previewing'
            'python2-jinja: e-mail notifications'
            'python2-bleach: e-mail notifications'
            'python2-matrix-synapse-ldap3: LDAP support'
            'python2-psutil: metrics'
	    'python2-matrix-angular-sdk-git: built-in web client (UNMAINTAINED)')

source=("git://github.com/matrix-org/synapse.git#branch=develop"
        'sysusers-synapse.conf')

md5sums=('SKIP'
         'ecd9f66fb57fe1a2e1e2df07a460a35b')

backup=('etc/synapse/log_config.yaml')
install='synapse.install'

provides=('matrix-synapse')
conflicts=('matrix-synapse')

pkgver() {
	cd synapse
	git describe --long --tags | sed 's/^v//;s/-rc/rc/;s/-r/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#	cd synapse
#}

build() {
	cd synapse
	python2 setup.py build 
}

package() {
	cd synapse
	python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build

	for file in "${pkgdir}/usr/lib/python2.7/site-packages/synapse"/{app,push}/*.py; do
		sed -re 's|env python$|&2.7|' -i "${file}"
	done

	install -dm755 -o 198 -g 198 "$pkgdir"/etc/synapse
	install -Dm644 contrib/systemd/log_config.yaml "$pkgdir"/etc/synapse/log_config.yaml
	install -Dm644 contrib/systemd/synapse.service "$pkgdir"/usr/lib/systemd/system/synapse.service
	install -Dm644 "$srcdir"/sysusers-synapse.conf "$pkgdir"/usr/lib/sysusers.d/synapse.conf
}
