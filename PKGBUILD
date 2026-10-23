# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aerokit
pkgname=python-${_base}
pkgdesc="Python tools for basic fluid mechanics computations"
pkgver=1.5.0
pkgrel=1
arch=(any)
url="https://github.com/jgressier/${_base}"
license=(MIT)
depends=(python-matplotlib python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('16f85bc1ff6286847ca2bdd069165d7a1278987217dd8717bb048e8d74e46cdcdf04df3657fb557864f4073cb0820e2d740520db42ae706e2ec6873b97d4a059')

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
