# Maintainer: Austin Beatty <doorknob60 at gmail dot com>
pkgname=lmc
pkgver=1.2.35
pkgrel=2
pkgdesc="LAN Messenger is a p2p chat application for intranet communication and does not require a server. A variety of handy features are supported including notifications, personal and group messaging with encryption, file transfer and message logging."
arch=('i686' 'x86_64')
url="http://lanmsngr.sourceforge.net/"
license=('GPL3')
groups=()
depends=('qtwebkit')
makedepends=('gtk-update-icon-cache')
install="$pkgname.install"
source=("$pkgname-$pkgver-src.zip::http://sourceforge.net/projects/lanmsngr/files/$pkgver/$pkgname-$pkgver-src.zip/download" "qtlocalpeerfix.diff")
noextract=()
md5sums=('35cc32438fe2c936e8453f8c94e21a24'
         'fec7f47ae7f45ec549f2b8f83f53d93c')


prepare() {
	cd "$srcdir/$pkgname/src"
	chmod 755 ./scripts/buildx11
	chmod 755 ./scripts/whitelist
	chmod 755 ./scripts/lan-messenger.sh
	cd "$srcdir/lmcapp/src"
	patch < "$srcdir/qtlocalpeerfix.diff"

}

build() {
	cd "$srcdir/lmcapp/src"
	qmake-qt4
	make
	cd "$srcdir/lmc/src"
	qmake-qt4
	make
}

package() {
	cd "$srcdir/$pkgname/src"
	./scripts/buildx11 "$srcdir/$pkgname/release"
	
	cp ../release/liblmcapp.so.2 "$srcdir/$pkgname/setup/x11/package"/usr/lib/lmc/liblmcapp.so.2
	cp ../release/lmc.rcc "$srcdir/$pkgname/setup/x11/package"/usr/lib/lmc/lmc.rcc
	cp ../release/lan-messenger "$srcdir/$pkgname/setup/x11/package"/usr/lib/lmc/lan-messenger
	cp ../release/COPYING "$srcdir/$pkgname/setup/x11/package"/usr/lib/lmc/COPYING
	cp -r ../release/lang "$srcdir/$pkgname/setup/x11/package"/usr/lib/lmc
	cp -r ../release/sounds "$srcdir/$pkgname/setup/x11/package"/usr/lib/lmc
	cp -r ../release/themes "$srcdir/$pkgname/setup/x11/package"/usr/lib/lmc
	rm -r "$srcdir/$pkgname/setup/x11/package/DEBIAN"
	
	cp -r "$srcdir/$pkgname/setup/x11/package"/* "$pkgdir"
	rm "$pkgdir/usr/bin/lmc"
	chmod 755 "$pkgdir/usr/lib/lmc/lmc.sh"
	echo "#/usr/bin/env/bash" > "$pkgdir/usr/bin/lmc"
	echo '/usr/lib/lmc/lmc.sh "$@"' >> "$pkgdir/usr/bin/lmc"
	chmod 755 "$pkgdir/usr/bin/lmc"
}
