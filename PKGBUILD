# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyccel
pkgname=python-${_base}
pkgdesc="Python extension language using accelerators"
pkgver=2.2.2
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-filelock python-numpy python-sympy python-termcolor python-textx python-packaging)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c63ff0e2c031248d99032f225f8acde4cf3cccb10b94d03c7f29a7ed85c9640385b4de4a8456f948584a1a1e57837daf33edad78613915a7742dc48235f43993')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
