# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=actiona
pkgver=3.10.2
pkgrel=1
pkgdesc='A task automation tool that allows you to create and execute action lists'
arch=('x86_64')
url='https://wiki.actiona.tools'
license=('GPL-3.0-only')
options=('!buildflags')
depends=('qt5-script' 'qt5-xmlpatterns' 'qt5-x11extras' 'qt5-multimedia' 'libnotify' 'qt5-speech' 'opencv' 'qt6-base' 'hdf5' 'glew' 'vtk' 'fmt' 'jsoncpp')
makedepends=('qt5-tools' 'boost' 'cpp-mini' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jmgr/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f24196960302dd961ee7d97264669fc569812ecfceda5f80ddf22235d1dd486e')

build() {
  cd "${pkgname}-${pkgver}"

  sed -i '28 i set(CMAKE_INSTALL_RPATH "/usr/lib/actiona")' CMakeLists.txt
  sed -i '28 i set(CMAKE_BUILD_WITH_INSTALL_RPATH ON)' CMakeLists.txt
  sed -i 's/loadActionPacks(QApplication::applicationDirPath() + QStringLiteral("\/actions")/loadActionPacks(QStringLiteral("\/usr\/lib\/actiona\/actions")/' gui/src/mainwindow.cpp

  mkdir build
  cd build
  cmake ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 actiona.desktop -t ${pkgdir}/usr/share/applications
  install -Dm644 gui/icons/actiona.png -t ${pkgdir}/usr/share/icons/hicolor/48x48/apps
  install -Dm644 gui/icons/actiona.png -t ${pkgdir}/usr/share/pixmaps
  install -Dm644 docs/*.1 -t ${pkgdir}/usr/share/man/man1
  install -Dm644 docs/actiona.xml -t ${pkgdir}/usr/share/mime/packages
  install -Dm644 docs/examples/* -t ${pkgdir}/usr/share/actiona/examples
 
  cd build
 
  install -Dm755 actexec -t ${pkgdir}/usr/bin
  install -Dm755 actiona -t ${pkgdir}/usr/bin
  install -Dm755 actions/*.so -t ${pkgdir}/usr/lib/actiona/actions
  install -Dm755 actiontools/actiontools.so -t ${pkgdir}/usr/lib/actiona
  install -Dm755 execution/execution.so -t ${pkgdir}/usr/lib/actiona
  install -Dm755 tools/tools.so -t ${pkgdir}/usr/lib/actiona
  install -Dm644 translations/*.qm -t ${pkgdir}/usr/share/actiona/locale
}
