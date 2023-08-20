# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=fluids
pkgname=python-${_base}
pkgver=1.0.24
pkgrel=1
pkgdesc="Fluid dynamics component of Chemical Engineering Design Library"
arch=(any)
url="https://github.com/calebbell/fluids"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pint python-pandas python-pytz python-numba python-sympy python-thefuzz) # python-pvlib
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('1a3fe115ffbf91208aa49909ff24cb70040342fc304dd254c54f8d05dae555c46e37e246b24a0beccf3253819645331389927ac34afe5dc1568ca9c0baa42697')

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
