# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-eddy-tracker
pkgname=python-${_base}
pkgdesc="Py-Eddy-Tracker libraries"
pkgver=3.6.0
pkgrel=1
arch=(any)
url="https://github.com/AntSimi/${_base}"
license=(GPL3)
depends=(python-matplotlib python-opencv python-pint python-polygon python-yaml python-requests python-scipy python-zarr python-netcdf4 python-numba)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cae450c99156f5363f71e71c526a4da370481e849f1656a410c07bf62bb87d5c787b5d7ba017d5d21619aeb8a8501e7d02983524d516afa2459e0275d45e932a')

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
