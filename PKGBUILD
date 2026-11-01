# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=evtx
pkgname=python-py${_base}
pkgver=0.14.1
pkgrel=1
pkgdesc="Python bindings for ${_base}"
arch=(x86_64)
url="https://github.com/omerbenamram/py${_base}-rs"
license=(MIT)
depends=(python)
makedepends=(python-installer maturin)
checkdepends=(python-pytest)
source=(py${_base}-rs-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('5335924cc43de0f84802493ebc7bf19bf37cbc79fd954e4231afababce673ba15af4374fac6d9359ee1bdcdb90b1e79423464e1db1d539adc3b72faddf1b68c2')

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
