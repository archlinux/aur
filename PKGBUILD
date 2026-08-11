# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aerokit
pkgname=python-${_base}
pkgdesc="Python tools for basic fluid mechanics computations"
pkgver=1.3.0
pkgrel=1
arch=(any)
url="https://github.com/jgressier/${_base}"
license=(MIT)
depends=(python-matplotlib python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('28a2ebc5a691054913f2bfef7d83169ff9a5270f9149c4b5d396f77b539a84f799b1776814283eaeb776f59edd1307daf1a16b2016f51cf0323bb0335c7c3552')

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
