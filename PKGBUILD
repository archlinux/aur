# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=fluids
pkgname=python-${_base}
pkgver=1.1.0
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
sha512sums=('6d86718550b9ce08b66df686594a2a8435dd09148154cadd96f5ebfc7d5381eb4dc7d6e978479785415a534ddd6f0bfd7e458c6124e7c1767673f343005b0c8c')

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
