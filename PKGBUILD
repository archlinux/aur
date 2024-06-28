# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=rioxarray
pkgname=python-${_base}
pkgver=0.15.7
pkgrel=1
pkgdesc="geospatial xarray extension powered by rasterio"
arch=(any)
url="https://github.com/corteva/${_base}"
license=(Apache-2.0)
depends=(python-packaging python-rasterio python-xarray python-pyproj)
makedepends=(python-build python-installer python-setuptools python-wheel) # python-sphinx-click python-nbsphinx pandoc-cli
checkdepends=(python-pytest python-dask)                                   # python-netcdf4 python-h5py-openmpi | python-gdal
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f16c243e1107ee6de4ca8c4d6e022a805f39fe78ea8f930f65144128df2b19a2c9c1cf8962bc0c972a1d808d86b31423665ba10af17e0bc9b2194f63d60fe344')

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
    --ignore=test/integration/test_integration_merge.py \
    --ignore=test/integration/test_integration_rioxarray.py \
    --ignore=test/integration/test_integration_xarray_plugin.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
