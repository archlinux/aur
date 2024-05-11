# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=poly
pkgname=python-nutils-${_base}
pkgdesc="Low-level functions for evaluating and manipulating polynomials"
pkgver=1.0.1
pkgrel=1
arch=(any)
url="https://github.com/nutils/${_base}-py"
license=(MIT)
depends=(python-numpy)
makedepends=(maturin python-installer)
source=(${_base}-py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('762fb2247f3512007cc8237255d91963f4ce7be1a27f7c5e8e7e9e8f3420153fa6cdb5596fa9f812a4b5c9152a936ae3e3e3895be4ecd11758b55d529b9f1eb5')

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
