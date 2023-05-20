# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=fluids
pkgname=python-${_base}
pkgver=1.0.23
pkgrel=1
pkgdesc="Fluid dynamics component of Chemical Engineering Design Library"
arch=(any)
url="https://github.com/calebbell/fluids"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pint python-pandas python-pytz python-numba python-sympy python-thefuzz) # python-pvlib
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('22a259eec2de8ef0c5cb65d51df0a99eeec9420e0eaeffc5a749275320b09a2c16221ee5baf948761b2efda24e6f2195917c06ea2b56f36f5864ef8a5ef44f51')

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
