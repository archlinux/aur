# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-cloud-bigquery
_pkgname="${pkgname#python-}"
_pkg=python-bigquery
pkgver=3.6.0
pkgrel=1
pkgdesc="Google BigQuery API client library"
arch=('any')
url="https://github.com/googleapis/python-bigquery"
license=('Apache')
depends=(
	'python-dateutil'
	'python-google-api-core'
	'python-google-cloud-bigquery-storage'
	'python-google-cloud-core'
	'python-google-resumable-media'
	'python-grpcio'
	'python-packaging'
	'python-protobuf'
	'python-pyarrow'
	'python-requests')
makedepends=(
	'ipython'
	'python-build'
	'python-installer'
	'python-recommonmark'
	'python-setuptools'
	'python-sphinx'
	'python-wheel')
optdepends=(
	'ipython'
	'python-fastparquet: fastparquet support'
	'python-llvmlite: fastparquet support'
	'python-pandas: pandas support'
	'python-snappy: fastparquet support'
	'python-tqdm: tqdm support')
changelog=CHANGELOG.md
# source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5886c14f29097158d59afa74a6732dbdd583e6ef30dc9934a56ad532906de356')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
	# PYTHONPATH="$PWD" sphinx-build -b man docs/ _build
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	# install -Dm644 _build/google-cloud-bigquery.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv \
		"$_site/${_pkgname//-/_}-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
