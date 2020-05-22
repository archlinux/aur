# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgbase=transmission
_pkgname=transmission-cli
pkgname=transmission-cli-git
pkgver=3.00.r54.gd43aeb6a5
pkgrel=1
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(MIT)
pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)'
depends=(curl libevent libsystemd miniupnpc)
makedepends=(cmake git)
conflicts=(transmission-cli)
replaces=(transmission-cli)
provides=(transmission-cli)
source=(git+https://github.com/transmission/transmission.git
        transmission-cli.sysusers
        transmission-cli.tmpfiles)
sha256sums=('SKIP'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgbase
  git submodule update --init
}

build() {
  cd $_pkgbase

  mkdir -p build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_CLI=ON \
    -DENABLE_GTK=OFF \
    -DENABLE_QT=OFF \
    ..
  make
}

package() {
  cd $_pkgbase/build
  make DESTDIR="$pkgdir" install

  install -Dm644 ../daemon/transmission-daemon.service \
    "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

  install -Dm644 "$srcdir/$_pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/transmission.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}
