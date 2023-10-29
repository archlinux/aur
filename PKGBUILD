# Maintainer : Daniel Kirchner <daniel@ekpyron.org>
# Contributor : Christian Muehlhaeuser <muesli@gmail.com>

pkgname=(transmission-qt-ssl-git)
pkgver=3.00
pkgrel=1
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(MIT)
pkgdesc='Fast, easy, and free BitTorrent client (Qt GUI + SSL remote session patch)'
depends=(curl qt5-base libevent)
optdepends=('transmission-cli: daemon and web support')
makedepends=(gtk3 intltool curl qt5-base libevent systemd qt5-tools git cmake)
source=(git+https://github.com/transmission/transmission.git
        transmission-qt-ssl.patch)
conflicts=('transmission-qt' 'transmission-qt-git')
provides=('transmission-qt')
sha256sums=('SKIP'
            'd0f2b5668fec0991101b29245bcb47f82ca26b22abd81bf16a48f7825f65271a')

prepare() {
  cd $srcdir/transmission
  git submodule update --init

  sed -i '/^Icon=/ s/$/-qt/' qt/transmission-qt.desktop
  git apply $srcdir/transmission-qt-ssl.patch
}

build() {
  cd $srcdir/transmission

  mkdir -p build
  cd build

  cmake ../ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_CXX_FLAGS=-Wno-deprecated-declarations

  cd qt
  make
}

package() {
  cd $srcdir/transmission/build/qt

  make DESTDIR="$pkgdir/" install

  cd ../..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-qt/COPYING"
  install -Dm644 icon.png \
    "$pkgdir/usr/share/pixmaps/transmission-qt.png"
}
