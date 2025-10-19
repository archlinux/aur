# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=fluids
pkgname=python-${_base}
pkgver=1.2.0
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
sha512sums=('76c1082296107c1600336c6b34b34c0dc8fba2871bfc78bd612218abe08f088149e63d46fcbd42db51f5aa3babc15eef2e1a612a041d99684c85750dc2ad7098')

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
