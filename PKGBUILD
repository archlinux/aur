# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tensortrax
pkgname=python-${_base}
pkgdesc="Math on (Hyper-Dual) Tensors with Trailing Axes"
pkgver=0.26.2
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL-3.0-or-later)
depends=(python-numpy python-joblib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('49e70fd54f12f5d0ab4484e9fb3e18111f1dc1b0ddb1184bc17dcb7f2b93bbdd94de8f1cb9fe086c553cd6c59ea411ce634ae1a766097d5a220d0b73b0a6a6d2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
