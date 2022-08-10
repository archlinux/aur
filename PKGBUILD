# Maintainer: fredbezies <fredbezies@gmail.com>
# Based on the work of Lari Tikkanen <lartza@wippies.com>

pkgname=transmission-gtk-git
_pkgname=transmission
pkgver=3.00.r1285.ga700259cc
pkgrel=1
epoch=2
pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI)(Git version from github repository)"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('gtkmm3' 'libevent' 'libappindicator-gtk3' 'libnatpmp' 'libb64' 'miniupnpc')
makedepends=('intltool' 'git' 'cmake' 'gtkmm3')
optdepends=('notification-daemon: Desktop notification support'
  	    'transmission-cli: daemon and web support')
provides=(transmission-gtk)
conflicts=(transmission-gtk transmission-svn-gtk)
source=("git+https://github.com/transmission/transmission.git")
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $srcdir/$_pkgname
	git submodule update --init
}

build() {
  cd $srcdir/$_pkgname
  # cmake part added thanks to glitsj16.
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  cd $srcdir/$_pkgname/
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
