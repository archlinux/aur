# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

_base=fastecdsa
pkgname=python-${_base}
pkgver=2.3.2
pkgrel=1
pkgdesc="Fast elliptic curve digital signatures"
arch=(x86_64)
url="https://github.com/antonkueltz/${_base}"
license=('custom')
depends=(python gmp)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6cf085bfe0869b489ed2f62afef2f7e9a9d5d8afbb1323106ffbf3368a249af173bf5056f967b987c3b11e975e236d6b0e8a756e8ec0ed4b9b37955fc70378fa')
# validpgpkeys=('67C1C1178894F9017D47AC0E15AB0E7C8A4019BF')

prepare() {
  cd ${_base}-${pkgver}
  sed -i '/packages=/s/find_packages()/find_packages(exclude=["fastecdsa.tests*"])/' setup.py
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
