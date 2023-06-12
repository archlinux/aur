# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ipydatawidgets
pkgname=python-${_base}
pkgver=4.3.4
pkgrel=1
pkgdesc="A set of widgets to help facilitate reuse of large datasets across widgets"
arch=('x86_64')
url="https://github.com/vidartf/${_base}"
license=('custom:BSD-3-clause')
depends=(python-ipywidgets python-traittypes)
makedepends=(python-build python-installer python-jupyter-packaging python-wheel npm yarn jupyterlab)
checkdepends=(python-pytest python-nbval)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('848ca0da1d4ffca33c143da817532296b5108fd8d6448077a2f8e5db8a4117e2b2201d559cdeaa4b6e737c6172e9d18bcd24a68cb12411a07ab40acc80c38412')

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
