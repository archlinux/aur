# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ipydatawidgets
pkgname=python-${_base}
pkgver=4.3.5
pkgrel=1
pkgdesc="A set of widgets to help facilitate reuse of large datasets across widgets"
arch=('x86_64')
url="https://github.com/vidartf/${_base}"
license=('custom:BSD-3-clause')
depends=(python-ipywidgets python-traittypes)
makedepends=(python-build python-installer python-jupyter-packaging python-wheel npm yarn jupyterlab)
checkdepends=(python-pytest python-nbval)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('08df44124257ff484e8c14a451534b943cda8a181c06380aec8f3df254d14cbc1bfc719daafb2230485b9f782bf546d85b67091c2bd0a46ac23ab662be87308c')

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
