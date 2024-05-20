# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=diffrax
pkgname=python-${_base}
pkgdesc="GPU+autodiff-capable ODE/SDE/CDE solvers written in JAX"
pkgver=0.5.1
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-optimistix)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-tqdm python-optax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c208d8697f0eae8b24fe816be584e8aa780696582b7ef789a41ee58d5d9ef4ec654507e9d12005593e30be96382a7b4a71018a1fd7e73422f70147ac0ca6fc76')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest test/test_adaptive_stepsize_controller.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
