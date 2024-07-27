# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=chemicals
pkgname=python-${_base}
pkgver=1.2.0
pkgrel=1
pkgdesc="Chemical database of Chemical Engineering Design Library"
arch=(any)
url="https://github.com/CalebBell/${_base}"
license=(MIT)
depends=(python-fluids python-pandas)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-sympy python-openpyxl ipython python-pint python-numba)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('474544bce2c2ad09631e65c5b9de2154e1290b4c74e2859bfb7ac94979c8c32322c7a456a9d5803402c5e9c559a84af85f35b76fe4d55c6583017d90149c72e7')

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
