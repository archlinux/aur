pkgname="paycoin-qt-git"
pkgver=0.3.0.2.r0.g63dbad1
pkgrel=1
pkgdesc='Paycoin is a Paycoin network-compatible, community-developed wallet client.'
arch=('any')
url='http://paycoin.com'
license=('MIT/X11')
depends=('qt4' 'miniupnpc' 'qrencode' 'boost-libs' 'openssl')
makedepends=('git' 'boost')
provides=('paycoin-qt')
conflicts=('paycoin-wallet' 'paycoin-qt')
source=('git://github.com/PaycoinFoundation/paycoin.git'
	'paycoin-qt.desktop')
md5sums=('SKIP'
         'f6f77ced97d4fba182ed01f33d49d895')

pkgver() {
	cd "$srcdir/paycoin"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/paycoin"
	qmake-qt4 "USE_UPNP=1" "USE_DBUS=1" "USE_QRCODE=1"
}

build() {
	# Build Qt Wallet
        cd "$srcdir/paycoin"
        make -j 4
}

package() {
        cd "$srcdir/paycoin"
        install -d "$pkgdir/opt/paycoin"
	install -d "$pkgdir"/usr/bin
	cp paycoin-qt "$pkgdir/opt/paycoin/paycoin-qt"
	ln -s /opt/paycoin/paycoin-qt "$pkgdir"/usr/bin/paycoin-qt
	
	chmod 755 "$pkgdir/opt/paycoin/paycoin-qt"

	cd ..
	# install desktop file
        install -d "$pkgdir"/usr/share/applications
        install -Dm644 paycoin-qt.desktop "$pkgdir"/usr/share/applications/paycoin-qt.desktop
}
