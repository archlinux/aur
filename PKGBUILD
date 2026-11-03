# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=evtx
pkgname=python-py${_base}
pkgver=0.15.0
pkgrel=1
pkgdesc="Python bindings for ${_base}"
arch=(x86_64)
url="https://github.com/omerbenamram/py${_base}-rs"
license=(MIT)
depends=(python)
makedepends=(python-installer maturin)
checkdepends=(python-pytest)
source=(py${_base}-rs-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('51f3de45919d9c672c318b7da1ba46b105e5922bb08cb32e30c62101a335abbbf441d660500adb845a9290826823a28c23ff27d2fc15d07e2ff041a22ce4a907')

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

check() {
  cd py${_base}-rs-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer target/wheels/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd py${_base}-rs-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" target/wheels/*.whl
}
