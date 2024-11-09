# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=rioxarray
pkgname=python-${_base}
pkgver=0.18.1
pkgrel=1
pkgdesc="geospatial xarray extension powered by rasterio"
arch=(any)
url="https://github.com/corteva/${_base}"
license=(Apache-2.0)
depends=(python-packaging python-rasterio python-xarray python-pyproj)
makedepends=(python-build python-installer python-setuptools python-wheel) # python-sphinx-click python-nbsphinx pandoc-cli
checkdepends=(python-pytest python-dask)                                   # python-netcdf4 python-h5py-openmpi | python-gdal
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b141b4cbf3823ac5b0d9080de95f94041cef4edcc9d5ca900bf22646c24eeebb8c192de7f085ac3bc2ece5caacb429a1671834c699799e6fb4b07ddbfb5d6f50')

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
