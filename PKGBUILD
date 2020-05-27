# $Id$
# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=akonadi-qt4
pkgname=(libakonadi-qt4 akonadi-qt4)
pkgver=1.13.0
pkgrel=17
pkgdesc="PIM layer, which provides an asynchronous API to access all kind of PIM data (Qt4 version)"
arch=('x86_64')
url='https://kontact.kde.org'
license=('LGPL')
makedepends=(extra-cmake-modules postgresql qt5-tools boost kitemmodels kaccounts-integration mariadb qt4 libxslt)
provides=('akonadi')
conflicts=('akonadi' 'akonadi-contacts')
source=("https://download.kde.org/stable/akonadi/src/akonadi-${pkgver}.tar.bz2"
        dont-leak-old-external-payload-files.patch)
sha256sums=('8c7f690002ea22c139f3a64394aef2e816e00ca47fd971af7d54a66087356dd2'
            'e6644929ebec09986113be49f9aabf23e47e04585295319787ff7777e8af31b9')

prepare() {
  mkdir -p build

  cd akonadi-$pkgver
  # https://bugs.kde.org/show_bug.cgi?id=341884
  patch -p1 -i ../dont-leak-old-external-payload-files.patch
}

build() {
  cd build
  cmake ../akonadi-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_QSQLITE_IN_QT_PREFIX=TRUE \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DWITH_SOPRANO=OFF \
    -DBUILD_TESTING=OFF
  make
}

package_libakonadi-qt4() {
  pkgdesc='Qt4 akonadi libraries'
  depends=('qt4')
  conflicts=('akonadi<15')

  cd build
  make DESTDIR="$pkgdir" install

# conflicts with akonadi
  rm -r "$pkgdir"/usr/{bin,share}
}

package_akonadi-qt4() {
  depends=(libakonadi-qt4 boost-libs mariadb)
  optdepends=('postgresql: PostgreSQL backend')
  conflicts=(akonadi)
  replaces=('akonadi<15')

  cd build
  make DESTDIR="$pkgdir" install

# provided by libakonadi-qt4
  rm -r "$pkgdir"/usr/{lib,include}
}
