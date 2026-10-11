# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CMasher
pkgname=python-${_base,,}
pkgdesc="Scientific colormaps for making accessible, informative and cmashing plots"
pkgver=1.9.4
pkgrel=1
arch=(any)
url="https://github.com/1313e/${_base}"
license=(BSD-3-Clause)
depends=(python-colorspacious python-matplotlib)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-viscm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6b026edfabb71960afb405d84cd88ee8f1def0fc0c9069977cd5444242d3b606806bdacabac3400e45697fdd86ee4ac3f7bb626d60dc2a979cdee5ee8a79d88b')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
