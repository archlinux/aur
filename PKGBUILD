# Contributor: Markus Hovorka <m.hovorka@live.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Matthias Maennich <arch@maennich.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Jan-Erik Meyer-Luetgens <nyan at meyer-luetgens dot de>

pkgbase=pyside2-git
pkgname=(pyside2-common-git python2-pyside2-git python-pyside2-git)
pkgver=5.11.0.r5746.5dc72386
_upver=5.11.0
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
url="http://qt-project.org/wiki/PySide"
makedepends=("python"{,2}"-shiboken2-git" 'cmake'
             'phonon-qt5' 'git' 'python2-sphinx' 'graphviz' 'qt5-base'
             'qt5-xmlpatterns' 'qt5-tools' 'qt5-multimedia' 'qt5-declarative' 'qt5-scxml'
             'qt5-script' 'qt5-speech' 'qt5-svg' 'qt5-datavis3d' 'qt5-3d'
             'qt5-webchannel' 'qt5-webengine' 'qt5-webkit' 'qt5-websockets')
source=("$pkgbase::git+https://code.qt.io/pyside/pyside-setup.git#branch=5.11")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgbase"
    printf "%s.r%s.%s" "$_upver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/$pkgbase/sources/pyside2
}

build() {
  # QtWebKitWidgets: https://bugreports.qt.io/browse/PYSIDE-598
  cmake_args="-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DQt5WebKitWidgets_FOUND=FALSE"

  # Build for python2.
  cd "$srcdir"/$pkgbase/sources/pyside2
  mkdir -p build-py2 && cd build-py2
  cmake \
    -DUSE_PYTHON_VERSION=2 \
    ${cmake_args} ..
  make

  # Build for python3.
  cd "$srcdir"/$pkgbase/sources/pyside2
  mkdir -p build-py3 && cd build-py3
  cmake \
    -DUSE_PYTHON_VERSION=3 \
    ${cmake_args} ..
  make
}

package_pyside2-common-git(){
  pkgdesc="LGPL Qt bindings for Python (Common Files)"

  cd "$srcdir"/$pkgbase/sources/pyside2/build-py3
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/lib/pkgconfig
  rm -rf "$pkgdir"/usr/lib/python* "$pkgdir"/usr/lib/libpyside2.*
  rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2Config*python*.cmake
}

package_python-pyside2-git(){
  depends=('python' "python-shiboken2-git" "pyside2-common-git" "qt5-base")
  pkgdesc="LGPL Qt bindings for Python 3"
  optdepends=('qt5-xmlpatterns' 'qt5-tools' 'qt5-multimedia'
              'qt5-declarative' 'qt5-script' 'qt5-speech' 'qt5-svg' 'qt5-datavis3d' 'qt5-3d'
              'qt5-webchannel' 'qt5-webengine' 'qt5-webkit' 'qt5-websockets')

  cd "$srcdir"/$pkgbase/sources/pyside2/build-py3
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/include
  rm -rf "$pkgdir"/usr/share
  rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2Config.cmake
  rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2ConfigVersion.cmake
}

package_python2-pyside2-git(){
  depends=('python2' "python2-shiboken2-git" "pyside2-common-git" "qt5-base")
  pkgdesc="LGPL Qt bindings for Python 2"
  optdepends=('qt5-xmlpatterns' 'qt5-tools' 'qt5-multimedia'
              'qt5-declarative' 'qt5-script' 'qt5-speech' 'qt5-svg' 'qt5-datavis3d' 'qt5-3d'
              'qt5-webchannel' 'qt5-webengine' 'qt5-webkit' 'qt5-websockets')

  cd "$srcdir"/$pkgbase/sources/pyside2/build-py2
  make DESTDIR="$pkgdir" install

  mv "$pkgdir"/usr/lib/pkgconfig/pyside2{,-py2}.pc

  sed -i 's#^Requires: shiboken$#Requires: shiboken-py2#' \
      "$pkgdir"/usr/lib/pkgconfig/pyside2-py2.pc

  rm -rf "$pkgdir"/usr/include
  rm -rf "$pkgdir"/usr/share
  rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2Config.cmake
  rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2ConfigVersion.cmake
}
