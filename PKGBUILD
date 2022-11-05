# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-eddy-tracker
pkgname=python-${_base}
pkgdesc="Py-Eddy-Tracker libraries"
pkgver=3.6.1
pkgrel=1
arch=(any)
url="https://github.com/AntSimi/${_base}"
license=(GPL3)
depends=(python-matplotlib python-opencv python-pint python-polygon python-yaml python-requests python-scipy python-zarr python-netcdf4 python-numba)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e6e11ea1df148b80d39ec301b6667370827435c4865eea576830296bda9b5bea41d282838593061a49f569d70ad6d1d12458ff8087d2def83e8bc298781d4b92')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python setup.py install --root="${srcdir}/tmp_install" --optimize=1 --skip-build
  cd ${srcdir}
  PYTHONPATH="${srcdir}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest ${_base}-${pkgver}/tests -k 'not area_tracking_parameter'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
