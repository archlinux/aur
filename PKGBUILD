pkgname="paycoin-qt-git"
pkgver=r164.acd3748
pkgrel=2
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

	# Git, no tags available
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/paycoin"
	qmake-qt4 "USE_UPNP=1" "USE_DBUS=1" "USE_QRCODE=1"
}

build() {
	# Build Qt Wallet
        cd "$srcdir/paycoin"
        make
}

package() {
        cd "$srcdir/paycoin"
        install -d "$pkgdir/opt/paycoin"
	install -d "$pkgdir"/usr/bin
	cp paycoin-qt "$pkgdir/opt/paycoin/paycoin-qt"
	ln -s "$pkgdir"/opt/paycoin/paycoin-qt "$pkgdir"/usr/bin/paycoin-qt
	
	chmod 755 "$pkgdir/opt/paycoin/paycoin-qt"
	chmod 755 "$pkgdir"/usr/bin/paycoin-qt

	cd ..
	# install desktop file
        install -d "$pkgdir"/usr/share/applications
        install -Dm644 paycoin-qt.desktop "$pkgdir"/usr/share/applications/paycoin-qt.desktop
}
