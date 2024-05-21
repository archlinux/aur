# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tensortrax
pkgname=python-${_base}
pkgdesc="Math on (Hyper-Dual) Tensors with Trailing Axes"
pkgver=0.23.0
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL-3.0-or-later)
depends=(python-numpy python-joblib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('eb854069c826778b57f12817be0cc18fd16dc8a126c07910cac18ce6d4061f3ff1c5214441a5f00f9bb87970e3849d36665a70d55cb2c12947f0b4e20a5c8d5c')

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
