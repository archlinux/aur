# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>

pkgbase=netctl-gui
pkgname=('libnetctlgui' 'netctlgui-helper' 'netctl-gui'
         'plasma5-applet-netctl-gui')
pkgver=1.4.9
pkgrel=1
pkgdesc="Qt4/Qt5 GUI for netctl. Also provides a widget for KDE"
arch=('i686' 'x86_64')
url="http://arcanis.name/projects/netctl-gui"
license=('GPL3')
makedepends=('cmake' 'extra-cmake-modules' 'plasma-framework' 'qt5-tools')
source=("https://github.com/arcan1s/netctl-gui/releases/download/V.${pkgver}/${pkgbase}-${pkgver}-src.tar.xz")
md5sums=('64c04c36eea017e7c0ddf687d60de128')

prepare() {
  rm -rf "${srcdir}/build-"{plasmoid,qt5}
  mkdir "${srcdir}/build-"{plasmoid,qt5}
}


build() {
  cd "${srcdir}/build-plasmoid"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DBUILD_GUI:BOOL=0 \
        -DBUILD_LIBRARY:BOOL=0 \
        -DBUILD_HELPER:BOOL=0 \
        "../${pkgbase}"
  make

  cd "${srcdir}/build-qt5"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DATAENGINE:BOOL=0 \
        -DBUILD_PLASMOID:BOOL=0 \
        -DUSE_CAPABILITIES:BOOL=0 \
        "../${pkgbase}"
  make
}


package_plasma5-applet-netctl-gui() {
  pkgdesc="A KF5 plasmoid, which interacts with netctl. A part of netctl-gui"
  depends=('netctl' 'plasma-framework')
  optdepends=('netctlgui-helper: DBus helper daemon'
              'netctl-gui: graphical front-end'
              'sudo: sudo support')
  install="plasma-netctl-gui.install"

  cd "${srcdir}/build-plasmoid"
  make DESTDIR="${pkgdir}" install
}


package_libnetctlgui() {
  pkgdesc="Qt5 library which interacts with netctl. A part of netctl-gui"
  depends=('netctl' 'qt5-base')
  optdepends=('netctlgui-helper: DBus helper daemon'
              'sudo: sudo support'
              'wpa_supplicant: wifi support')
  provides=('libnetctlgui-qt4')
  conflicts=('libnetctlgui-qt4')

  cd "${srcdir}/build-qt5/netctlgui"
  make DESTDIR="${pkgdir}" install
}


package_netctlgui-helper() {
  pkgdesc="Helper daemon for netctl-gui. A part of netctl-gui"
  depends=("libnetctlgui=${pkgver}")
  provides=('netctlgui-helper-qt4')
  conflicts=('netctlgui-helper-qt4')
  backup=('etc/netctl-gui.conf'
          'etc/dbus-1/system.d/org.netctlgui.helper.conf')
  install="netctlgui-helper.install"

  cd "${srcdir}/build-qt5/helper"
  make DESTDIR="${pkgdir}" install
}


package_netctl-gui() {
  pkgdesc="Qt5 graphical front-end for netctl. A part of netctl-gui"
  depends=("libnetctlgui=${pkgver}" 'xdg-utils')
  optdepends=('plasma-netctl-gui: KF5 widget'
              'netctlgui-helper: DBus helper daemon')
  provides=('netctl-gui-qt4')
  conflicts=('netctl-gui-qt4')
  install="netctl-gui.install"

  cd "${srcdir}/build-qt5/gui"
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}/build-qt5/resources"
  make DESTDIR="${pkgdir}" install
}
