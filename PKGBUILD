# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Majki <majki@majki.hu>
pkgname=tsclient2-svn
pkgver=r127
pkgrel=1
pkgdesc="Terminal Server Client [tsclient] is a GTK2 frontend for rdesktop and other remote desktop tools."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tsclient"
license=('GPL')
depends=('rdesktop' 'gnome-desktop2' 'networkmanager' 'libgnomeui' 'desktop-file-utils')
makedepends=('perlxml' 'sharutils' 'subversion' 'gnome-common')
conflicts=('tsclient')
provides=('tsclient2' 'tsclient')
replaces=('tsclient2')
install=${pkgname}.install
source=("$pkgname::svn://svn.code.sf.net/p/tsclient/code/branches/tsclient-unstable")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $pkgname
  sed -i '/Exec/s/.*/Exec=tsclient/' data/tsclient.desktop.in
  sed -i '/notify_notification_new/s/, NULL//' src/plugins/default/tsc-dmx-connection.c
  sed -i '/notify_notification_new/s/, NULL//' src/plugins/default/tsc-rdp-connection.c
  sed -i '/notify_notification_new/s/, NULL//' src/plugins/default/tsc-vnc-connection.c
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
