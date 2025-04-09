# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aleatory
pkgname=python-${_base}
pkgver=1.1.1
pkgrel=1
pkgdesc="Stochastic Processes Simulation and Visualisation"
url="https://github.com/quantgirluk/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-matplotlib python-parameterized python-statsmodels)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-v.${pkgver}.tar.gz::${url}/archive/v.${pkgver}.tar.gz)
sha512sums=('9507bbb9ef1d08bcd18e01b4ff480bd92f2e7e6ade7ac8673cd51991d9e736ef6e8cde5d7ff905b4d3bc04b7eba362ff36f047ebfb6c56f7eb5712e41c890ac1')

build() {
  cd ${_base}-v.${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-v.${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest
}

package() {
  cd ${_base}-v.${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
