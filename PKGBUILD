# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=matrix-synapse-git
_pkgname=matrix-synapse
pkgver=1.99.0.r4.g2927008e48
pkgrel=1
pkgdesc="Matrix reference homeserver"
url="https://github.com/element-hq/synapse"
arch=('x86_64')
license=('AGPL-3.0-or-later')
depends=(
	'libwebp'
	'python-jsonschema'
	'python-immutabledict'
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

source=(
	"$_pkgname::git+https://github.com/element-hq/synapse.git#branch=master"
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
validpgpkeys=('02450A9EDDFEE3E0C730B786A7E4A57880C3A4A9'
              '053191DFF4670330465227F7A542E4ED1B0FAC09'
              '283F86EA415D64E7D98E085BD5804497C6468FC1'
              '58C4E75BC67C92169A7FDD11FBCE0ACE0732186F'
              '9323BC4F687435CA8D0F03CB922F57ACB93AABF9'
              '93B2970FB2FD8855AD6E0229CB2B33F7C23D44C6'
              'D79D3CA0B61429A8A760525A903ECE108A39DEDD'
              'F124520CEEE062448FE1C8442D2EFA2F32FBE047'
              '177B595E4DFCB510C556750833FC58F6A7113048')

provides=('matrix-synapse')
conflicts=('matrix-synapse')
replaces=('matrix-synapse-py3-git')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/-rc/rc/;s/-r/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	# allow any poetry-core to be used
	sed -r 's/poetry-core>=([0-9.]+),<=([0-9.]+)/poetry-core>=\1/' -i pyproject.toml
	# allow any setuptools_rust to be used
	sed -r 's/setuptools_rust>=([0-9.]+),<=([0-9.]+)/setuptools_rust>=\1/' -i pyproject.toml
}

build() {
	cd $_pkgname
	python -m build --wheel --no-isolation
}

check() {
	cd $_pkgname
	local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	pushd build/lib.linux-$CARCH-cpython-${python_version}
	ln -sv ../../tests .
	PYTHONPATH="$PWD" PATH="../../test-env/bin:$PATH" ../../test-env/bin/python -m twisted.trial -j$(nproc) tests
	rm -r tests _trial_temp
	popd
}

package() {
	cd $_pkgname
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
