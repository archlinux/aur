# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=evtx
pkgname=python-py${_base}
pkgver=0.11.0
pkgrel=1
pkgdesc="Python bindings for ${_base}"
arch=(x86_64)
url="https://github.com/omerbenamram/py${_base}-rs"
license=(MIT)
depends=(python)
makedepends=(python-installer maturin)
checkdepends=(python-pytest)
source=(py${_base}-rs-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('8ce8bfa9e521943eb8ea43c73ca4b24e54c480813811a653d0741d08aaa5376490d475360c3caeadadc0e9f21d529b0106d2545fc5d73dc24d75d0919ff6fc77')

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
