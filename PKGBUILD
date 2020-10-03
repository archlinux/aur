# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=matrix-synapse-git
pkgver=1.21.0rc2.r9.ge3debf968
pkgrel=1

pkgdesc="Matrix reference homeserver"
url="https://github.com/matrix-org/synapse"
arch=('any')
license=('Apache')

depends=(
	'python-jsonschema'
	'python-frozendict'
	'python-unpaddedbase64'
	'python-canonicaljson'
	'python-signedjson'
	'python-pynacl'
	'python-idna'
	'python-service-identity'
	'python-twisted'
	'python-treq'
	'python-pyopenssl'
	'python-yaml'
	'python-pyasn1'
	'python-pyasn1-modules'
	'python-bcrypt'
	'python-pillow'
	'python-sortedcontainers'
	'python-pymacaroons'
	'python-msgpack'
	'python-phonenumbers'
	'python-prometheus_client'
	'python-attrs'
	'python-netaddr'
	'python-jinja'
	'python-bleach'
	'python-typing-extensions'

	'python-systemd'
	'systemd'
)
makedepends=(
	'git'
	'python-setuptools'
)
checkdepends=(
	'python-mock'
	'python-parameterized'
	'python-lxml'
	'python-authlib'
	'python-pyjwt'
)
optdepends=(
	'python-matrix-synapse-ldap3: LDAP3 auth provider'
	'python-psycopg2: PostgreSQL support'
	"python-txacme: ACME support (Let's Encrypt)"
	'python-pysaml2: SAML2 support'
	'python-authlib: OIDC support'
	'python-lxml: URL previewing'
	'python-sentry_sdk: Sentry support'
	'python-jaeger-client: tracing support'
	'python-opentracing: tracing support'
	'python-pyjwt: JWT support'
	'python-txredisapi: worker communication via Redis'
	'python-hiredis: worker communication via Redis (faster)'
)

source=("git+https://github.com/matrix-org/synapse.git#branch=develop"
        'synapse.service'
        'sysusers-synapse.conf')


md5sums=('SKIP'
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
