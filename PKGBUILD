# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyside2
pkgname=(python-pyside2 python2-pyside2)
_qtver=5.11.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='http://qt-project.org/'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Enables the use of Qt5 APIs in Python applications'
makedepends=(python-setuptools python2-setuptools clang llvm cmake libxslt
             qt5-xmlpatterns qt5-multimedia qt5-tools qt5-sensors qt5-charts qt5-webengine qt5-datavis3d
             qt5-websockets qt5-speech qt5-3d qt5-svg qt5-script qt5-scxml qt5-x11extras)
groups=(qt qt5)
_pkgfqn=pyside-setup-everywhere-src-${_qtver}
source=("http://download.qt.io/official_releases/QtForPython/pyside2/PySide2-$pkgver-src/${_pkgfqn}.tar.xz")
sha256sums=('fbc412c4544bca308291a08a5173a949ca530d801f00b8337902a5067e490922')

prepare() {
  cp -r ${_pkgfqn} ${_pkgfqn}-py2
}

build() {
  cd ${_pkgfqn}
  python setup.py build

  cd ../${_pkgfqn}-py2
  python2 setup.py build
}

package_python-pyside2() {
  depends=(python qt5-base)
  optdepends=('clang: for shiboken'
              'qt5-svg: QtSvg bindings'
              'qt5-script: QtScript bindings'
              'qt5-speech: QtTextToSpeech bindings'
              'qt5-websockets: QtWebSockets bindings'
              'qt5-webengine: QtWebEngine bindings'
              'qt5-datavis3d: QtDataVisualization bindings'
              'qt5-scxml: QtScxml bindings'
              'qt5-sensors: QtSensors bindings'
              'qt5-3d: Qt3D bindings'
              'qt5-x11extras: QtX11Extras bindings'
              'qt5-charts: QtCharts bindings'
              'qt5-tools: QtHelp bindings')
  cd ${_pkgfqn}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}

package_python2-pyside2() {
  depends=(python2 qt5-base)
  optdepends=('clang: for shiboken'
              'qt5-svg: QtSvg bindings'
              'qt5-script: QtScript bindings'
              'qt5-speech: QtTextToSpeech bindings'
              'qt5-websockets: QtWebSockets bindings'
              'qt5-webengine: QtWebEngine bindings'
              'qt5-datavis3d: QtDataVisualization bindings'
              'qt5-scxml: QtScxml bindings'
              'qt5-sensors: QtSensors bindings'
              'qt5-3d: Qt3D bindings'
              'qt5-x11extras: QtX11Extras bindings'
              'qt5-charts: QtCharts bindings'
              'qt5-tools: QtHelp bindings')
  cd ${_pkgfqn}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}

  # Fix conflict with python-pyside2
  rm -r "$pkgdir"/usr/bin
}
