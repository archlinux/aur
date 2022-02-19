# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-cloud-bigquery
pkgver=2.34.0
pkgrel=1
pkgdesc="Google BigQuery API client library"
arch=('any')
url="https://github.com/googleapis/python-bigquery"
license=('Apache')
depends=(
	'python-dateutil'
	'python-google-api-core'
	'python-google-cloud-core'
	'python-google-resumable-media'
	'python-grpcio'
	'python-packaging'
	'python-proto-plus'
	'python-protobuf'
	'python-requests')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-recommonmark')
optdepends=(
	'python-arrow: pyarrow support'
	'python-pandas: pandas support'
	'python-tqdm: tqdm support'
	'python-fastparquet: fastparquet support'
	'python-snappy: fastparquet support'
	'python-llvmlite: fastparquet support')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8852fa3e4c728928de5ee6fa413423aa828bf5ab8be66106693152e8e86e1538')

build() {
	cd "python-bigquery-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
	cd docs
	PYTHONPATH=../ sphinx-build -b man ./ _build
}

package() {
	export PYTHONHASHSEED=0
	cd "python-bigquery-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/_build/google-cloud-bigquery.1 -t "$pkgdir/usr/share/man/man1/"
}
