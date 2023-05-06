# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=pz
pkgname=python-${_base}
pkgdesc="Utility to substitute awk, sed and/or grep with Python"
pkgver=1.1.0
pkgrel=3
arch=(any)
url="https://github.com/CZ-NIC/${_base}"
license=(GPL)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('469f883729a64e9f7b199b637c57e685a2270ab51c19ab8d1b07eac43dd338a477988fc34396985df03011b1be2f9f7894079e0cb73d981b7f959a998000b013')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python tests.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
