# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
_pkg=python-storage
pkgver=2.5.0
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
sha256sums=('576a880584e997b61172256ef53f013b24d9111274cfac3a33fb1e23d3ba81bd')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD" sphinx-build -b man docs/ docs/build
}

## tests require set environment variables
# check() {
# 	cd "python-storage-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/build/google-cloud-storage.1 -t "$pkgdir/usr/share/man/man1/"
}
