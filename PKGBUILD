# Maintainer: Michael Helmling <michaelhelmling@posteo.de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
_base=pytaglib
pkgname=python-${_base}
pkgver=3.1.0
pkgrel=1
pkgdesc="Python audio tagging library"
arch=(x86_64)
url="https://github.com/supermihi/${_base}"
license=(GPL-3.0-or-later)
depends=(python taglib)
makedepends=(python-build python-installer python-setuptools cython python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bfdf56a9842054ed7c869d3b4ddac08ae33464ddc3457ce90e2ad13ce6d8445ed2835cacde12490147928ba7c2fbbd8d9e683336b077cf6ef2c1d0de687858f5')

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
