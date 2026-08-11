# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fuzzy-theory
pkgname=python-${_base}
pkgdesc="The fuzzy-theory library provides a PyTorch interface to fuzzy set theory and fuzzy logic operations"
pkgver=0.1.0
pkgrel=1
arch=(any)
url="https://github.com/johnHostetter/${_base}"
license=(MIT)
depends=(python-entmax python-optuna python-sympy python-torchquad
  python-scienceplots python-natsort python-rough-theory)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a02cf48a0003c5dcd672fc86934cd8ba871ae6584c6452cbb8e793c7480115a1cbf4ae81cd0b51d1db786d0581f9ebbab1296a8654a37fb967636fe653217563')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not test_plot'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
