# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aleatory
pkgname=python-${_base}
pkgver=1.0.1
pkgrel=1
pkgdesc="Stochastic Processes Simulation and Visualisation"
url="https://github.com/quantgirluk/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-matplotlib python-parameterized python-statsmodels)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-v.${pkgver}.tar.gz::${url}/archive/v.${pkgver}.tar.gz)
sha512sums=('e62fb3a9920158aba9c30ead5706099502b8daa3e87b46c141f563cc96ff7efc9723bda4c35d373e9c3c85171b0ce9ada194c5e0b8107ea70a4e5da6ac3ede5f')

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
