# Maintainer: William Grieshaber <me@zee.li>
# Contributor: portals <portals@gmail.com>

pkgbase=namecoin
pkgname=namecoin-qt
pkgver=0.20.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://namecoin.info"
depends=(boost-libs qt5-base miniupnpc desktop-file-utils)
makedepends=('boost' 'qt5-base' 'miniupnpc' 'desktop-file-utils' 'qt5-tools')
license=('MIT')
conflicts=('namecoin-qt-git')
provides=('namecoin-qt-git')
source=(https://github.com/namecoin/namecoin-core/archive/nc$pkgver.tar.gz
	'namecoin-qt.desktop')
sha256sums=('6e4cd88d85c1a0893e3917e8312ae790d4aaa5d8ad6f735af086849425210df8'
            'd58f684fb11d8879c5f9fe7ab6c70f1a522d4f76a885e39a2e15157c1d30522e')

build() {
  cd "$srcdir/$pkgbase-core-nc$pkgver/"
  ./autogen.sh
  ./configure \
	--build=$CBUILD \
	--host=$CHOST \
	--prefix=/usr \
	--mandir=/usr/share/man \
	--with-incompatible-bdb \
	--with-gui=qt5 \
	--with-utils \
	--disable-ccache \
	--disable-static \
	--enable-hardening
  make
}

check() {
	make check
}
package_namecoin-qt() {
	install=namecoin-qt.install
	cd "$srcdir/$pkgbase-core-nc$pkgver/"
	make install DESTDIR="$pkgdir"

	install -Dm755 namecoin-qt "$pkgdir"/usr/bin/namecoin-qt
	install -Dm644 "$srcdir"/namecoin-qt.desktop \
	  "$pkgdir"/usr/share/applications/namecoin-qt.desktop
}

