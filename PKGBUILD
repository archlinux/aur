# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=chemicals
pkgname=python-${_base}
pkgver=1.4.0
pkgrel=1
pkgdesc="Chemical database of Chemical Engineering Design Library"
arch=(any)
url="https://github.com/CalebBell/${_base}"
license=(MIT)
depends=(python-fluids python-pandas)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-sympy python-openpyxl ipython python-pint python-numba)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('35e8259acb3160e461a9aae3447900da347397c7712b6dd169e4c724a1282c4db43a0e6a6b37ca3bcce4acbbdb53256d2d3d97aaeac17c0cca8994dc2017b267')

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
