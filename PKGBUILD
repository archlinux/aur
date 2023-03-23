# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Upstream Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=jami-qt-wtf
pkgver=20230207
pkgrel=1
pkgdesc="Free and universal communication platform which preserves the users’ privacy and freedoms (Qt client)"
arch=(x86_64)
url="https://jami.net"
license=(GPL3)
groups=(jami)
depends=(jami-daemon glib2 gdk-pixbuf2 libnm libnotify qrencode
         qt6-declarative qt6-multimedia qt6-svg qt6-5compat qt6-webengine
         qt6-webchannel)
makedepends=(git cmake python qt6-networkauth qt6-tools)
provides=(jami-qt)
replaces=(jami-gnome jami-libclient)
conflicts=(jami-gnome jami-libclient jami-qt)
_commit=6498dadd68689d75baae3126e6b164791da5ee75
source=(git+https://git.jami.net/savoirfairelinux/jami-client-qt.git#commit=${_commit})
sha256sums=(SKIP)

pkgver() {
  cd jami-client-qt
  TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD
}

prepare() {
  cd jami-client-qt
  git submodule update --init --recursive
}

build() {
  cmake -B build -S jami-client-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_LIBWRAP=ON \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
