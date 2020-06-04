# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=matrix-synapse-git
pkgver=1.14.0.r1.g38c1fdb14
pkgrel=1

pkgdesc="Matrix reference homeserver"
url="https://github.com/matrix-org/synapse"
arch=('any')
license=('Apache')

depends=('python-jsonschema' 'python-twisted' 'python-service-identity'
         'python-pyopenssl' 'python-yaml' 'python-pyasn1' 'python-pynacl'
         'python-daemonize' 'python-bcrypt' 'python-frozendict'
         'python-pillow' 'python-ujson'
         'python-pysaml2' 'python-setuptools'
         'python-systemd' 'python-unpaddedbase64' 'python-canonicaljson'
         'python-signedjson' 'python-pymacaroons'
         'python-service-identity' 'python-msgpack'
         'python-phonenumbers' 'python-prometheus_client'
         'python-attrs' 'python-netaddr' 'python-sortedcontainers'
         'python-treq' 'python-psutil' 'python-sdnotify' 'python-jinja'
         'python-bleach' 'python-psutil' 'python-typing-extensions'
         'python-idna' 'python-pyasn1-modules' 'python-six'
         'systemd')
makedepends=('git')
checkdepends=('python-lxml' 'python-mock' 'python-parameterized' 'python-authlib')
optdepends=('python-matrix-synapse-ldap3: LDAP3 auth provider'
            'python-psycopg2: PostgreSQL support'
            "python-txacme: ACME support (Let's Encrypt)"
            'python-pysaml2: SAML2 support'
            'python-authlib: OIDC support'
            'python-lxml: URL previewing'
            'python-sentry_sdk: Sentry support'
            'python-pyjwt: JWT support'
            'python-txredisapi: worker communication via Redis'
            'python-hiredis: worker communication via Redis (faster)')

source=("git+https://github.com/matrix-org/synapse.git#branch=master"
        '0001-synapse-python_dependencies.py-permit-prometheus_cli.patch'
        'synapse.service'
        'sysusers-synapse.conf')


md5sums=('SKIP'
         'bcbaf40db1116b0c4ec4e1dc8f5e89b6'
         'c4352682c5fb5eb0440ceb54a20ac4cb'
         'ecd9f66fb57fe1a2e1e2df07a460a35b')

backup=('etc/synapse/log_config.yaml')
install=synapse.install

provides=('matrix-synapse')
conflicts=('matrix-synapse')
replaces=('matrix-synapse-py3-git')

pkgver() {
	cd synapse
	git describe --long --tags | sed 's/^v//;s/-rc/rc/;s/-r/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
        cd synapse
        for p in "${source[@]}"; do
                if [[ $p == *.patch ]]; then
                        git apply -3 "$srcdir/$p"
                fi
        done
}

build() {
	cd synapse
	python setup.py build
}

check() {
	cd synapse
	PYTHONPATH=. trial3 tests
}

package() {
	install -Dm644 synapse.service "$pkgdir"/usr/lib/systemd/system/synapse.service

	cd synapse
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build

	install -dm755 -o 198 -g 198 "$pkgdir"/etc/synapse
	install -Dm644 contrib/systemd/log_config.yaml "$pkgdir"/etc/synapse/log_config.yaml
	install -Dm644 "$srcdir"/sysusers-synapse.conf "$pkgdir"/usr/lib/sysusers.d/synapse.conf
}
