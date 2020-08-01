# Maintainer: Jordan Day (FryDay) < jordanday444 at gmail dot com>
# Contributor: metscoin <mets_coin@outlook.com>
# shellcheck disable=SC2034

pkgname=raven-qt
pkgver=4.2.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://ravencoin.org/"
license=('MIT')
pkgdesc="Ravencoin Core Cryptocurrency Wallet (QT)"
depends=('openssl-1.0' 'boost-libs' 'libevent' 'db4.8' 'qt5-base' 'protobuf')
optdepends=('miniupnpc: Automatic UPnP port mapping' 'qrencode: For generating QR codes within the GUI' 'zeromq: Send notifications via zeromq')
makedepends=(boost qt5-tools)
provides=('raven-qt' 'ravencoind' 'ravencoin-tx')
conflicts=(raven)
install=raven-qt.install
source=("${pkgname%-git}::git+http://github.com/RavenProject/Ravencoin.git#tag=v${pkgver}"
	"$pkgname.desktop"
	overviewpage.patch
	trafficgraphwidget.patch)
sha256sums=('SKIP'
	'e318e3c5a9fbdbcf5836f9ceee76f4a73acdcb47c535cb7beb1c19937b8540df'
	'40bc04ac7f6ab4549374d54a149c21ba5f20c87334e8b0158ab6c47f8286a2b2'
	'eca98cd942e177f5f1bc92b1196acb1996847e2bcb6bb008580d3b4e9384b2d7')
build() {
	cd "$srcdir/$pkgname" || exit
	find . -type f -iname "*.sh" -exec chmod +x {} \;
	export PKG_CONFIG_PATH="/usr/lib/openssl-1.0/pkgconfig"
	export CXXFLAGS+=" -I/usr/include/openssl-1.0"
	export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl"
	./autogen.sh
	./configure --prefix=/usr --with-pic --disable-shared --enable-cxx \
		--disable-bench --disable-tests
	patch $srcdir/$pkgname/src/qt/overviewpage.h $srcdir/overviewpage.patch
	patch $srcdir/$pkgname/src/qt/trafficgraphwidget.h $srcdir/trafficgraphwidget.patch
	make ${MAKEFLAGS}
}

package() {
	install -Dm644 raven-qt.desktop "$pkgdir"/usr/share/applications/raven.desktop
	cd "$srcdir/$pkgname" || exit
	install -Dm644 share/pixmaps/raven128.png "$pkgdir"/usr/share/pixmaps/raven128.png
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	make DESTDIR="${pkgdir}" install
}
