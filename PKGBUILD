# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkgname=qtpy
pkgname=python38-qtpy
pkgver=2.2.1
pkgrel=2
pkgdesc="Provides an uniform layer to support PyQt5 and PySide2 with a single codebase"
arch=(any)
url="https://github.com/spyder-ide/qtpy/"
license=(MIT)
depends=(python38-packaging)
makedepends=(python38-setuptools)
optdepends=('python38-pyqt5: Qt5 Python bindings'
            'python38-pyqt6: Qt6 Python bindings'
            'python38-pyqt5-webengine: Qt5-WebEngine python bindings'
            'python38-pyqt6-webengine: Qt6-WebEngine python bindings'
            'pyside2: PySide Qt5 Python bindings'
            'pyside6: PySide Qt6 Python bindings')
# The test suite does not support both stacks at the same time
checkdepends=(
    python38-pytest
    python38-pytest-qt
    python38-pyqt5
    python38-pyqt5-3d
    python38-pyqt5-datavisualization
    python38-pyqt5-webengine
    #python38-pyqt6
    #python38-pyqt6-3d
    #python38-pyqt6-datavisualization
    #python38-pyqt6-webengine
    pyside2
    #pyside6
    qt5-multimedia
    qt5-remoteobjects
    qt5-sensors
    qt5-serialport
    qt5-speech
    qt5-svg
    qt5-tools
    qt5-websockets
    qt5-xmlpatterns
    #qt6-multimedia
    #qt6-remoteobjects
    #qt6-sensors
    #qt6-serialport
    #qt6-svg
    #qt6-tools
    xorg-server-xvfb
)   
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('bbf4639ba4be8028bde0d6bef341f6c6ea6d1ccc82cec2b8b7df191ba3018b7b')

build() {
  cd ${_pkgname}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  sed -i 's|--cov=qtpy --cov-report=term-missing||' pytest.ini
  PYTHONPATH="${PWD}"/build/lib xvfb-run --auto-servernum pytest qtpy
}

package() {
  cd ${_pkgname}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
