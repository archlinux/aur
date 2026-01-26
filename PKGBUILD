# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fuzzy-theory
pkgname=python-${_base}
pkgdesc="The fuzzy-theory library provides a PyTorch interface to fuzzy set theory and fuzzy logic operations"
pkgver=0.0.7
pkgrel=1
arch=(any)
url="https://github.com/johnHostetter/${_base}"
license=(MIT)
depends=(python-entmax python-optuna python-sympy python-torchquad
  python-scienceplots python-natsort python-rough-theory)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('238a1716289e3f16af72365f11daa6c0b468c057c956090eb1c6c9651fe3c938a66f321eb662735a8c0ff2658014fd31814dfc1ff733a867f7e38c9ed2a10138')

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
