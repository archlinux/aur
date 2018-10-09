# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=pigeon-qt
pkgver=0.15.99.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://pigeoncoin.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=('openssl-1.0' 'boost-libs' 'libevent' 'db4.8' 'qt5-base' 'protobuf')
optdepends=('miniupnpc: Automatic UPnP port mapping' 'qrencode: For generating QR codes within the GUI' 'zeromq: Send notifications via zeromq')
makedepends=(boost qt5-tools)
conflicts=('pigeon' 'pigeond')
install=pigeon-qt.install
source=("${pkgname%-git}::git+http://github.com/Pigeoncoin/pigeoncoin.git#tag=v${pkgver}"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '331bd8fb38aae6d94a0e7494ff183f8d918eeb6d143ffcfa8ca61546338f265d')

build() {
  cd "$srcdir/$pkgname" || exit
  find . -type f -iname "*.sh" -exec chmod +x {} \;
	export PKG_CONFIG_PATH="/usr/lib/openssl-1.0/pkgconfig"
	export CXXFLAGS+=" -I/usr/include/openssl-1.0"
	export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl"
  ./autogen.sh
  ./configure --prefix=/usr --with-pic --disable-shared --enable-cxx \
		--disable-bench --disable-tests
	make ${MAKEFLAGS}
}


package() {
  install -Dm644 pigeon-qt.desktop "$pkgdir"/usr/share/applications/pigeon.desktop
  cd "$srcdir/$pkgname" || exit
  install -Dm644 share/pixmaps/pigeon128.png "$pkgdir"/usr/share/pixmaps/pigeon128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  make DESTDIR="${pkgdir}" install
}
