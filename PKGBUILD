# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyccel
pkgname=python-${_base}
pkgdesc="Python extension language using accelerators"
pkgver=2.0.1
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-filelock python-numpy python-sympy python-termcolor python-textx python-packaging)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cec4bb87b7cfc755467f621b8438a03cf368b537548d1b92969764c6b87174dffe00658279cfd189dcc3c64015461546d0206ab08771dbe5ddf2dde195131890')

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
