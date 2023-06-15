# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=equinox
pkgname=python-${_base}
pkgdesc="Elegant easy-to-use neural networks in JAX"
pkgver=0.10.6
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache)
depends=(python-jax python-jaxtyping python-typing_extensions)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cd4317f57ba93eea266edb34b0f5ba2db88354de24dd85ea637dad239be77463158412a22de8e063e75c985fbfdc72c9f64bb84159732f21f87258d9fa86c384')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_base}-${pkgver}/dist/*.whl
  test-env/bin/python -m pytest ${_base}-${pkgver}/tests -k 'not onnx_export'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
