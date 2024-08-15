# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=RDT
pkgname=python-${_base,,}
pkgver=1.12.3
pkgrel=1
pkgdesc="Reversible Data Transforms"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(BUSL-1.1)
depends=(python-pandas python-scikit-learn python-faker)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-subtests python-copulas python-invoke)
optdepends=('python-copulas')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1d890ff7cf6718baf16c8b446c13108e9b6bbb8fc8b6a2b92073e2a8c0bb7f0ca3eebdaa623be7a9f4792ec10901e6d1d9ec193ef620cd6d339c17b5dc4de395')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=tests/performance/test_performance.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
