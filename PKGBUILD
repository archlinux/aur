# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=loky
pkgname=python-${_base}
pkgver=3.5.6
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
sha512sums=('63fa2e2e2af6f4f04b5fa50e732c65c308cad0ada8946ed0033f5fae1b5d6835b9bfa6adfce2b6fcfdf7ac17fb540993b3d2494f91dad380aede64a37bc9430c')

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
