# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=chemicals
pkgname=python-${_base}
pkgver=1.3.2
pkgrel=1
pkgdesc="Chemical database of Chemical Engineering Design Library"
arch=(any)
url="https://github.com/CalebBell/${_base}"
license=(MIT)
depends=(python-fluids python-pandas)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-sympy python-openpyxl ipython python-pint python-numba)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('6933b36b83a7a07666c3ba154ebb05307d9c3b8d05f16616c56da58a92a197287996242b20922783b27d675dc83608afabe3f010230fd0fd29608579c6ee7b6a')

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
