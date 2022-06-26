# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-cloud-bigquery
_pkg=python-bigquery
pkgver=3.2.0
pkgrel=1
pkgdesc="Google BigQuery API client library"
arch=('any')
url="https://github.com/googleapis/python-bigquery"
license=('Apache')
depends=(
	'python-pyarrow'
	'python-dateutil'
	'python-google-api-core'
	'python-google-cloud-core'
	'python-google-cloud-bigquery-storage'
	'python-google-resumable-media'
	'python-grpcio'
	'python-packaging'
	'python-protobuf'
	'python-requests')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-recommonmark'
	'ipython')
optdepends=(
	'ipython'
	'python-pandas: pandas support'
	'python-tqdm: tqdm support'
	'python-fastparquet: fastparquet support'
	'python-snappy: fastparquet support'
	'python-llvmlite: fastparquet support')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1f7986eec231e817704f922d61d8ec88b3411c8c04fc44e87fb77600c6c26d7f')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	## FIXME: man pages not building
	# cd docs
	# PYTHONPATH=../ sphinx-build -b man ./ _build
}

package() {
	export PYTHONHASHSEED=0
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	# install -Dm644 docs/_build/google-cloud-bigquery.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/google_cloud_bigquery-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
