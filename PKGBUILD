# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=matrix-synapse-git
pkgver=1.79.0.r0.g8b1af08c6e
_pkgname=matrix-synapse
pkgrel=1
pkgdesc="Matrix reference homeserver"
url="https://github.com/matrix-org/synapse"
arch=('x86_64')
license=('Apache')
depends=(
	'libwebp'
	'python-jsonschema'
	'python-frozendict'
	'python-unpaddedbase64'
	'python-canonicaljson'
	'python-signedjson'
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
	'python-matrix-common'
	'python-packaging'
	'python-importlib-metadata'
	'python-pydantic'
	'python-systemd'
	'systemd'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-poetry-core'
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
	'python-pyicu'
	'postgresql'
)
optdepends=(
	'perl: sync_room_to_group.pl'
	'python-psycopg2: PostgreSQL support'
	'python-pysaml2: SAML2 support'
	'python-authlib: OIDC support'
	'python-authlib: JWT support'
	'python-lxml: URL previewing'
	'python-sentry_sdk: Sentry support'
	'python-opentracing: tracing support'
	'python-jaeger-client: tracing support'
	'python-txredisapi: worker communication via Redis'
	'python-hiredis: faster worker communication via Redis'
	'python-pympler: experimental `caches.track_memory_usage` config option'
	'python-matrix-synapse-ldap3: LDAP provider'
	'python-pyicu: Improve user search for international display names'
)
optdepends=('perl: sync_room_to_group.pl'
            'python-psycopg2: PostgreSQL support'
            'python-lxml: URL previewing'
            'python-psutil: metrics'
            'python-pyjwt: jwt'
            'python-txredisapi: redis'
            'python-hiredis'
            'python-pyicu: Improve user search for international display names')

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

sha256sums=('SKIP'
            'f67334856609997eac26939d77cfc520e78e98d3755543ab730d83a0f362a35e'
            '74af0bc2f57e5ced1a44f2438922d420cbb7defedae784cac02ef125f276a2ed'
            '408527271e1250beb20531f140b91201ed464e42f7eb3f47f02967a2ac23a661'
            'c9657c201ad89985c8c915bfa0ea7517a412071736b4d9545d8f6474fddc44e2'
            'aadfdd78fe73e6eb325ee4299b8db8b97bfa2f4e7df953aa8477f442598a7ec5'
            '65588c8c64dfb84cab831cd8d028a295d753cf7322dd63053e8488466047b45f'
            'd8e6b2a43a8a7d8f09c643f32e789a7ffeeb2d20bb07ee88ddc6923e1ab3b0e6')
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
	# allow any poetry-core to be used
	sed -r 's/poetry-core>=1.0.0,<=([0-9.]+)/poetry-core>=1.0.0/' -i pyproject.toml
}

build() {
	cd synapse
	rm -f dist/*
	python -m build --wheel --no-isolation
}

check() {
	cd synapse
	local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	rm -rf test-env
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	( cd build/lib.linux-$CARCH-cpython-${python_version}
	ln -sv ../../tests -ft .
	PYTHONPATH="$PWD" PATH="../../test-env/bin:$PATH" ../../test-env/bin/python -m twisted.trial -j$(nproc) tests
	rm -r tests _trial_temp
	)
}

package() {
	cd synapse
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -vdm755 -o 198 -g 198 "$pkgdir"/etc/synapse
	install -vDm644 contrib/systemd/log_config.yaml "$pkgdir"/etc/synapse/log_config.yaml
	install -vDm644 "$srcdir"/generic_worker.yaml.example "$pkgdir"/etc/synapse/workers/generic_worker.yaml.example

	install -vDm644 "$srcdir/override-hardened.conf" -t "$pkgdir/usr/lib/systemd/system/synapse.service.d"
	install -vDm644 "$srcdir/override-hardened.conf" -t "$pkgdir/usr/lib/systemd/system/synapse-worker@.service.d"
	install -vDm644 -t "$pkgdir"/usr/lib/systemd/system/ "$srcdir"/synapse{,-worker@}.service "$srcdir"/synapse.target
	install -vDm644 "$srcdir"/sysusers-synapse.conf "$pkgdir"/usr/lib/sysusers.d/synapse.conf
	install -vDm644 "$srcdir"/tmpfiles-synapse.conf "$pkgdir"/usr/lib/tmpfiles.d/synapse.conf
}
