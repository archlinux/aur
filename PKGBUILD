# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=fluids
pkgname=python-${_base}
pkgver=1.0.27
pkgrel=1
pkgdesc="Fluid dynamics component of Chemical Engineering Design Library"
arch=(any)
url="https://github.com/CalebBell/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pint python-pytz python-pandas
  python-numba python-thefuzz) # python-sympy python-pvlib
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('374bc1b6f80927ab67747275442a2ec90c4e3f64305678abd3aa736e87384068c07d6813e3a14bf1fb85d5db4e22fe8edbd7a2944ce299e0b5636beaba8a45d8')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not geocode'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
