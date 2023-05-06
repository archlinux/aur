# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=msgcheck
pkgname=python-${_base}
pkgdesc="Gettext file checker"
pkgver=4.0.0
pkgrel=3
arch=(any)
url="https://github.com/flashcode/${_base}"
license=(GPL3)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pyenchant aspell-en aspell-fr libxml2)
optdepends=('enchant: for check PO files')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4785d97eaa2b22dbb1aba34beb51705b8a6ba5edac5dcb03680d9588147af4b7dc629a7a8dea90b7516228f315a0b4ff0ce852c87a5f05641890ea3703e08716')

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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
