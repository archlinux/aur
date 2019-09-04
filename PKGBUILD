# Maintainer : Thomas Laroche <tho.laroche@gmail.com>
# Contributor : Tom Gundersen <teg@jklm.no>
# Contributor : Ionut Biru <ibiru@archlinux.org>

pkgbase=transmission-sequential
pkgname=(transmission-sequential-cli transmission-sequential-gtk transmission-sequential-qt)
pkgver=2.94
pkgrel=2
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="http://www.transmissionbt.com/"
license=(MIT)
makedepends=(gtk3 intltool curl qt5-base libevent systemd qt5-tools)
provides=(transmission-cli)
conflicts=(transmission-cli)
source=("https://github.com/Mikayex/transmission/archive/${pkgver}-seq.tar.gz"
        transmission-2.90-libsystemd.patch
        transmission-sequential-cli.sysusers
        transmission-sequential-cli.tmpfiles)
sha256sums=('220ba1b500d13c36ed1e55e90bb2c3d6d4babddcae3b7df08a374617af1b5670'
            '9f8f4bb532e0e46776dbd90e75557364f495ec95896ee35900ea222d69bda411'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

prepare() {
  cd transmission-$pkgver-seq
  patch -p1 -i "$srcdir/transmission-2.90-libsystemd.patch"

  rm -f m4/glib-gettext.m4
  sed -i '/^Icon=/ s/$/-qt/' qt/transmission-qt.desktop
}

build() {
  cd transmission-$pkgver-seq
  ./autogen.sh --prefix=/usr
  #./autogen.sh --prefix=/usr --without-gtk
  make

  cd qt
  qmake qtr.pro DEFINES+=TRANSLATIONS_DIR=\\\\\\\"/usr/share/transmission-qt/translations\\\\\\\"
  make
  lrelease translations/*.ts
}

package_transmission-sequential-cli() {
  pkgdesc="Fast, easy, and free BitTorrent client (CLI tools, daemon and web client) (+sequential patch)"
  depends=(curl libevent systemd)
  provides=(transmission-cli)
  conflicts=(transmission-cli)

  cd transmission-$pkgver-seq

  for dir in daemon cli web utils
  do
      make -C "$dir" DESTDIR="$pkgdir" install
  done

  install -Dm644 daemon/transmission-daemon.service "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-sequential-cli/COPYING"
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/transmission.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}

package_transmission-sequential-gtk() {
  pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI) (+sequential patch)"
  depends=(curl libevent gtk3 desktop-file-utils hicolor-icon-theme)
  optdepends=('notification-daemon: Desktop notification support'
  	      'transmission-sequential-cli: daemon and web support')
  provides=(transmission-gtk)
  conflicts=(transmission-gtk)

  cd transmission-$pkgver-seq

  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-sequential-gtk/COPYING"
}

package_transmission-sequential-qt() {
  pkgdesc="Fast, easy, and free BitTorrent client (Qt GUI) (+sequential patch)"
  depends=(curl qt5-base libevent)
  optdepends=('transmission-sequential-cli: daemon and web support')
  provides=(transmission-qt)
  conflicts=(transmission-qt)

  cd transmission-$pkgver-seq

  make -C qt INSTALL_ROOT="$pkgdir"/usr install

  install -Dm644 -t "$pkgdir/usr/share/transmission-qt/translations" qt/translations/*.qm

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-sequential-qt/COPYING"
  install -Dm644 qt/icons/transmission.png "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  install -Dm644 qt/transmission-qt.desktop "$pkgdir/usr/share/applications/transmission-qt.desktop"
}
