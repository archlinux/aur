# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=RDT
pkgname=python-${_base,,}
pkgver=1.19.0
pkgrel=1
pkgdesc="Reversible Data Transforms"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(BUSL-1.1)
depends=(python-pandas python-scikit-learn python-faker python-dateutil)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-subtests python-copulas python-invoke)
optdepends=('python-copulas')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d4711fa2d9814d4de75333de242b9ae490e80acdd8f24fa415c0a3ad9a3524688ae7a6118c374a23235a98f9e4aaeb297254979c2ccb86691145e78d74390ccc')

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
