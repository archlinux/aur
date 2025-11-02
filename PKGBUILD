# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyPardiso
pkgname=python-${_base,,}
pkgver=0.4.7
pkgrel=1
pkgdesc="Python interface to the Intel MKL Pardiso library to solve large sparse linear systems of equations"
arch=(any)
url="https://github.com/haasad/${_base}Project"
license=(BSD-3-Clause)
depends=(intel-oneapi-mkl python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}Project-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('12c43f1612cb7db0a501e332cb268598162e7b86c8eac09383a039a4c4e3910f9be61d4cb4c213e3b9c486320d5dad880aef958a02c68341e3e832c2728b3ce4')

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
