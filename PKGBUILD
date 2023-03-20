# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-cloud-bigquery-storage
_pkg='python-bigquery-storage'
pkgver=2.19.0
pkgrel=1
pkgdesc="BigQuery Storage API client library"
arch=('any')
url="https://github.com/googleapis/python-bigquery-storage"
license=('Apache')
depends=('python-google-api-core' 'python-grpcio' 'python-proto-plus' 'python-protobuf')
makedepends=(
	'python-build'
	'python-installer'
	'python-recommonmark'
	'python-setuptools'
	'python-sphinx'
	'python-wheel')
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
sha256sums=('9754419603d2beb97f69c25f24918739008435a4b65e0229d36536df4d443601')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	PYTHONPATH=../ sphinx-build -b man ./ _build
}

## FIXME: test plugins conflict
# check() {
# 	cd "$_pkg-$pkgver"
# 	PYTHONPATH="$PWD" pytest -x --disable-warnings
# }

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 docs/_build/google-cloud-bigquery-storage.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv \
		"$_site/google_cloud_bigquery_storage-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
