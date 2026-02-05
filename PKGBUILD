# Maintainer: Michael Helmling <michaelhelmling@posteo.de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
_base=pytaglib
pkgname=python-${_base}
pkgver=3.2.0
pkgrel=1
pkgdesc="Python audio tagging library"
arch=(x86_64)
url="https://github.com/supermihi/${_base}"
license=(GPL-3.0-or-later)
depends=(python taglib)
makedepends=(python-build python-installer python-setuptools cython python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b69135539558f8f6216dee588baf2b4b47500de0da2e9a43f45f5f0e0a4c6195463c452268bee50828c53b63e3dcc2aa3dd9af56e3dac1a67948b31e7254eae1')

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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
