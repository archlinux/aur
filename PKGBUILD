# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=panel
pkgname=python-${_base}
pkgver=0.13.0a45
pkgrel=1
pkgdesc="A high-level app and dashboarding solution for Python"
arch=(any)
url="https://${_base}.holoviz.org"
license=('custom:BSD-3-clause')
depends=(python-bokeh python-pyviz_comms python-markdown python-tqdm python-pyct python-bleach)
makedepends=(python-setuptools npm)
source=(${_base}-${pkgver}::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('d01e6a7dccbd1b56350c925beb840b244d6cd78c73c9f16366b7702207c9baa4a6c8069f9636e1a71af2ade4c16b3feec5f9b804d196739cd1163c9fae25d349')

prepare() {
  # https://github.com/holoviz/panel/issues/3257
  sed -i '/^from jinja2 import Environment, Markup, FileSystemLoader/d' ${_base}-${pkgver}/${_base}/io/resources.py
  sed -i '23 a from markupsafe import Markup' ${_base}-${pkgver}/${_base}/io/resources.py
  sed -i '24 a from jinja2.environment import Environment' ${_base}-${pkgver}/${_base}/io/resources.py
  sed -i '25 a from jinja2.loaders import FileSystemLoader' ${_base}-${pkgver}/${_base}/io/resources.py
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
