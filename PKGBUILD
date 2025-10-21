# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aioshutil
pkgname=python-${_base}
pkgdesc="Asynchronous shutil module"
pkgver=1.6
pkgrel=1
arch=(any)
url="https://github.com/kumaraditya303/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest-cov)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9971bb11e39b47dde72243ca1c7e721daab0c3ac7f22e8b95888f766fc5f879b1a9c834682c7bd0e6736e8afbc7ca65570ebefbdcee8260a4662df5aa6eaaa32')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
