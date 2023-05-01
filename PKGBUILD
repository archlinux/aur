# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptive
pkgname=python-${_base}
pkgver=0.15.1
pkgrel=1
pkgdesc="Adaptive: parallel active learning of mathematical functions"
arch=('x86_64')
url="https://github.com/${pkgname}/${_base}"
license=('custom:BSD-3-clause')
depends=(python-scipy python-sortedcollections python-cloudpickle python-loky python-versioningit)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-flaky)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3c3ff3b66adf23d2659f2a336b7390bf301c793156757df72c57486e2cb7e64eeba3ee9fc054e9411bb27ed09bb29847870922da73d49d89e7eb526ee7f8fae5')

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
