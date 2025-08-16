# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=RDT
pkgname=python-${_base,,}
pkgver=1.18.0
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
sha512sums=('d177e78025755d789cdbbd8fb67041db46b1538b4e1c473ffb699bdb69071cd153b2a4934fef5bbd610e37163b90c3a986a33a93e1335bdaa8494a4e1da89169')

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
