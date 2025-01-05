# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
_projectname='elasticsearch-dsl-py'
_pkgname='python-elasticsearch-dsl'
pkgname="${_pkgname}7"
pkgver='7.4.1'
pkgrel='1'
pkgdesc='High level Python client for Elasticsearch (legacy 7.* version)'
arch=('any')
url="https://github.com/elastic/$_projectname"
license=('Apache-2.0')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('python>=3.4.0' 'python-dateutil' 'python-elasticsearch>=7.0.0' 'python-elasticsearch<8.0.0' 'python-six')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'fix-deprecations.diff'
)
b2sums=('1cd4705e6bfd50fab69c8bc44b77bae975e911822500bfe4624c945d8edee7e1eb4418ee9a7e85c79ddb21ed403377139709d10e0b2b39cd4a0f303e419943df'
        '3b760a18f783ab57e4115705f7f56616c1440eda197bdc55804f2dc6d065f69ca7a316265341f6f10c87bede4694b05d11d1a0af5426bf85004bd32c91bb8f50')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/fix-deprecations.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run tests, but ignore integration tests, as they require a server
	pytest --ignore=tests/test_integration/
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README' "$pkgdir/usr/share/doc/$pkgname/README"
}
