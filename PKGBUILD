# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=handcalcs
pkgname=python-${_base}
pkgdesc="Python library for converting Python calculations into rendered latex"
pkgver=1.8.0
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache-2.0)
depends=(python-more-itertools jupyter-nbconvert python-innerscope python-pyparsing)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest python-forallpeople python-pint python-sympy)
source=(${_base}-v.${pkgver}.tar.gz::${url}/archive/v.${pkgver}.tar.gz)
sha512sums=('2a45316a8c3fa1f1ea1f268e16c93536d54edb10b4b78e6aa933ab0a2da1155fbfe84017e501dda0da3be1e81b10f35a5dff05d490a40b2cb61ba1078ce87eca')

build() {
  cd ${_base}-v.${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-v.${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-v.${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}