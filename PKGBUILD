# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=handcalcs
pkgname=python-${_base}
pkgdesc="Python library for converting Python calculations into rendered latex"
pkgver=1.10.0
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache-2.0)
depends=(python-more-itertools python-innerscope python-pyparsing)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest python-forallpeople python-pint python-sympy ipython)
optdepends=('python-nb-hideinputs: exporter support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9f95b7bf53f479846f05d4d72b4aee12bd7fc8ef77aa919e4b34bc9d45c80e8fcf1ecdf015feb56300273daf02c036e911e687c40637ae15fbd3dc94b1719227')

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
