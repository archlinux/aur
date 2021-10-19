# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=matrix-synapse-git
pkgver=1.45.0.r0.g95813ff43c
pkgrel=1

pkgdesc="Matrix reference homeserver"
url="https://github.com/matrix-org/synapse"
arch=('any')
license=('Apache')

depends=(
	'libwebp'
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
	'python-typing_extensions'
	'python-cryptography'
	'python-ijson'
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
        'python-txredisapi'
	'python-hiredis'
)
optdepends=(
	'python-psycopg2: PostgreSQL support'
	'python-pysaml2: SAML2 support'
	'python-authlib: OIDC support'
	'python-lxml: URL previewing'
	'python-sentry_sdk: Sentry support'
	'python-jaeger-client: tracing support'
	'python-opentracing: tracing support'
	'python-pyjwt: JWT support'
	'python-txredisapi: worker communication via Redis'
	'python-hiredis: faster worker communication via Redis'
)

source=(
	"git+https://github.com/matrix-org/synapse.git#branch=master"
        'generic_worker.yaml.example'
        'synapse.service'
        'synapse.target'
        'synapse-worker@.service'
        'sysusers-synapse.conf'
        'tmpfiles-synapse.conf'
        'override-hardened.conf'
)

md5sums=('SKIP'
         '2ef84c75b422b701d60abb0f07dfa7cb'
         '86f5af69a6123d913c97acc6e1738aa1'
         'eb0191dd772ec34efa160febef726be2'
         'ea198d6265d626af4a4c143bf3df9a66'
         'ecd9f66fb57fe1a2e1e2df07a460a35b'
         'e961c9ecad84a70345a57a7e9e6d5b09'
         'e93ce7c015b3617f71c0fe2a4879f0e5')

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
	PYTHONPATH=. trial $MAKEFLAGS tests
}

package() {
	cd synapse
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build

	install -dm755 -o 198 -g 198 "$pkgdir"/etc/synapse
	install -vDm644 contrib/systemd/log_config.yaml "$pkgdir"/etc/synapse/log_config.yaml
	install -vDm644 "$srcdir"/generic_worker.yaml.example "$pkgdir"/etc/synapse/workers/generic_worker.yaml.example

	install -vDm644 -t "$pkgdir"/usr/lib/systemd/system/ "$srcdir"/synapse{,-worker@}.service "$srcdir"/synapse.target
	install -vDm644 "$srcdir/override-hardened.conf" -t "$pkgdir/usr/lib/systemd/system/synapse.service.d"
	install -vDm644 "$srcdir/override-hardened.conf" -t "$pkgdir/usr/lib/systemd/system/synapse-worker@.service.d"
	install -vDm644 "$srcdir"/sysusers-synapse.conf "$pkgdir"/usr/lib/sysusers.d/synapse.conf
	install -vDm644 "$srcdir"/tmpfiles-synapse.conf "$pkgdir"/usr/lib/tmpfiles.d/synapse.conf
}
