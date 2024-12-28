# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aioshutil
pkgname=python-${_base}
pkgdesc="Asynchronous shutil module"
pkgver=1.5
pkgrel=1
arch=(any)
url="https://github.com/kumaraditya303/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest-cov)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('63e618051b02a899c034bed127da1f457f20af2e1d058a3da60da30a86a727731478792809d50ceb89ea6b7fe2a41d294d2b74131d207bd49a5b2928e4108479')

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
