# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptive
pkgname=python-${_base}
pkgver=1.0.0
pkgrel=1
pkgdesc="Parallel active learning of mathematical functions"
arch=('x86_64')
url="https://github.com/${pkgname}/${_base}"
license=('custom:BSD-3-clause')
depends=(python-scipy python-sortedcollections python-cloudpickle python-loky python-versioningit)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-flaky)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('22c37d5c6592ef43e4a2bb571c9b059d87879016800527ba2398455fb54afd5781bccc3cbee42de049603a13f8239382fb46db254da43a79b5688d30c869437d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
