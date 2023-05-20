# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=hvplot
pkgname=python-${_base}
pkgver=0.8.3
pkgrel=2
pkgdesc="A high-level plotting API for pandas, dask, xarray, and networkx built on HoloViews"
arch=(any)
url="https://${_base}.holoviz.org"
depends=(python-holoviews)
license=('custom:BSD-3-clause')
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest python-parameterized python-xarray python-matplotlib python-pooch
  python-scipy python-plotly python-datashader python-dask python-geopandas) # python-netcdf4 python-streamz python-geoviews
optdepends=('python-xarray: for datetime handled as xarray data')
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('7ed3b6d51e5a6e8a37b7bcda019e79355b134bfbbffdf918659d10f03c224d0ba7101e520b38d43cf467052a005f2611b9e421a825b6b5352e361c32f056f6c6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  # https://stackoverflow.com/a/58440525/9302545
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/tests \
    --ignore=${_base}/tests/testoperations.py \
    --ignore=${_base}/tests/plotting/testscattermatrix.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
