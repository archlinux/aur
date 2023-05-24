# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

_base=fastecdsa
pkgname=python-${_base}
pkgver=2.3.1
pkgrel=1
pkgdesc="Fast elliptic curve digital signatures"
arch=(x86_64)
url="https://github.com/antonkueltz/${_base}"
license=('custom')
depends=(python gmp)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5dd11407ac3cd20fd686709857934c480a625774a9fdb67c5064daf975f0d82a4dd84fa3b8c12f95ec93bfba4577a836f0bfaf8e5f6899f2d7c62bb0acffca63')
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
