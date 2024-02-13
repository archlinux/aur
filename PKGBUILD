# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=geoviews
pkgname=python-${_base}
pkgver=1.11.1
pkgrel=1
pkgdesc="Simple, concise geographical visualization in Python"
arch=(any)
url="https://github.com/pyviz/${_base}"
license=(BSD-3-Clause)
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
sha512sums=('4f2024a47126fbf285dec9189eb7b52a7a1688347d4d6892ab87c3ef1098fb5c86ebde187b03df81215ca4042f624df058d23f8ff69f1c05c5fe2ee2f553b6f6')

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
