# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=diffrax
pkgname=python-${_base}
pkgdesc="GPU+autodiff-capable ODE/SDE/CDE solvers written in JAX"
pkgver=0.6.0
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-optimistix)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-tqdm python-optax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('245b7bd07ba4c738a975c7264debe56bb3c54357cc81f907a6923f7b59b45498d931f279812319accfbc93f4412384fb0879deecea1bea0d892d336c94cf3a58')

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
