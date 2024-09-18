# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=handcalcs
pkgname=python-${_base}
pkgdesc="Python library for converting Python calculations into rendered latex"
pkgver=1.9.0
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache-2.0)
depends=(python-more-itertools python-innerscope python-pyparsing)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest python-forallpeople python-pint python-sympy ipython)
optdepends=('python-nb-hideinputs: exporter support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cdbae17eb63366ab6704dc0a266757cd526ca50c218fbd51ffdb1caf182879169c78aa97302274e4c82bde1ec9bf0ade33dea8dc5983ddc312633b1b55d7c69f')

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
