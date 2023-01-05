# Contributor : Tom Gundersen <teg@jklm.no>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Maintainer : Thomas Weißschuh <thomas t-8ch de>

pkgbase=transmission4
_pkgbase=transmission
pkgname=(transmission4-cli transmission4-gtk transmission4-qt libtransmission4)
pkgver=4.00beta.3
_pkgver=4.0.0-beta.3+r634b1e8fc1
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
	qt5-base
	libevent
	systemd
	qt5-tools
	dht
	libb64
	miniupnpc
	libdeflate
	libnatpmp
	cmake
	ninja
	yarn
)
source=(https://github.com/transmission/transmission/releases/download/${_pkgver%+*}/transmission-${_pkgver}.tar.xz
        transmission-cli.sysusers
        transmission-cli.tmpfiles
        web-outoftree.patch # https://github.com/transmission/transmission/issues/4088
)
sha256sums=('c54b1f7962268995c829a97df801161853582e84eeb608da644258cf0055d5e3'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451'
            'a919f06f2dd51d197ea4c15a3b2c350f8202d62eb34efc219e5ed319ce79513f')

prepare() {
  cd $_pkgbase-$_pkgver
pwd

  patch -p1 < "$srcdir"/web-outoftree.patch
}

build() {
  cd $_pkgbase-$_pkgver

  cmake -G Ninja -S . -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DRUN_CLANG_TIDY=OFF  \
	  -DUSE_SYSTEM_UTP=OFF \
	  -DENABLE_CLI=ON \
	  -DENABLE_WEB=ON
  cmake --build build --config Release
}

check() {
  cd $_pkgbase-$_pkgver

  cd build
  ctest -j $(nproc)
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
  depends=(curl qt5-base libevent libb64 miniupnpc libnatpmp libdeflate)
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
