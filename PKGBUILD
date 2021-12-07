# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Michael Helmling <michaelhelmling@posteo.de>
_base=pytaglib
pkgname=python-${_base}
pkgver=1.4.6
pkgrel=5
pkgdesc="Python audio tagging library"
arch=(x86_64)
url="https://github.com/supermihi/${_base}"
license=(GPL3)
depends=(python taglib)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4b438759440790b3c850cf165b553f7e6066bf0064e041cca3e46831046b12a87decd4429772ea0c50e1b27cbbd2c82ba709361bc01aa2e8ec3064458aeae0ff')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  local _pyversion=$(python -c "import sys; print(sys.version[:3])")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" python -m pytest tests
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
