# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=msgcheck
pkgname=python-${_base}
pkgdesc="Gettext file checker"
pkgver=4.2.0
pkgrel=1
arch=(any)
url="https://github.com/flashcode/${_base}"
license=(GPL-3.0-or-later)
depends=(python-pyenchant)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pyenchant aspell-en aspell-fr libxml2)
optdepends=('enchant: for check PO files')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ff2f80cee60780a6860dc7504039c96561e1113612d25e8ed453448b58426ad9560027ca0744fe2d3ae7775df6b2dec402fa5981fa06ff7d329581296a0ad007')

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
