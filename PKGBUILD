# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008@yahoo.com>
_base=flake8-builtins
pkgname=python-${_base}
pkgver=3.0.0
pkgrel=1
pkgdesc="Check for python builtins being used as variables or parameters"
arch=(any)
url="https://github.com/gforcada/${_base}"
license=(GPL-2.0-or-later)
depends=(flake8)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0d9961a31f3130db1cffad41af0da197eb75210cc194d38a3e302fd2352f9e3acf9b6bd216c41e115df02bd643930d2c2e712c801c301d966c05ea21840e0e89')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest run_tests.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
