# Maintainer: Jose Riha <jose1711 gmail com>
# adopted from https://github.com/KaOSx/apps/tree/master/gcompris

pkgname=gcompris-qt-git
_pkgname=gcompris-qt
pkgver=r2880.bef46ac
pkgrel=1
pkgdesc="High quality educational software suite comprising of numerous activities for children aged 2 to 10 - git (Qt version)"
arch=('x86_64' 'i686')
url="http://gcompris.net/"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-tools' 'qt5-declarative' 'qt5-svg' 'qt5-graphicaleffects' 'qt5-sensors'
         'qml-box2d')
makedepends=('texinfo' 'intltool' 'git' 'extra-cmake-modules' 'python2' 'qt5-tools' 'git')
provides=('gcompris-qt')
conflicts=('gcompris-qt')
source=($_pkgname::git+https://github.com/gcompris/GCompris-qt
        'gcompris-qt.desktop'
        'gcompris-qt.png'
        'https://github.com/KDE/gcompris/commit/134db8042f25b0446523653d9a8829916eda3006.diff')
md5sums=('SKIP'
         '4c64dcff4d8d4374aff551dd3f0e3441'
         '7c7cee3479f1a47376db800b2bc37017'
         '6afef263379444064f2638fe20780098')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  }

prepare() {
  cd ${_pkgname}
  python2 tools/l10n-fetch-po-files.py
  # patch -p1 -i ${srcdir}/134db8042f25b0446523653d9a8829916eda3006.diff
}
         
build() {
  [ ! -d build ] && mkdir build
  
  cd build 
  cmake ../${_pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DQML_BOX2D_MODULE=system \
    -DQML_BOX2D_LIBRARY=/usr/lib/qt/qml/Box2D.2.0/ \
    -DLCONVERT_EXECUTABLE=/usr/bin/lconvert \
    -DLRELEASE_EXECUTABLE=/usr/bin/lrelease
  make 
  make BuildTranslations
}

package() {
  cd build
  make DESTDIR=${pkgdir} install
  
  install -Dm644 ${srcdir}/gcompris-qt.desktop ${pkgdir}/usr/share/applications/gcompris-qt.desktop             
  install -Dm644 ${srcdir}/gcompris-qt.png ${pkgdir}/usr/share/pixmaps/gcompris-qt.png
}
