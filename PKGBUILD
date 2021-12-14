# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_base=viscm
pkgname=python-${_base}
pkgdesc="A tool for visualizing and designing colormaps using colorspacious and matplotlib"
pkgver=0.9
pkgrel=4
arch=('any')
url="https://github.com/matplotlib/${_base}"
license=(MIT)
depends=(python-matplotlib python-colorspacious pyside2)
makedepends=(python-setuptools)
# checkdepends=(python-pytest python-scipy)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('aa352f12c243f9940297dc2799e1ad1e649f8bfc0c3a5bb772f351ec0d3c380619382da847e090c1191840036a3f06ccf552658c59ce2296f576e5213884e334')

prepare() {
  # https://github.com/matplotlib/viscm/issues/55
  sed -i 's/^from matplotlib.backends.backend_qt4agg import FigureCanvasQTAgg as FigureCanvas4/#from matplotlib.backends.backend_qt4agg import FigureCanvasQTAgg as FigureCanvas4/' "${_base}-${pkgver}/${_base}/gui.py"
  sed -i 's/^from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas5/#from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas5/' "${_base}-${pkgver}/${_base}/gui.py"
  sed -i '21 a try:' "${_base}-${pkgver}/${_base}/gui.py"
  sed -i '22 a \ \ \ \ from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas5' "${_base}-${pkgver}/${_base}/gui.py"
  sed -i '23 a except Exception:' "${_base}-${pkgver}/${_base}/gui.py"
  sed -i '24 a \ \ \ \ from matplotlib.backends.backend_qt4agg import FigureCanvasQTAgg as FigureCanvas4' "${_base}-${pkgver}/${_base}/gui.py"
  sed -i 's/^from matplotlib.backends.backend_qt4agg import FigureCanvasQTAgg as FigureCanvas/from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas/' "${_base}-${pkgver}/tests.py"
}

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   py.test tests.py -vv # -k 'not editor_loads_native'
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
