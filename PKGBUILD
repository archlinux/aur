# Maintainer : Hexhu <i at hexhu.net>
# Contributor : Tom Gundersen <teg at jklm.no>
# Contributor : Ionut Biru <ibiru at archlinux.org>
# Contributor : Thomas Weißschuh <thomas t-8ch de>
# Contributor : Florian Pritz <bluewind at xinu.at>

pkgbase=transmission-noxunlei
pkgname=(transmission-noxunlei-cli transmission-noxunlei-gtk transmission-noxunlei-qt libtransmission-noxunlei)
pkgver=4.0.4
pkgrel=1
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(GPL)
makedepends=(
	cmake
	curl
	dht
	glibmm-2.68
	gtk4
	gtkmm-4.0
	intltool
	libb64
	libdeflate
	libevent
	libnatpmp
	miniupnpc
	ninja
	npm
	qt6-base
	qt6-svg
	qt6-tools
	systemd
)
source=(https://github.com/transmission/transmission/releases/download/$pkgver/transmission-$pkgver.tar.xz
        ban-xunlei.patch
        transmission-noxunlei-cli.sysusers
        transmission-noxunlei-cli.tmpfiles)
sha256sums=('15f7b4318fdfbffb19aa8d9a6b0fd89348e6ef1e86baa21a0806ffd1893bd5a6'
            'f895bafecf6d0f19420a01cb0077a2466af08527670df95f4d70d7430e79d71e'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

prepare() {
  ln -sf transmission-$pkgver $pkgbase-$pkgver
  cd $pkgbase-$pkgver

  # Ban Xunlei (Thunder) downloader as described in blog.zscself.com/posts/66b00f02/ and 3 more leech-only clients
  # https://github.com/firedent/transmission-Block-Thunder/commit/f6b87adbd852911f72d977e967e7fee9f5944379
  # TODO: incorporate https://github.com/GrandArth/Risi-Pwsh-Profile/blob/master/Modules/TransmissionAntiXunlei/TransmissionAntiXunlei.psm1 as well
  patch -Np1 -i "$srcdir/ban-xunlei.patch"
}

build() {
  export CFLAGS+=" -ffat-lto-objects"
  cd $pkgbase-$pkgver

  cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DENABLE_CLI=ON \
	  -DENABLE_DAEMON=ON \
	  -DENABLE_GTK=ON \
	  -DENABLE_MAC=OFF \
	  -DENABLE_QT=ON \
	  -DREBUILD_WEB=ON \
	  -DENABLE_TESTS=ON \
	  -DENABLE_UTILS=ON \
	  -DENABLE_UTP=ON \
	  -DINSTALL_LIB=ON \
      -DUSE_SYSTEM_B64=ON \
      -DUSE_SYSTEM_DEFLATE=ON \
      -DUSE_SYSTEM_DHT=ON \
	  -DUSE_SYSTEM_EVENT2=ON \
      -DUSE_SYSTEM_MINIUPNPC=ON \
      -DUSE_SYSTEM_NATPMP=ON \
      -DUSE_SYSTEM_PSL=ON \
      -DUSE_SYSTEM_UTP=OFF \
	  -DWITH_CRYPTO=openssl \
	  -S . -B build

  cmake --build build --config Release
}

check() {
  cd $pkgbase-$pkgver

  cd build
  ctest --output-on-failure -j "$(nproc)"
}

_install_component() {
  (cd $srcdir/$pkgbase-$pkgver/build; DESTDIR="$pkgdir" ninja $1/install)
}

package_transmission-noxunlei-cli() {
  pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client), patched to ban Xunlei (a well-known leecher client)'
  depends=(curl libevent systemd libb64 miniupnpc libnatpmp libdeflate)
  conflicts=(transmission-cli)
  provides=(transmission-cli)

  cd $pkgbase-$pkgver

  for dir in daemon cli web utils; do
    _install_component $dir
  done

  install -d "$pkgdir"/usr/share/transmission
  cp -a build/web/public_html/ "$pkgdir"/usr/share/transmission

  install -Dm644 daemon/transmission-daemon.service \
    "$pkgdir/usr/lib/systemd/system/transmission.service"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

  install -Dm644 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/transmission.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}

package_transmission-noxunlei-gtk() {
  pkgdesc='Fast, easy, and free BitTorrent client (GTK+ GUI), patched to ban Xunlei (a well-known leecher client)'
  depends=(curl libevent gtk4 hicolor-icon-theme libb64 miniupnpc libnatpmp libdeflate gtkmm-4.0)
  optdepends=('libnotify: Desktop notification support'
              'transmission-cli: daemon and web support')
  provides=(transmission-gtk)
  conflicts=(transmission-gtk)

  cd $pkgbase-$pkgver

  _install_component gtk
  _install_component po

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-gtk/COPYING"
}

package_transmission-noxunlei-qt() {
  pkgdesc='Fast, easy, and free BitTorrent client (Qt GUI), patched to ban Xunlei (a well-known leecher client)'
  depends=(curl qt6-base qt6-svg libevent libb64 miniupnpc libnatpmp libdeflate)
  optdepends=('transmission-cli: daemon and web support')
  provides=(transmission-qt)
  conflicts=(transmission-qt)

  cd $pkgbase-$pkgver

  _install_component qt

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-qt/COPYING"
}

package_libtransmission-noxunlei() {
  pkgdesc='Fast, easy, and free BitTorrent client (shared library), patched to ban Xunlei (a well-known leecher client)'
  provides=(libtransmission)
  conflicts=(libtransmission)

  cd $pkgbase-$pkgver

  install -Dm644 build/libtransmission/libtransmission.a -t "$pkgdir"/usr/lib
  install -Dm644 libtransmission/*.h -t "$pkgdir"/usr/include/transmission
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/libtransmission/COPYING"
}
