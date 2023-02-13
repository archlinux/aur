# Maintainer: fredbezies <fredbezies@gmail.com>
# Based on the work of Lari Tikkanen <lartza@wippies.com>

pkgname=transmission-gtk-git
_pkgname=transmission
pkgver=4.0.0.r31.ga2faaabe6
pkgrel=1
epoch=2
pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI)(Git version from github repository)"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=(
	gtkmm-4.0
	libb64
	libdeflate
	libnatpmp
	miniupnpc
)
makedepends=(
	cmake
	curl
	dht
	glibmm-2.68
	gtk4
	intltool
	libevent
	ninja
	npm
	systemd
)
optdepends=('notification-daemon: Desktop notification support'
  	    'transmission-cli: daemon and web support')
provides=(transmission-gtk)
conflicts=(transmission-gtk transmission-svn-gtk)
source=("git+https://github.com/transmission/transmission.git")
sha256sums=('SKIP')

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
  
  cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DENABLE_CLI=ON \
	  -DENABLE_DAEMON=ON \
	  -DENABLE_GTK=ON \
	  -DENABLE_MAC=OFF \
	  -DENABLE_QT=OFF \
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

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja gtk/install
  #make -C gtk DESTDIR="$pkgdir" install
  #make -C po DESTDIR="$pkgdir" install
  DESTDIR="$pkgdir" ninja po/install
  cd $srcdir/$_pkgname/
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
