# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sxdes
pkgname=python-${_base}
pkgver=0.3.0
pkgrel=1
pkgdesc="run the sep code on images with DES settings"
arch=(x86_64)
url="https://github.com/esheldon/${_base}"
license=(GPL3)
depends=(python-sep)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f6ebb957c688f738762612fc0152b51d0fced4564b486d89aea44ba48ff6de06b0506809e31a2eb669067a3a41adc810646983ca9ddabc2d28a65d65584b3e27')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
