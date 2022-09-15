# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-rioxarray
_pkg="${pkgname#python-}"
pkgver=0.12.1
pkgrel=1
pkgdesc="Geospatial xarray extension powered by rasterio"
arch=('any')
url="https://github.com/corteva/rioxarray"
license=('Apache')
depends=('python-dask' 'python-packaging' 'python-pyproj' 'python-rasterio' 'python-xarray')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-netcdf4' 'python-pytest')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e5f2db73cc9c46cadbdd25565ae58344ed80eac574fd20eab35c3c16678a4e2b')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	## FIXME: docs don't build
	# PYTHONPATH="$PWD" make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x --disable-warnings || true
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	# install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
