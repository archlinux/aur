
pkgname=('python-pyqt5-pre-release')
pkgdesc="A set of Python bindings for the Qt5 toolkit"
pkgver=5.15.11
pkgrel=1
arch=('x86_64')
url="https://riverbankcomputing.com/software/pyqt/intro"
license=('GPL')
groups=(pyqt5)
depends=('python-pyqt5-sip' 'qt5-base')
optdepends=('python-opengl: enable OpenGL 3D graphics in PyQt applications'
            'python-dbus: for python-dbus mainloop support'
            'qt5-multimedia: QtMultimedia, QtMultimediaWidgets'
            'qt5-tools: QtHelp, QtDesigner'
            'qt5-svg: QtSvg'
            'qt5-xmlpatterns: QtXmlPatterns'
            'qt5-declarative: QtQml, qmlplugin'
            'qt5-serialport: QtSerialPort'
            'qt5-websockets: QtWebSockets'
            'qt5-connectivity: QtNfc, QtBluetooth'
            'qt5-x11extras: QtX11Extras'
            'qt5-remoteobjects: QtRemoteObjects'
            'qt5-speech: QtTextToSpeech'
            'qt5-quick3d: QtQuick3D'
            'qt5-location: QtLocation, QtPositioning'
            'qt5-sensors: QtSensors'
            'qt5-webchannel: QtWebChannel')
provides=(qt5-python-bindings python-pyqt5)
makedepends=(
    'sip' 'pyqt-builder' 'python-opengl' 'python-dbus'
    'qt5-connectivity' 'qt5-multimedia' 'qt5-tools' 'qt5-serialport' 'qt5-speech' 'qt5-svg'
    'qt5-websockets' 'qt5-x11extras' 'qt5-xmlpatterns' 'qt5-remoteobjects' 'qt5-quick3d'
    'qt5-sensors' 'qt5-webchannel' 'qt5-location')
conflicts=('pyqt5-common' 'python-pyqt5')
source=("https://www.riverbankcomputing.com/pypi/packages/PyQt5/PyQt5-5.15.11.dev2311181444.tar.gz")
md5sums=('c728844552577d75dd0acb76f85872da')

_src=PyQt5-5.15.11.dev2311181444
build() {
    cd ${_src}
    sip-build \
        --confirm-license \
        --no-make \
        --api-dir /usr/share/qt/qsci/api/python \
        --pep484-pyi \
        --jobs $(nproc)
    cd build
    make -j`nproc`
}

package(){
    cd ${_src}/build
    make INSTALL_ROOT="$pkgdir" install

    # Remove unused py2 version of uic modules:
    rm -r "$pkgdir"/usr/lib/python*/site-packages/PyQt5/uic/port_v2

    # compile Python bytecode
    python -m compileall -d / "$pkgdir"/usr/lib
    python -O -m compileall -d / "$pkgdir"/usr/lib
}
