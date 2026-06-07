# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=evtx
pkgname=python-py${_base}
pkgver=0.11.1
pkgrel=1
pkgdesc="Python bindings for ${_base}"
arch=(x86_64)
url="https://github.com/omerbenamram/py${_base}-rs"
license=(MIT)
depends=(python)
makedepends=(python-installer maturin)
checkdepends=(python-pytest)
source=(py${_base}-rs-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('6f616527a4fe4f4976996029efb49f3dd9889480f7511a5f3c7f77044bab7d3b079150f42d4864eb9590c74b797a2352598b346ce8ba5e3d64154c1c3f99e9e4')

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
