# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=hvplot
pkgname=python-${_base}
pkgver=0.8.4
pkgrel=1
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
sha512sums=('e45db8d74b056f752311fcd221a2701f59d3386368146d3003634facb16c9fdc57b6966e3a99adf25fc3682be4474ef446aac02446530bb92d8b2e447e605196')

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
