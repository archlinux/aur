# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tensortrax
pkgname=python-${_base}
pkgdesc="Math on (Hyper-Dual) Tensors with Trailing Axes"
pkgver=0.18.1
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL-3.0-or-later)
depends=(python-numpy python-joblib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6f4a64777809efe60ec271c8a8b2a451a53f853598240b1819fb27beaaebcf6410f8cf00cfe24aa84365957008f7a340069f4a2697f77ff606b54dc8d4ea371f')

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
