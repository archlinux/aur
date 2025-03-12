# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=esutil
pkgname=python-${_base}
pkgver=0.6.16
pkgrel=1
pkgdesc="Erin Sheldons Python Utilities"
arch=(any)
url="https://github.com/esheldon/${_base}"
license=(GPL-2.0-or-later)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b3d752ac60f50ef7bbe3ab4d42049baba6cdd48c1d574d3d5ee6906b3d18ca06bfcc8f2abc10a0e248c7aeecc68ef2d76c30973a6c71e53e75d8a13dd45382d1')

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
