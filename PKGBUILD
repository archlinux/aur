# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=testdata
pkgname=python-${_base}
pkgver=6.2.0
pkgrel=1
pkgdesc="Generates random test data"
arch=(any)
url="https://github.com/jaymon/${_base}"
license=(MIT)
depends=(python-datatypes)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('6ab56984794fde019c90f27ef1972c74c59f6874b77b5f9431cfc8e4cec8b70cf1927403f29fdc1366f0a75d5c7ba7101d47cb1c73dc6c0e1693262ff93f7edc')

prepare() {
  cd ${_base}-${pkgver}
  sed -i "/find_packages/s/()/(exclude=['tests'])/" setup.py
}

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
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
