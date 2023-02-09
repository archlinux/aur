# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=matrix-synapse-git
pkgver=1.76.0.r0.geafdb12dd8
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
	'python-matrix-common'
	'python-packaging'
	'python-importlib-metadata'
	'systemd'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-poetry'
	'python-setuptools-rust'
)
checkdepends=(
	'python-pip'
	'python-authlib'
	'python-lxml'
	'python-pyjwt'
        'python-txredisapi'
	'python-hiredis'
	'python-parameterized'
	'python-idna'
)
optdepends=(
	'perl: sync_room_to_group.pl'
	'python-psycopg2: PostgreSQL support'
	'python-pysaml2: SAML2 support'
	'python-authlib: OIDC support'
	'python-lxml: URL previewing'
	'python-sentry_sdk: Sentry support'
	'python-opentracing: tracing support'
	'python-jaeger-client: tracing support'
	'python-pyjwt: JWT support'
	'python-txredisapi: worker communication via Redis'
	'python-hiredis: faster worker communication via Redis'
	'python-pympler: experimental `caches.track_memory_usage` config option'
	'python-matrix-synapse-ldap3: LDAP provider'
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
	'0001-Allow-poetry-core-1.5.0.patch'
)

md5sums=('SKIP'
         '2ef84c75b422b701d60abb0f07dfa7cb'
         '86f5af69a6123d913c97acc6e1738aa1'
         'eb0191dd772ec34efa160febef726be2'
         'ea198d6265d626af4a4c143bf3df9a66'
         'ecd9f66fb57fe1a2e1e2df07a460a35b'
         'e961c9ecad84a70345a57a7e9e6d5b09'
         'e93ce7c015b3617f71c0fe2a4879f0e5'
         'fff51882ef8f578a6834f488c9687aa6')

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
	rm -f dist/*
	python -m build --wheel --no-isolation
}

check() {
	cd synapse
	rm -rf venv
	python -m venv venv --system-site-packages
	venv/bin/python -m installer dist/*.whl
	# FIXME for some reason, python does not want to load synapse_rust.so whwn cwd == project root
	( cd venv; ln -sf ../tests; bin/python -m twisted.trial -j$(nproc) tests )
}

package() {
	cd synapse
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -dm755 -o 198 -g 198 "$pkgdir"/etc/synapse
	install -vDm644 contrib/systemd/log_config.yaml "$pkgdir"/etc/synapse/log_config.yaml
	install -vDm644 "$srcdir"/generic_worker.yaml.example "$pkgdir"/etc/synapse/workers/generic_worker.yaml.example

	install -vDm644 "$srcdir/override-hardened.conf" -t "$pkgdir/usr/lib/systemd/system/synapse.service.d"
	install -vDm644 "$srcdir/override-hardened.conf" -t "$pkgdir/usr/lib/systemd/system/synapse-worker@.service.d"
	install -vDm644 -t "$pkgdir"/usr/lib/systemd/system/ "$srcdir"/synapse{,-worker@}.service "$srcdir"/synapse.target
	install -vDm644 "$srcdir"/sysusers-synapse.conf "$pkgdir"/usr/lib/sysusers.d/synapse.conf
	install -vDm644 "$srcdir"/tmpfiles-synapse.conf "$pkgdir"/usr/lib/tmpfiles.d/synapse.conf
}
