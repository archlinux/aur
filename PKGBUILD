# Maintainer : Thomas Laroche <tho.laroche@gmail.com>
# Contributor : Tom Gundersen <teg@jklm.no>
# Contributor : Ionut Biru <ibiru@archlinux.org>

pkgbase=transmission-sequential
pkgname=('transmission-sequential-cli' 'transmission-sequential-gtk' 'transmission-sequential-qt')
pkgver=2.92
pkgrel=1
svnrev=14714 #The SVN revision corresponding to the tag ${pkgver}
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'libevent' 'systemd')
makedepends=('gtk3' 'intltool' 'curl' 'qt5-base' 'libevent')
provides=('transmission-cli')
conflicts=('transmission-cli')
install=transmission-cli.install
source=("https://github.com/Mikayex/transmission/archive/${pkgver}-seq.tar.gz")
md5sums=('432fa500829c7890a9278966dd65cb2a')

_inarray() {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

prepare() {
  cd transmission-$pkgver-seq
  echo ${svnrev} > REVISION
}

build() {
  cd transmission-$pkgver-seq

#Don't build if not needed since long to build
  if _inarray 'transmission-sequential-gtk' "${pkgname[@]}"; then
    ./autogen.sh --prefix=/usr
  else
    ./autogen.sh --prefix=/usr --without-gtk
  fi
  make

#Don't build if not needed since long to build
  if _inarray 'transmission-sequential-qt' "${pkgname[@]}"; then
    pushd qt
    qmake qtr.pro
    make
  fi
}

package_transmission-sequential-cli() {
  pkgdesc="Fast, easy, and free BitTorrent client (CLI tools, daemon and web client) (+sequential patch)"
  depends=('curl' 'libevent' 'systemd')
  provides=('transmission-cli')
  conflicts=('transmission-cli')
  install=transmission-cli.install

  cd transmission-$pkgver-seq

  for dir in daemon cli web utils
  do
      make -C "$dir" DESTDIR="$pkgdir" install
  done

  install -D -m644 daemon/transmission-daemon.service "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-sequential-cli/COPYING"
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
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-sequential-gtk/COPYING"
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

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-sequential-qt/COPYING"
  install -D -m644 qt/icons/transmission.png "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  install -D -m644 qt/transmission-qt.desktop "$pkgdir/usr/share/applications/transmission-qt.desktop"
}
