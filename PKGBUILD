# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=equinox
pkgname=python-${_base}
pkgdesc="Elegant easy-to-use neural networks in JAX"
pkgver=0.13.0
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-jax python-jaxtyping python-typing_extensions)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-beartype python-optax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('24d5ae736fc4da8b98a8bcf870c4cd180db0aeb1917569054c4f32eb7308d018dfe247e09973e3e4bc198acd6d3b010c208098c6c9f752ecc3b26ef770c1218b')

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
