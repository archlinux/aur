# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meds
pkgname=python-${_base}
pkgver=0.9.16
pkgrel=1
pkgdesc="Python and C libraries for reading MEDS files"
arch=(x86_64)
url="https://github.com/esheldon/${_base}"
license=(GPL3)
depends=(python-fitsio python-esutil python-joblib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e313667281280b2d8cf4bcb1e6a7cf6a3ebfed02482891fa1a2ddc1a382f00839d42425628bb36318ec8f541428871b28a5d2cb48d62a2106064d8ad29e56ce1')

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
