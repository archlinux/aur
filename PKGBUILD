# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aleatory
pkgname=python-${_base}
pkgver=1.2.2
pkgrel=1
pkgdesc="Stochastic Processes Simulation and Visualisation"
url="https://github.com/quantgirluk/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-matplotlib python-parameterized python-statsmodels)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-v.${pkgver}.tar.gz::${url}/archive/v.${pkgver}.tar.gz)
sha512sums=('6f64f901329e9120f21cdfb1536b734d52d19015e70609d34620f7c5ffc5ec5e6dd8cf4c2f186ae4df2831f2122238b35252f655ec277c3b8373ec6e9f83be42')

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
