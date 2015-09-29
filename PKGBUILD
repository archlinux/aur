# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgfqdn=qtwayland
pkgname=hawaii-qt5-wayland
pkgver=5.5.0
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtWayland)"
arch=('i686' 'x86_64' 'armv6hl' 'armv7hl')
url="http://qt.io/"
license=('GPL3' 'LGPL')
depends=('qt5-base' 'qt5-declarative' 'libxcomposite' 'libxrender' 'mtdev' 'wayland')
provides=('qt5-wayland')
conflicts=('qt5-wayland' 'hawaii-qt5-wayland-git')
replaces=('qt5-wayland')
makedepends=('git' 'gdb')
options=('!libtool' 'debug')
source=("http://download.qt-project.org/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqdn}-opensource-src-${pkgver}.tar.xz"
         "Update_wayland.xml_to_1.6.patch")
md5sums=('34a8def020585b563fad9bfe9be49563'
         '604ecf79b3c3c3943fae9c792074a250')
_ver=5.5.0

build() {
  cd ${_pkgfqdn}-opensource-src-${pkgver}
  patch -p1 < $srcdir/Update_wayland.xml_to_1.6.patch
  qmake CONFIG+=wayland-compositor
  make
}

package() {
  cd ${_pkgfqdn}-opensource-src-${pkgver}
  make INSTALL_ROOT="${pkgdir}" install

  # Workaround to install generated private headers
  #cp ./include/QtCompositor/${_ver}/QtCompositor/private/{qwayland-server-*,*protocol*}.h \
  #    ${pkgdir}/usr/include/qt/QtCompositor/${_ver}/QtCompositor/private/
}
