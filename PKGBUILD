# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-cloud-bigquery-storage
_pkg='python-bigquery-storage'
pkgver=2.13.2
pkgrel=1
pkgdesc="BigQuery Storage API client library"
arch=('any')
url="https://github.com/googleapis/python-bigquery-storage"
license=('Apache')
depends=('python-google-api-core' 'python-grpcio' 'python-proto-plus' 'python-protobuf')
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
sha256sums=('33e666b8c15498a2b84c217da65d8232f324554badba87705d7f296ab7b274c3')

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
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/_build/google-cloud-bigquery-storage.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/google_cloud_bigquery_storage-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
