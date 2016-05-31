# Author: Simone Tobia <simone.tobia at gmail dot com>
# Maintainer: Evgeniy "arcanis" Alekseev <esalexeev@gmail.com>

pkgname=appset-qt
pkgver='0.7.2'
pkgrel=6
pkgdesc="An advanced and feature rich Package Manager Frontend"
arch=('i686' 'x86_64')
url="http://appset.sourceforge.net/"
license=('GPL2')
depends=('qt4>=4.7' 'qtwebkit')
optdepends=('packer: for AUR support')
source=(http://sourceforge.net/projects/appset/files/appset-qt/0.7/${pkgver}/${pkgname}-${pkgver}-sources.tar.gz
        appset-qt-errno.patch
        appset-helper.service)
install=${pkgname}.install
changelog=${pkgname}.changelog
md5sums=('8658b6452e1f941af8501a6a772b6cd9'
         'c26afcf570cdc6b954150fe39d116b85'
         '7791c134cc275b387c1290f771e43a3d')

prepare() {
  patch -p0 -i "appset-qt-errno.patch"
}

build() {
  cd "${pkgname}-${pkgver}-sources"

  qmake-qt4 PREFIX=/usr -Wnone

  # localization
  lrelease-qt4 Qt/AppSet-Qt/*.ts
  lrelease-qt4 Qt/AppSetTray-Qt/*.ts
  lrelease-qt4 Qt/AppSetRepoEditor-Qt/*.ts

  make
}

package() {
  cd "${pkgname}-${pkgver}-sources"

  make INSTALL_ROOT="${pkgdir}" install
  # appset-helper daemon
  install -D -m644 ../appset-helper.service "${pkgdir}/usr/lib/systemd/system/appset-helper.service"
}
