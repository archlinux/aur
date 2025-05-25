# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=loky
pkgname=python-${_base}
pkgver=3.5.5
pkgrel=1
pkgdesc="Robust and reusable Executor for joblib"
arch=('x86_64')
url="https://github.com/joblib/${_base}"
license=(BSD-3-Clause)
depends=(python-cloudpickle)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-psutil python-numpy)
optdepends=('python-psutil: allow early memory leak detections')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('6cdd67fb92675fd8d4ec35235f3fb4c295ad79ae1fb22cda993b3ec84538b65e8f31d51064837110876015172bf7d2aed2df9fa78f8d3cbb8d412de24129b726')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not reusable_executor'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
