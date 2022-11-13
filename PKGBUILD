# Maintainer : Hexhu <i at hexhu.net>
# Contributor : Tom Gundersen <teg at jklm.no>
# Contributor : Ionut Biru <ibiru at archlinux.org>

pkgbase=transmission-noxunlei
pkgname=(transmission-noxunlei-cli transmission-noxunlei-gtk transmission-noxunlei-qt)
pkgdesc='patched version of transmission that bans Xunlei (a well-known leech-only client)'
pkgver=3.00
pkgrel=5
arch=(x86_64)
url="https://www.transmissionbt.com/"
license=(MIT)
makedepends=(gtk3 intltool curl qt5-base libevent systemd qt5-tools libappindicator-gtk3)
source=(https://github.com/transmission/transmission-releases/raw/master/transmission-${pkgver}.tar.xz
        transmission-3.00-openssl-3.patch
        ban-xunlei.patch
        ban-3-more-leech-only-clients.patch
        transmission-noxunlei-cli.sysusers
        transmission-noxunlei-cli.tmpfiles)
sha256sums=('9144652fe742f7f7dd6657716e378da60b751aaeda8bef8344b3eefc4db255f2'
            'a5e56b906724f007db0bdb9835fbf5088bb56a521ec2971aec0ea44578d5955b'
            'c1b21b0e2d54a0a041c602709f6f0c2dc3626e6aa04c049c1a76b2e3d0dcc89d'
            '90d6e7fcdc84fc14546d1060880f656e5f2e9490e094c42339b74a7973be779b'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

prepare() {
  ln -sf transmission-$pkgver $pkgbase-$pkgver
  cd $pkgbase-$pkgver

  # Fix compatibility with OpenSSL 3.0 (patch from Gentoo)
  # https://github.com/transmission/transmission/issues/1777
  patch -Np1 -i ../transmission-3.00-openssl-3.patch

  # loqs's patch, fixes building with autoconf 2.70+  https://bugs.archlinux.org/task/70877
  sed -i 's/\[IT_PROG_INTLTOOL(\[/[\nIT_PROG_INTLTOOL(\[/' configure.ac

  # Ban Xunlei (Thunder) downloader as described in blog.zscself.com/posts/66b00f02/
  patch -Np1 -i "$srcdir/ban-xunlei.patch"
  # https://github.com/firedent/transmission/commit/f6b87adbd852911f72d977e967e7fee9f5944379
  patch -Np1 -i "$srcdir/ban-3-more-leech-only-clients.patch"

  rm -f m4/glib-gettext.m4
  autoreconf -fi

  sed -i '/^Icon=/ s/$/-qt/' qt/transmission-qt.desktop
}

build() {
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr
  make

  cd qt
  qmake qtr.pro \
    DEFINES+=TRANSLATIONS_DIR=\\\\\\\"/usr/share/transmission-qt/translations\\\\\\\"
  make
  lrelease translations/*.ts
}

package_transmission-noxunlei-cli() {
  pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client), patched to ban Xunlei (a well-known leecher client)'
  depends=(curl libevent systemd)
  conflicts=(transmission-cli)
  provides=(transmission-cli)

  cd $pkgbase-$pkgver

  for dir in daemon cli web utils; do
    make -C "$dir" DESTDIR="$pkgdir" install
  done

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
  depends=(curl libevent gtk3 desktop-file-utils hicolor-icon-theme libappindicator-gtk3)
  optdepends=('libnotify: Desktop notification support'
              'transmission-cli: daemon and web support')
  provides=(transmission-gtk)
  conflicts=(transmission-gtk)

  cd $pkgbase-$pkgver

  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-gtk/COPYING"
}

package_transmission-noxunlei-qt() {
  pkgdesc='Fast, easy, and free BitTorrent client (Qt GUI), patched to ban Xunlei (a well-known leecher client)'
  depends=(curl qt5-base libevent)
  optdepends=('transmission-cli: daemon and web support')
  provides=(transmission-qt)
  conflicts=(transmission-qt)

  cd $pkgbase-$pkgver

  make -C qt INSTALL_ROOT="$pkgdir"/usr install
  install -Dm644 -t "$pkgdir/usr/share/transmission-qt/translations" \
    qt/translations/*.qm

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-qt/COPYING"
  install -Dm644 qt/icons/transmission.png \
    "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  install -Dm644 qt/transmission-qt.desktop \
    "$pkgdir/usr/share/applications/transmission-qt.desktop"
}
