# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=handcalcs
pkgname=python-${_base}
pkgdesc="Python library for converting Python calculations into rendered latex"
pkgver=1.11.0
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache-2.0)
depends=(python-more-itertools python-innerscope python-pyparsing)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest python-forallpeople python-pint python-sympy ipython)
optdepends=('python-nb-hideinputs: exporter support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c280dc6ff8bfac555bb0d6fadc4a384070d8ff72694a798d8adb8173465c2dc2d8004975e481a2e83fd0086668711e5d12d5c4bee248633402c3540736ffc2f2')

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
