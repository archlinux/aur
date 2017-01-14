# Maintainer: fredbezies <fredbezies@gmail.com>
# Based on the work of Lari Tikkanen <lartza@wippies.com>

pkgname=transmission-gtk-git
_pkgname=transmission
pkgver=2.92.r112.ga23cd29f0
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI)(Git version from github repository)"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'libevent' 'gtk3' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'git')
optdepends=('notification-daemon: Desktop notification support'
  	    'transmission-cli: daemon and web support')
provides=(transmission-gtk)
conflicts=(transmission-gtk transmission-svn-gtk)
source=("git+https://github.com/transmission/transmission.git")
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $srcdir/$_pkgname
	git submodule update --init
}

build() {
  cd $srcdir/$_pkgname
  # working around this bug : https://github.com/transmission/transmission/issues/66
  rm m4/glib-gettext.m4
  # cmake will be used when I get it to work :)
  ./autogen.sh --prefix=/usr --disable-cli --disable-daemon
  make
}

package() {
  cd $srcdir/$_pkgname
  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
