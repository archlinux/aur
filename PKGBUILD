# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Martin Rys <https://rys.rs/contact>
_base=pyoxipng
pkgname=python-${_base}
pkgdesc="Python wrapper for multithreaded .png image file optimizer oxipng"
pkgver=9.1.1
pkgrel=4
arch=(x86_64)
url="https://github.com/nfrasser/${_base}"
license=(MIT)
depends=(python oxipng)
makedepends=(python-build python-installer python-maturin python-wheel)
checkdepends=(python-pytest)
options=("!lto")
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9c38bf6ebbaea38109bb6136d0d3376de8130fa219ea03db7a1e1e6bcaeb5b980b0908002f1ff0b840c6851703137d767da0a0e718d4df7a641e3f1438d6d07d')

prepare() {
  cd ${_base}-${pkgver}
  # https://github.com/nfrasser/pyoxipng/issues/25
  cargo update -p libdeflate-sys --precise 1.26.1
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
