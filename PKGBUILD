# Maintainer : Solomon Choina <shlomochoina@gmail.com>
pkgbase=transmission-cmake
pkgname=(transmission-cmake-cli transmission-cmake-gtk transmission-cmake-qt libtransmission)
pkgver=3.00
pkgrel=1
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="http://www.transmissionbt.com/"
license=(MIT)
options=(!buildflags)
makedepends=(cmake git gtk3 intltool curl qt5-base libevent systemd qt5-tools dht libutp libnatpmp)
source=("git+https://github.com/transmission/transmission#tag=$pkgver"
        transmission-cmake-cli.sysusers
        transmission-cmake-cli.tmpfiles)
sha256sums=('SKIP'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

prepare() {
  cd transmission
  sed -i '/^Icon=/ s/$/-qt/' qt/transmission-qt.desktop
  git submodule update --init --recursive
  cd ..
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build
  
  cmake ../transmission -DCMAKE_INSTALL_PREFIX="/usr" -DLIB_INSTALL_DIR='/usr/lib' -DCMAKE_INSTAL_LIBDIR="/usr/lib" -DINSTALL_LIB=ON -DENABLE_UTP=ON  -DENABLE_QT=ON -DENABLE_CLI=ON -DENABLE_DAEMON=ON  -DCMAKE_BUILD_TYPE=Release -DUSE_SYSTEM_UTP=ON
  make
}

package_transmission-cmake-cli() {
  pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)'
  depends=(curl libevent systemd libnatpmp)
  conflicts=(transmission-cli)
  provides=(transmission-cli)

  cd $srcdir/build

  for dir in daemon cli utils; do
    make -C "$dir" DESTDIR="$pkgdir" install
  done

  install -Dm644 $srcdir/transmission/daemon/transmission-daemon.service \
    "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -Dm644 $srcdir/transmission/COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

  install -Dm644 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/transmission.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}

package_transmission-cmake-gtk() {
  pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI)"
  depends=(curl libevent libnatpmp gtk3 desktop-file-utils hicolor-icon-theme)
  optdepends=('notification-daemon: Desktop notification support'
  	      'transmission-cmake-cli: daemon and web support')
  provides=(transmission-gtk)
  conflicts=(transmission-gtk)

  cd build

  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -Dm644 $srcdir/transmission/COPYING "$pkgdir/usr/share/licenses/transmission-cmake-gtk/COPYING"
}

package_transmission-cmake-qt() {
  pkgdesc="Fast, easy, and free BitTorrent client (Qt GUI)"
  depends=(curl qt5-base libevent libnatpmp)
  optdepends=('transmission-cmake-cli: daemon and web support')
  provides=(transmission-qt)
  conflicts=(transmission-qt)
  cd build

  make -C qt DESTDIR="$pkgdir" install

  install -Dm644 -t "$pkgdir/usr/share/transmission-qt/translations" qt/*.qm

  install -Dm644 $srcdir/transmission/COPYING "$pkgdir/usr/share/licenses/transmission-cmake-qt/COPYING"
  install -Dm644 $srcdir/transmission/qt/icons/transmission.png "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  install -Dm644 $srcdir/transmission/qt/transmission-qt.desktop "$pkgdir/usr/share/applications/transmission-qt.desktop"
}

package_libtransmission(){
  pkgdesc="Fast, easy, and free BitTorrent client (library)"
  depends=(openssl libnatpmp curl libevent miniupnpc dht libutp libb64)

  cd build
  make -C libtransmission DESTDIR="$pkgdir" install
  install -Dm644 $srcdir/transmission/COPYING "$pkgdir/usr/share/licenses/libtransmission/COPYING"

}
