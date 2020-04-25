# Maintainer : Christian Muehlhaeuser <muesli@gmail.com>

pkgname=(transmission-qt-git)
pkgver=3.00
pkgrel=1
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(MIT)
pkgdesc='Fast, easy, and free BitTorrent client (Qt GUI)'
depends=(curl qt5-base libevent)
optdepends=('transmission-cli: daemon and web support')
makedepends=(gtk3 intltool curl qt5-base libevent systemd qt5-tools git cmake)
source=(git+https://github.com/transmission/transmission.git
        transmission-cli.sysusers
        transmission-cli.tmpfiles)
conflicts=('transmission-qt')
provides=('transmission-qt')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $srcdir/transmission
  git submodule update --init

  sed -i '/^Icon=/ s/$/-qt/' qt/transmission-qt.desktop
}

build() {
  cd $srcdir/transmission

  mkdir -p build
  cd build

  cmake ../ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  cd qt
  make
}

package() {
  cd $srcdir/transmission/build/qt

  make DESTDIR="$pkgdir/" install

  cd ../..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-qt/COPYING"
  install -Dm644 qt/icons/transmission.png \
    "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  install -Dm644 qt/transmission-qt.desktop \
    "$pkgdir/usr/share/applications/transmission-qt.desktop"
}
