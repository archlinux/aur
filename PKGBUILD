# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=chemicals
pkgname=python-${_base}
pkgver=1.5.0
pkgrel=1
pkgdesc="Chemical database of Chemical Engineering Design Library"
arch=(any)
url="https://github.com/CalebBell/${_base}"
license=(MIT)
depends=(python-fluids python-pandas)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-sympy python-openpyxl ipython python-pint python-numba)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('7d29c3fac65058d48df6871e02587003a63ac6a0248a624c9c1bd640952ad2c7b33231a6767f25421d91d327cedf71d33a2e85d387cc173c0d2ecfd7da781b25')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests --ignore=tests/test_iapws.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
