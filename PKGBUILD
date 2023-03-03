# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=poly
pkgname=python-nutils-${_base}
pkgdesc="Low-level functions for evaluating and manipulating polynomials"
pkgver=1.0.0
pkgrel=1
arch=(any)
url="https://github.com/nutils/${_base}-py"
license=(MIT)
depends=(python-numpy)
makedepends=(maturin python-installer)
source=(${_base}-py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('dde79e3b5d351ebdbc83751efe20e4e76a9db0db26d05a64e68efc8f035ee8e5ba98d4ab6eb7a1e9190d39d51d5d9fa201bcb3c87819ae7072345db3af187b2d')

build() {
  cd ${_base}-py-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME=${PWD}
  maturin build --release --strip
}

check() {
  cd ${_base}-py-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer target/wheels/*.whl
  test-env/bin/python test.py
}

package() {
  cd ${_base}-py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" target/wheels/*.whl
}
