# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ipydatawidgets
pkgname=python-${_base}
pkgver=4.3.3
pkgrel=2
pkgdesc="A set of widgets to help facilitate reuse of large datasets across widgets"
arch=('x86_64')
url="https://github.com/vidartf/${_base}"
license=('custom:BSD-3-clause')
depends=(python-ipywidgets python-traittypes)
makedepends=(python-build python-installer python-jupyter-packaging python-wheel npm yarn jupyterlab)
checkdepends=(python-pytest python-nbval)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('5ce48993facaf545c40c43c55951e437e2f57d0739e369359c863cc369ca34fa03a352e074945847e4a113c49adf7d3634ea4ba9d7fa911c2a5df321471f0fda')

build() {
  cd ${_base}-${pkgver}
  yarn install
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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
