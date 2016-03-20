# Maintainer : Thomas Laroche <tho.laroche@gmail.com>
# Contributor : Tom Gundersen <teg@jklm.no>
# Contributor : Ionut Biru <ibiru@archlinux.org>

pkgbase=transmission-sequential
pkgname=('transmission-sequential-cli' 'transmission-sequential-gtk' 'transmission-sequential-qt')
pkgver=2.92
pkgrel=2
svnrev=14714 #The SVN revision corresponding to the tag ${pkgver}
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'libevent' 'systemd')
makedepends=('gtk3' 'intltool' 'curl' 'qt5-base' 'libevent' 'systemd')
provides=('transmission-cli')
conflicts=('transmission-cli')
install=transmission-cli.install
source=("https://github.com/Mikayex/transmission/archive/${pkgver}-seq.tar.gz" transmission-2.90-libsystemd.patch)
md5sums=('432fa500829c7890a9278966dd65cb2a'
         'bcb54fdb9fec00992960d9bd3b449d4d')

BUILD_GTK=true
BUILD_QT=true

if [ "$BUILD_GTK" = false ] && [ "$BUILD_QT" = false ]
then
  pkgname=('transmission-sequential-cli')
elif [ "$BUILD_GTK" = true ] && [ "$BUILD_QT" = false ]
then
  pkgname=('transmission-sequential-cli' 'transmission-sequential-gtk')
elif [ "$BUILD_GTK" = false ] && [ "$BUILD_QT" = true ]
then
  pkgname=('transmission-sequential-cli' 'transmission-sequential-qt')
fi

prepare() {
  cd transmission-$pkgver-seq
  echo ${svnrev} > REVISION
  patch -p1 -i "$srcdir/transmission-2.90-libsystemd.patch"
}

build() {
  cd transmission-$pkgver-seq
  if [ "$BUILD_GTK" = true ] ; then
    ./autogen.sh --prefix=/usr
  else
    ./autogen.sh --prefix=/usr --without-gtk
  fi
  make

  if [ "$BUILD_QT" = true ] ; then
    cd qt
    qmake qtr.pro
    make
  fi
}

check() {
  make check
}

package_transmission-sequential-cli() {
  pkgdesc="Fast, easy, and free BitTorrent client (CLI tools, daemon and web client) (+sequential patch)"
  depends=('curl' 'libevent' 'libsystemd')
  provides=('transmission-cli')
  conflicts=('transmission-cli')
  install=transmission-cli.install

  cd transmission-$pkgver-seq

  for dir in daemon cli web utils
  do
      make -C "$dir" DESTDIR="$pkgdir" install
  done

  install -Dm644 daemon/transmission-daemon.service "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-sequential-cli/COPYING"
}

package_transmission-sequential-gtk() {
  pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI) (+sequential patch)"
  depends=('curl' 'libevent' 'gtk3' 'desktop-file-utils' 'hicolor-icon-theme' 'desktop-file-utils')
  optdepends=('notification-daemon: Desktop notification support'
  	      'transmission-sequential-cli: daemon and web support')
  provides=('transmission-gtk')
  conflicts=('transmission-gtk')
  install=transmission-gtk.install

  cd transmission-$pkgver-seq

  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-sequential-gtk/COPYING"
}

package_transmission-sequential-qt() {
  pkgdesc="Fast, easy, and free BitTorrent client (Qt GUI) (+sequential patch)"
  depends=('curl' 'qt5-base' 'libevent' 'libxkbcommon-x11' 'desktop-file-utils')
  optdepends=('transmission-sequential-cli: daemon and web support')
  provides=('transmission-qt')
  conflicts=('transmission-qt')
  install=transmission-qt.install

  cd transmission-$pkgver-seq

  make -C qt INSTALL_ROOT="$pkgdir"/usr install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-sequential-qt/COPYING"
  install -Dm644 qt/icons/transmission.png "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  install -Dm644 qt/transmission-qt.desktop "$pkgdir/usr/share/applications/transmission-qt.desktop"
}
