# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=geoviews
pkgname=python-${_base}
pkgver=1.11.0
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
sha512sums=('a212a5673c63bec0ec0b22a5af93e2640f0fa59d0d36bc88be4c4f696b891e4843338621ae034166abb1a0dbf455767495301fea97bc6da4732fdf5ab184ccfe')

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
