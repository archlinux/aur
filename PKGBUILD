# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=rioxarray
pkgname=python-${_base}
pkgver=0.14.1
pkgrel=1
pkgdesc="geospatial xarray extension powered by rasterio"
arch=(any)
url="https://github.com/corteva/${_base}"
license=(Apache)
depends=(python-packaging python-rasterio python-xarray python-pyproj)
makedepends=(python-build python-installer python-setuptools python-wheel) # python-sphinx-click python-nbsphinx pandoc-cli
checkdepends=(python-pytest python-dask)                                   # python-netcdf4 python-h5py-openmpi
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('087ec8cf2bd50b4fbadd87662f3aa3ce53b3861f6a1ea923f5a394a24c1d0ab8c6c864388b953f216b84c8ed040a91c1b997ad09189be95b1a2af2fc833fc5ca')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  # FIXME: docs don't build
  # PYTHONPATH="${PWD}" make -C docs man
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest test \
    --ignore=test/integration/test_integration__io.py \
    --ignore=test/integration/test_integration_rioxarray.py \
    --ignore=test/integration/test_integration_merge.py \
    --ignore=test/integration/test_integration_xarray_plugin.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  # install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
