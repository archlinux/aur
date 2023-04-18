# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyside2
pkgname=(shiboken2 python-shiboken2 pyside2 pyside2-tools)
_qtver=5.15.9
_clangver=15.0.7
pkgver=${_qtver/-/}
pkgrel=5
arch=(x86_64)
url='https://www.qt.io'
license=(LGPL)
makedepends=(cmake python-setuptools llvm clang=$_clangver
             qt5-multimedia qt5-tools qt5-sensors qt5-charts qt5-webengine qt5-datavis3d
             qt5-websockets qt5-speech qt5-3d qt5-svg qt5-script qt5-scxml qt5-x11extras
             qt5-quickcontrols2 qt5-serialport qt5-remoteobjects qt5-xmlpatterns)
optdepends=('qt5-svg: QtSvg bindings'
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
            'qt5-tools: QtHelp bindings'
            'qt5-remoteobjects: QtRemoteObjects bindings'
            'qt5-serialport: QtSerialPort bindings'
            'qt5-quickcontrols2: QtQuickControls2 bindings')
_pkgfqn=pyside-setup-opensource-src-$_qtver
source=(https://download.qt.io/official_releases/QtForPython/pyside2/PySide2-$pkgver-src/${_pkgfqn}-1.tar.xz
        python3.11.patch)
sha256sums=('3298660742037c71274a30770541abf6d1552ec65fc93678eedee5718852a62c'
            'e91549f7d3da412e864af26f604d0023b80233a7165f50fa21e53cbe861db886')

prepare() {
  patch -d $_pkgfqn -p1 < python3.11.patch # Fix build with Python 3.11
  sed -e 's|0x030AFFFF|0x030BFFFF|' -i $_pkgfqn/sources/shiboken2/libshiboken/pep384impl.h
}

build() {
  cmake -B build -S $_pkgfqn \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_TESTS=OFF \
    -DPYTHON_EXECUTABLE=/usr/bin/python
  cmake --build build
}

package_shiboken2() {
  pkgdesc='Generates bindings for C++ libraries using CPython source code'
  depends=(clang=$_clangver llvm libxslt qt5-xmlpatterns)

  DESTDIR="$pkgdir" cmake --install build/sources/shiboken2
# Provided in python-shiboken2
  rm -r "$pkgdir"/usr/lib/{python*,libshiboken*}
# Conflicts with shiboken6 and doesn't work anyway
  rm "$pkgdir"/usr/bin/shiboken_tool.py
}

package_python-shiboken2() {
  pkgdesc='Python bindings for shiboken2'
  depends=(python)

  DESTDIR="$pkgdir" cmake --install build/sources/shiboken2
# Provided in shiboken2
  rm -r "$pkgdir"/usr/{bin,include,lib/{cmake,pkgconfig}}

# Install egg-info
  cd $_pkgfqn
  python setup.py egg_info --build-type=shiboken2
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  cp -r shiboken2.egg-info "$pkgdir"/$_pythonpath
}

package_pyside2() {
  pkgdesc='Enables the use of Qt5 APIs in Python applications'
  depends=(python-shiboken2 qt5-declarative)
  optdepends=('qt5-svg: QtSvg bindings'
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
              'qt5-tools: QtHelp bindings'
              'qt5-remoteobjects: QtRemoteObjects bindings'
              'qt5-serialport: QtSerialPort bindings'
              'qt5-quickcontrols2: QtQuickControls2 bindings')
  provides=(qt5-python-bindings)

  DESTDIR="$pkgdir" cmake --install build/sources/pyside2
# Install egg-info
  cd $_pkgfqn
  python setup.py egg_info --build-type=pyside2
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  cp -r PySide2.egg-info "$pkgdir"/$_pythonpath
}

package_pyside2-tools() {
  pkgdesc='Tools for PySide2'
  depends=(pyside2)

  DESTDIR="$pkgdir" cmake --install build/sources/pyside2-tools
  rm "$pkgdir"/usr/bin/{rcc,uic,designer,pyside_tool.py} # provided by qt5-base
}
