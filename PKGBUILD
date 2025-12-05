# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=trojita-git
pkgver=0.7.r796.gc10f2990
pkgrel=1
pkgdesc="A fast QT IMAP e-mail client"
arch=(i686 x86_64)
url="http://trojita.flaska.net"
license=('GPL')
depends=('qt5-webkit' 'qtkeychain' 'qt5-tools' 'qt5-svg' 'mimetic'
         'qgpgme-qt5' 'desktop-file-utils' 'sonnet5' 'ragel')
conflicts=('trojita')
provides=('trojita')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'boost')

source=('git+https://invent.kde.org/pim/trojita.git'
        'trojita-qgpgme5.patch')
md5sums=('SKIP'
         '18c5e0061400e3180969b7edf2128a6e')

pkgver() {
  cd "$srcdir/trojita"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/trojita"
  patch -Np1 < "${srcdir}"/trojita-qgpgme5.patch
}

build() {
  cd "$srcdir/trojita"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_TESTS=OFF \
        -DWITH_QT5=ON \
        -DWITH_QTKEYCHAIN_PLUGIN=ON \
        -DWITH_GPGMEPP=ON \
        -DWITH_CRYPTO_MESSAGES=ON \
        -DCMAKE_PREFIX_PATH=/usr/lib/cmake/QGpgmeQt5 \
        .
  make
}

package() {
  cd "$srcdir/trojita"
  make install DESTDIR="$pkgdir"
}
