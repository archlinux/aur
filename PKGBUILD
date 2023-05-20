# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=geoviews
pkgname=python-${_base}
pkgver=1.9.6
pkgrel=1
pkgdesc="Simple, concise geographical visualization in Python"
arch=(any)
url="https://github.com/pyviz/${_base}"
license=('custom:BSD-3-clause')
depends=(python-cartopy python-holoviews)
makedepends=(python-build python-installer python-setuptools python-wheel npm)
checkdepends=(python-pytest python-geopandas python-spatialpandas) # python-xarray
# optdepends=('python-datashader: for '
#   'python-geopandas: for '
#   'python-osgeo: for ' # gdal
#   'jupyter-notebook: for '
#   'python-matplotlib: for '
# )
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a1e199a37cbc19dc6756130b891b2388f4a4a1176df507e83af0b00d8b0edd50019f278173fdb553f5370cdd86fffb175cb8201e4aa098038960d14b9658f3a9')

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
