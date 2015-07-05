# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>

pkgbase=netctl-gui-qt4
_pkgbase=netctl-gui
pkgname=('libnetctlgui-qt4' 'netctlgui-helper-qt4' 'netctl-gui-qt4'
         'kdeplasma-applets-netctl-gui')
pkgver=1.4.8
pkgrel=1
pkgdesc="Qt4 GUI for netctl. Also provides a widget for KDE4"
arch=('i686' 'x86_64')
url="http://arcanis.name/projects/netctl-gui"
license=('GPL3')
makedepends=('automoc4' 'cmake' 'kdelibs')
source=("https://github.com/arcan1s/netctl-gui/releases/download/V.${pkgver}/${_pkgbase}-${pkgver}-src.tar.xz")
md5sums=('0c50a436064c31f890f69d5f321d2e27')


prepare() {
  rm -rf "${srcdir}/build-"{plasmoid,qt4}
  mkdir "${srcdir}/build-"{plasmoid,qt4}
}


build() {
  cd "${srcdir}/build-plasmoid"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_GUI:BOOL=0 \
        -DBUILD_LIBRARY:BOOL=0 \
        -DBUILD_HELPER:BOOL=0 \
        -DBUILD_KDE4:BOOL=1 \
        "../${_pkgbase}"
  make

  cd "${srcdir}/build-qt4"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DATAENGINE:BOOL=0 \
        -DBUILD_PLASMOID:BOOL=0 \
        -DUSE_CAPABILITIES:BOOL=0 \
        -DUSE_QT5:BOOL=0 \
        "../${_pkgbase}"
  make
}


package_kdeplasma-applets-netctl-gui() {
  pkgdesc="A KDE4 plasmoid, which interacts with netctl. A part of netctl-gui"
  depends=('netctl' 'kdebase-workspace')
  optdepends=('netctlgui-helper-qt4: DBus helper daemon'
              'netctl-gui-qt4: graphical front-end'
              'sudo: sudo support')
  install="kdeplasma-applets-netctl-gui.install"

  cd "${srcdir}/build-plasmoid"
  make DESTDIR="${pkgdir}" install
}


package_libnetctlgui-qt4() {
  pkgdesc="Qt4 library which interacts with netctl. A part of netctl-gui"
  depends=('netctl' 'qt4')
  optdepends=('netctlgui-helper-qt4: DBus helper daemon'
              'sudo: sudo support'
              'wpa_supplicant: wifi support')
  provides=('libnetctlgui')
  conflicts=('libnetctlgui')

  cd "${srcdir}/build-qt4/netctlgui"
  make DESTDIR="${pkgdir}" install
}


package_netctlgui-helper-qt4() {
  pkgdesc="Helper daemon for netctl-gui. A part of netctl-gui"
  depends=("libnetctlgui-qt4=${pkgver}")
  provides=('netctlgui-helper')
  conflicts=('netctlgui-helper')
  backup=('etc/netctl-gui.conf'
          'etc/dbus-1/system.d/org.netctlgui.helper.conf')
  install="netctlgui-helper.install"

  cd "${srcdir}/build-qt4/helper"
  make DESTDIR="${pkgdir}" install
}


package_netctl-gui-qt4() {
  pkgdesc="Qt4 graphical front-end for netctl. A part of netctl-gui"
  depends=("libnetctlgui-qt4=${pkgver}")
  optdepends=('kdeplasma-applets-netctl-gui: KDE widget'
              'netctlgui-helper-qt4: DBus helper daemon')
  provides=('netctl-gui')
  conflicts=('netctl-gui')
  install="netctl-gui.install"

  cd "${srcdir}/build-qt4/gui"
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}/build-qt4/resources"
  make DESTDIR="${pkgdir}" install
}
