# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Michael Helmling <michaelhelmling@posteo.de>
_base=pytaglib
pkgname=python-${_base}
pkgver=1.5.0
pkgrel=1
pkgdesc="Python audio tagging library"
arch=(x86_64)
url="https://github.com/supermihi/${_base}"
license=(GPL3)
depends=(python taglib)
makedepends=(python-setuptools cython)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1be63e285980b140312aa780a56edf59467ad05aa49b3679d4140a856d07950842e9563ae7783010084e6d82c89b8776bbac94101326f67d041faa410f756556')

build() {
  cd "${_base}-${pkgver}"
  PYTAGLIB_CYTHONIZE=1 python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" python -m pytest tests
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
