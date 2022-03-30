# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-cloud-bigquery-storage
pkgver=2.13.0
pkgrel=1
pkgdesc="BigQuery Storage API client library"
arch=('any')
url="https://github.com/googleapis/python-bigquery-storage"
license=('Apache')
depends=('python-google-api-core' 'python-grpcio' 'python-proto-plus')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-recommonmark')
optdepends=(
	'python-arrow: pyarrow support'
	'python-fastavro: fastavro support'
	'python-pandas: pandas support')
# checkdepends=(
# 	'python-pytest'
# 	'python-freezegun'
# 	'python-google-cloud-bigquery'
# 	'python-google-cloud-testutils')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bf72897eed3ecf5224342cb7cb7987eb13c9877ab4b5f925cb7b5bf2955a247a')

build() {
	cd "python-bigquery-storage-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	PYTHONPATH=../ sphinx-build -b man ./ _build
}

## FIXME: test plugins conflict
# check() {
# 	cd "python-bigquery-storage-$pkgver"
# 	PYTHONPATH="$PWD" pytest -x --disable-warnings
# }

package() {
	export PYTHONHASHSEED=0
	cd "python-bigquery-storage-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/_build/google-cloud-bigquery-storage.1 -t "$pkgdir/usr/share/man/man1/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/google_cloud_bigquery_storage-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
