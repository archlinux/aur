# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-eddy-tracker
pkgname=python-${_base}
pkgdesc="Py-Eddy-Tracker libraries"
pkgver=3.6.1
pkgrel=2
arch=(any)
url="https://github.com/AntSimi/${_base}"
license=(GPL3)
depends=(python-matplotlib python-opencv python-pint python-polygon python-yaml
  python-requests python-scipy python-zarr python-netcdf4 python-numba)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e6e11ea1df148b80d39ec301b6667370827435c4865eea576830296bda9b5bea41d282838593061a49f569d70ad6d1d12458ff8087d2def83e8bc298781d4b92')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not pixels_in and not contour_grid_slice and not interp and not id and not area_tracking_parameter'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
