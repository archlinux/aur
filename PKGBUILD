# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=matrix-synapse-py3-git
pkgver=0.33.8.r130.gdb5a1c059
pkgrel=1

pkgdesc="Matrix reference homeserver"
url="https://github.com/matrix-org/synapse"
arch=('any')
license=('Apache')

depends=('python-jsonschema' 'python-twisted' 'python-service-identity'
         'python-pyopenssl' 'python-yaml' 'python-pyasn1' 'python-pynacl'
         'python-daemonize' 'python-bcrypt' 'python-frozendict'
         'python-pillow' 'python-pydenticon' 'python-ujson' 'python-blist'
         'python-pysaml2' 'python-setuptools'
         'python-systemd' 'python-unpaddedbase64' 'python-canonicaljson'
         'python-signedjson' 'python-pymacaroons-pynacl'
         'python-service-identity' 'python-msgpack'
         'python-phonenumbers' 'python-sortedcontainers'
         'python-jinja' 'python-prometheus_client' 'python-netaddr'
         'python-treq' 'python-psutil'
         'systemd')
makedepends=('python-mock' 'git')
optdepends=('python-psycopg2: PostgreSQL support (instead of built-in SQLite)'
            'python-netaddr: URL previewing'
            'python-jinja: e-mail notifications'
            'python-bleach: e-mail notifications'
            'python-matrix-synapse-ldap3: LDAP support'
            'python-psutil: metrics'
	    'python-matrix-angular-sdk-git: built-in web client (UNMAINTAINED)')

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
	python setup.py build 
}

package() {
	cd synapse
	python3 setup.py install --root "${pkgdir}" --optimize=1 --skip-build

	for file in "${pkgdir}"/usr/lib/python3.*/site-packages/synapse/{app,push}/*.py; do
		sed -re 's|env python$|&3|' -i "${file}"
	done

	install -dm755 -o 198 -g 198 "$pkgdir"/etc/synapse
	install -Dm644 contrib/systemd/log_config.yaml "$pkgdir"/etc/synapse/log_config.yaml
	install -Dm644 contrib/systemd/synapse.service "$pkgdir"/usr/lib/systemd/system/synapse.service
	install -Dm644 "$srcdir"/sysusers-synapse.conf "$pkgdir"/usr/lib/sysusers.d/synapse.conf
}
