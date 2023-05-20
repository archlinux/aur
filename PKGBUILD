# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=chemicals
pkgname=python-${_base}
pkgver=1.1.3
pkgrel=1
pkgdesc="Chemical database of Chemical Engineering Design Library"
arch=(any)
url="https://github.com/calebbell/${_base}"
license=(MIT)
depends=(python-fluids python-pandas)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pint python-openpyxl python-sympy)
# ipython python-fuzzywuzzy python-matplotlib python-pytz python-numba
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('aac6f2d1ce54550f854a9b25f5673193d6438840acec39a227ccb6cbfe3a198bee3769756e7a9418cca1baa18ea331c720d05ba92733ed661f80d3fae54fc35d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
