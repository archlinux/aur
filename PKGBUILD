# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyccel
pkgname=python-${_base}
pkgdesc="Python extension language using accelerators"
pkgver=2.2.1
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-filelock python-numpy python-sympy python-termcolor python-textx python-packaging)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9fb1aae829e5d0f3372b1416c6c60bf9a259f4a0a6c84948ce032471f77c4318557fe5b52c587b518e986097fe80eb9beca4074978eac42ef2df15f857189798')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
