# Maintainer: Michael Helmling <michaelhelmling@posteo.de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
_base=pytaglib
pkgname=python-${_base}
pkgver=3.0.0
pkgrel=1
pkgdesc="Python audio tagging library"
arch=(x86_64)
url="https://github.com/supermihi/${_base}"
license=(GPL-3.0-or-later)
depends=(python taglib)
makedepends=(python-build python-installer python-setuptools cython python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ade4192fd1cc8331d722ccd30852275577bfd9fc3a638de9e6be8723dbfaa6246704ad8c284d52e2138912903a71641f122b777ff646cb9d0571e7596d601426')

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
