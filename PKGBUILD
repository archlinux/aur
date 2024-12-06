# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=forallpeople
pkgname=python-${_base}
pkgdesc="Python SI units library"
pkgver=2.7.1
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a86e4bc0ead5e9f367a1c00e80bef2fc60ed5743e55ac1cb39296c6ef9040b37550abca9c9307a600001571c967d317544284457d502c96c754529a81f28b98b')

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
  install -Dm 644 LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
