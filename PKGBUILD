# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=equinox
pkgname=python-${_base}
pkgdesc="Elegant easy-to-use neural networks in JAX"
pkgver=0.13.4
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-jax python-jaxtyping python-typing_extensions)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-beartype python-optax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fd81c8343e2ab4756a06b23992b3707f327fc8c041d2bb43223a92381ffd7d8ed0b0d3a411cbce83f791bd41086aeff50504d61edf98de72d0650b5a4804ad6a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_base}-${pkgver}/dist/*.whl
  test-env/bin/python -m pytest ${_base}-${pkgver}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
