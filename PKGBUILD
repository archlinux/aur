# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-common
pkgname=python-${_base}
pkgdesc="Dependency less classes and functions for trame"
pkgver=1.2.1
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('00ac0508eee627a9c3b23233733a4cafe10ae8aa8c13ce2a471fb6e04b69b59a5e24081928911ee18a5ce170574dc82827127bcdc89d2bac5a714aa367a651c3')

build() {
  cd ${srcdir}/${_base}-${pkgver}
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
}
