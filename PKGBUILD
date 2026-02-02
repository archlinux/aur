# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=diffrax
pkgname=python-${_base}
pkgdesc="GPU+autodiff-capable ODE/SDE/CDE solvers written in JAX"
pkgver=0.7.1
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-optimistix)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-tqdm python-optax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7e54e36869e281bb949b64aaa29736b3fb816330511115c598b3fee3490422843f356ea322ace9c05dde44139c0dccdfce381efb8716c3d17d77691df34c547c')

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
