# Maintainer: James <jfoh96@gmail.com>
# Fork: https://github.com/DeathKhan/transmission (branch transmission-client-gtk)
# Upstream: https://github.com/transmission/transmission

pkgname=transmission-client-gtk
pkgver=4.1.1.r3.gd175c88
pkgrel=1
pkgdesc='GTK client for an existing Transmission daemon (remote RPC; fork of transmission-gtk)'
arch=('x86_64')
url='https://github.com/DeathKhan/transmission/tree/transmission-client-gtk'
license=('GPL-2.0-or-later')
depends=(
  curl
  gtk4
  gtkmm-4.0
  hicolor-icon-theme
  libb64
  libdeflate
  libevent
  libnatpmp
  libsoup3
  miniupnpc
)
makedepends=(
  cmake
  git
  glibmm-2.68
  intltool
  ninja
)
optdepends=(
  'libnotify: desktop notifications'
  'transmission-cli: transmission-daemon and web UI for torrents managed remotely'
)
source=("git+https://github.com/DeathKhan/transmission.git#branch=transmission-client-gtk")
sha256sums=('SKIP')
options=('!lto') # upstream + fat LTO objects are fragile; keep build reliable

pkgver() {
  cd transmission
  printf '4.1.1.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd transmission
  git submodule update --init --recursive
}

build() {
  cd transmission

  export CFLAGS+=' -ffat-lto-objects'

  cmake -B build -G Ninja \
    -D CMAKE_BUILD_TYPE=RelWithDebInfo \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D USE_GTK_VERSION=4 \
    -D ENABLE_DEPRECATED=OFF \
    -D ENABLE_CLI=OFF \
    -D ENABLE_DAEMON=OFF \
    -D ENABLE_GTK=ON \
    -D ENABLE_MAC=OFF \
    -D ENABLE_QT=OFF \
    -D ENABLE_TESTS=OFF \
    -D ENABLE_UTILS=OFF \
    -D ENABLE_UTP=ON \
    -D INSTALL_DOC=OFF \
    -D INSTALL_LIB=ON \
    -D REBUILD_WEB=OFF \
    -D USE_SYSTEM_B64=ON \
    -D USE_SYSTEM_DEFLATE=ON \
    -D USE_SYSTEM_DHT=OFF \
    -D USE_SYSTEM_EVENT2=ON \
    -D USE_SYSTEM_MINIUPNPC=ON \
    -D USE_SYSTEM_NATPMP=ON \
    -D USE_SYSTEM_PSL=ON \
    -D USE_SYSTEM_UTP=OFF \
    -D WITH_CRYPTO=openssl

  cmake --build build --target transmission-client-gtk
}

package() {
  cd transmission/build

  DESTDIR="$pkgdir" ninja gtk/install

  install -Dm644 "$srcdir/transmission/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  install -Dm644 "$srcdir/transmission/gtk/transmission-gtk.1" \
    "$pkgdir/usr/share/man/man1/$pkgname.1"
}
