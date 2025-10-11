# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=equinox
pkgname=python-${_base}
pkgdesc="Elegant easy-to-use neural networks in JAX"
pkgver=0.13.2
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-jax python-jaxtyping python-typing_extensions)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-beartype python-optax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b27b56b6c8fabe13fcca67d495ffd84ba013698271213bd8b5ae6b030ee2f5e830b912bcb762514936d8fdbdfc45112f4e6c1fab95204c7ab02acea8dc4f2628')

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
