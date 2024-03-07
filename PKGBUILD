# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyPardiso
pkgname=python-${_base,,}
pkgver=0.4.5
pkgrel=1
pkgdesc="Python interface to the Intel MKL Pardiso library to solve large sparse linear systems of equations"
arch=(any)
url="https://github.com/haasad/${_base}Project"
license=(BSD-3-clause)
depends=(intel-oneapi-mkl python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}Project-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e5e20d6d35c7626bf64d9c9e5f5012e57fed6799150903f5b22c0c90f55ae91c09522e3344e280e16ca901a8682c65fff1813a81ae8ad7dfc121a5c8d39d3a0f')

build() {
  cd ${_base}Project-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}Project-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}Project-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
