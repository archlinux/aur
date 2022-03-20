# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=2.2.0
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=('any')
url='https://github.com/googleapis/python-storage'
license=('Apache')
depends=(
	'python-google-api-core'
	'python-google-auth'
	'python-google-cloud-core'
	'python-google-resumable-media'
	'python-protobuf'
	'python-requests')
makedepends=(
	'python-build'
	'python-installer'
	'python-recommonmark'
	'python-setuptools'
	'python-sphinx'
	'python-wheel')
# checkdepends=('python-pytest-runner' 'python-mock' 'python-google-cloud-testutils')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a84b9744ffd97b2a56381e8c688b09083ccaece516880db8b337131be1f4acc5')

build() {
	cd "python-storage-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	PYTHONPATH=../ sphinx-build -b man ./ build
}

## tests require set environment variables
# check() {
# 	cd "python-storage-$pkgver"
# 	python setup.py pytest
# }

package() {
	export PYTHONHASHSEED=0
	cd "python-storage-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/build/google-cloud-storage.1 -t "$pkgdir/usr/share/man/man1/"
}
