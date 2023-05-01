# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=loky
pkgname=python-${_base}
pkgver=3.4.0
pkgrel=1
pkgdesc="Robust and reusable Executor for joblib"
arch=('x86_64')
url="https://github.com/joblib/${_base}"
license=('custom:BSD-3-clause')
depends=(python-cloudpickle)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-psutil python-numpy)
optdepends=('python-psutil: allow early memory leak detections')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('7b211999baec47bb5aefd967d0962a463da98ca0355f88b9bea871dfa562e13c445a4553417608b677078e70ca2172941223f45c95021f88fb8253458d1476f0')

build() {
  cd ${_base}-${pkgver}
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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
