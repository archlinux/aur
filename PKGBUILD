# Contributor : Tom Gundersen <teg@jklm.no>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Maintainer : Thomas Weißschuh <thomas t-8ch de>

pkgbase=transmission4
_pkgbase=transmission
pkgname=(transmission4-cli transmission4-gtk transmission4-qt libtransmission4)
pkgver=4.0.1
_pkgver=$pkgver
pkgrel=1
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(GPL)
makedepends=(
	gtk4
	glibmm-2.68
	gtkmm-4.0
	intltool
	curl
	qt6-base
	qt6-svg
	libevent
	systemd
	qt6-tools
	dht
	libb64
	miniupnpc
	libdeflate
	libnatpmp
	cmake
	ninja
	npm
)
source=(https://github.com/transmission/transmission/releases/download/${_pkgver%+*}/transmission-${_pkgver}.tar.xz
        transmission-cli.sysusers
        transmission-cli.tmpfiles
)
sha256sums=('8fc5aef23638c983406f6a3ee9918369e4cdc84e3228bd2fb3d01dd55cdad900'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

prepare() {
  cd $_pkgbase-$_pkgver
}

build() {
  cd $_pkgbase-$_pkgver

  cmake -G Ninja -S . -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DRUN_CLANG_TIDY=OFF  \
          -DUSE_SYSTEM_UTP=OFF \
          -DENABLE_CLI=ON \
          -DENABLE_GTK=ON \
          -DUSE_GTK_VERSION=4 \
          -DENABLE_QT=ON \
          -DUSE_QT_VERSION=6 \
          -DREBUILD_WEB=ON
  cmake --build build --config Release
}

check() {
  cd $_pkgbase-$_pkgver

  cd build
  ctest --output-on-failure -j $(nproc)
}

_install_component() {
  (cd $srcdir/$_pkgbase-$_pkgver/build; DESTDIR="$pkgdir" ninja $1/install)
}

package_transmission4-cli() {
  pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client) (version 4)'
  depends=(curl libevent systemd libb64 miniupnpc libnatpmp libdeflate)
  provides=(transmission-cli)
  conflicts=(transmission-cli)

  cd $_pkgbase-$_pkgver

  for dir in daemon cli web utils; do
    _install_component $dir
  done

  install -Dm644 daemon/transmission-daemon.service \
    "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

  install -Dm644 "$srcdir/transmission-cli.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/transmission.conf"
  install -Dm644 "$srcdir/transmission-cli.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
  rm -rf "$pkgdir/usr/local"
}

package_transmission4-gtk() {
  pkgdesc='Fast, easy, and free BitTorrent client (GTK+ GUI) (version 4)'
  depends=(curl libevent gtk4 hicolor-icon-theme libb64 miniupnpc libnatpmp libdeflate gtkmm-4.0)
  optdepends=('libnotify: Desktop notification support'
              'transmission-cli: daemon and web support')
  provides=(transmission-gtk)
  conflicts=(transmission-gtk)

  cd $_pkgbase-$_pkgver

  _install_component gtk
  _install_component po
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-gtk/COPYING"
}

package_transmission4-qt() {
  pkgdesc='Fast, easy, and free BitTorrent client (Qt GUI) (version 4)'
  depends=(curl qt6-base qt6-svg libevent libb64 miniupnpc libnatpmp libdeflate)
  optdepends=('transmission-cli: daemon and web support')
  provides=(transmission-qt)
  conflicts=(transmission-qt)

  cd $_pkgbase-$_pkgver

  _install_component qt

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-qt/COPYING"
  # install -Dm644 qt/icons/transmission.png \
    # "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  # install -Dm644 qt/transmission-qt.desktop \
    # "$pkgdir/usr/share/applications/transmission-qt.desktop"
}

package_libtransmission4() {
  pkgdesc='Fast, easy, and free BitTorrent client (shared library) (version 4)'
  provides=(libtransmission)
  conflicts=(libtransmission)

  cd $_pkgbase-$_pkgver
  install -Dm644 build/libtransmission/libtransmission.a -t "$pkgdir"/usr/lib
  install -Dm644 libtransmission/*.h -t "$pkgdir"/usr/include/transmission
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/libtransmission/COPYING"
}
