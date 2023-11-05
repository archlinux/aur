# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=evtx
pkgname=python-py${_base}
pkgver=0.8.3
pkgrel=1
pkgdesc="Python bindings for ${_base}"
arch=(x86_64)
url="https://github.com/omerbenamram/py${_base}-rs"
license=(MIT)
depends=(python)
makedepends=(python-installer maturin)
# checkdepends=(python-pytest)
source=(py${_base}-rs-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('a367dd165be200600fe82cd1f966eb6bffb0eb2b49d7646f46e07fa485529532afcf06049e4cada39d176ee2adf961baa2b7adbfc8128f698cd80ff82b4a9c91')

prepare() {
  cd py${_base}-rs-${pkgver}
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd py${_base}-rs-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME=${PWD}
  maturin build --release --strip
}

# check() {
#   cd py${_base}-rs-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer target/wheels/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd py${_base}-rs-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" target/wheels/*.whl
}
