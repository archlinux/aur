# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Mladen Pejakovic <pejakm at gmail dot com>

pkgname=qtmobility
pkgver=1.2.0
pkgrel=9
arch=('i686' 'x86_64')
url='https://qt.gitorious.org/qt-mobility'
pkgdesc='A cross-platform application and UI framework'
license=('LGPL2.1' 'GPL3')
depends=('qt4' 'udev')
makedepends=('mesa' 'gstreamer0.10-base' 'gstreamer0.10-bad' 'networkmanager' 'bluez-libs')
optdepends=('networkmanager: for Bearer Management API'
            'gstreamer0.10-base: for Multimedia mediaservice plugins'
            'gstreamer0.10-bad: for Multimedia mediaservice plugins')
source=("http://pkgs.fedoraproject.org/repo/pkgs/qt-mobility/qt-mobility-opensource-src-1.2.0.tar.gz/ea5db5a8d3dd4709c2926dceda646bd8/qt-mobility-opensource-src-1.2.0.tar.gz"
        "qt48.patch"
        "qsensor_fix.patch"
        "pa-header_fix.patch"
        "qbluetooth.patch")
sha256sums=('ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44'
            '55d866ac79bf91aa4d6d4eb637bc8d2d544c1e5ed3106629a2aa9101c59d8385'
            'b5c73dc037dd25dbcb18b410910a642d7f2745c8b97375a9a510f095b8cac071'
            '9ef6af5bb2840b2927797bfe3cc1ef719f78a65a64dd79e03f0163d891fda26c'
            'aa326ad71bf691e4c731dd30ed00fa9e9ba22ede1690c5738b609aa7fb2e2e40')

build() {
  cd "${srcdir}"/qt-mobility-opensource-src-${pkgver}
#   Qt 4.8 patch
  patch -Np1 -i "${srcdir}"/qt48.patch
#   Fix compilation of qtwebkit with gcc 4.7
  patch -Np0 -i "${srcdir}"/qsensor_fix.patch
  patch -Np0 -i "${srcdir}"/pa-header_fix.patch
#  patch -Np0 -i "${srcdir}/qbluetooth.patch"

  ./configure -prefix /usr -release \
      -plugindir /usr/lib/qt4/plugins \
      -qmake-exec qmake-qt4 \
      -modules "bearer contacts gallery location publishsubscribe messaging multimedia systeminfo serviceframework sensors versit organizer feedback"
  make
}

package() {
  cd "${srcdir}"/qt-mobility-opensource-src-${pkgver}
  make INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
