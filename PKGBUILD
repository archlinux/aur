# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=loky
pkgname=python-${_base}
pkgver=3.4.1
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
sha512sums=('237f65421bd80904378f0b73f023b240b72144a2272cfbef4845bd48f573c447ad82025e0cd6018fd7313fc0b633fd70fb4e88679c8101e2e32fe559a3651832')

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
