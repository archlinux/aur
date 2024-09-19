# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=geoviews
pkgname=python-${_base}
pkgver=1.13.0
pkgrel=1
pkgdesc="Simple, concise geographical visualization in Python"
arch=(any)
url="https://github.com/pyviz/${_base}"
license=(BSD-3-Clause)
depends=(python-cartopy python-holoviews)
makedepends=(python-build python-installer python-hatchling python-wheel npm)
checkdepends=(python-pytest python-geopandas python-spatialpandas) # python-xarray
# optdepends=('python-datashader: for '
#   'python-geopandas: for '
#   'python-osgeo: for ' # gdal
#   'jupyter-notebook: for '
#   'python-matplotlib: for '
# )
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('920f6141e8b63175784edab69ca0bc2a87e2db8e4266711579d65cd11ceb4184e62356d851928ac4d66e5f37cd7ff228ffa4f8a50277ce78d785ac935b927d3b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/tests
}

package_python-geoviews() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
