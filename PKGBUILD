#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='vertcoin-git'
_gitname='vertcoin'
pkgver=0.9.0.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.vertcoin.org/"
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'qrencode>=3.4.3' 'secp256k1-git')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'git')
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (includes 
both the qtclient and the headless daemon)"
provides=(vertcoin)
conflicts=(vertcoin)
source=("$_gitname::git+https://github.com/vertcoin/vertcoin"
		"vertcoin-git.desktop"
		)
md5sums=('SKIP'
			'6e3e6cd6803a6fde4fea761c71307b22'
			)

pkgver() {
	cd "$srcdir/$_gitname"
	# Use tag of the last commit, but removing the prefix
	#git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_gitname}"
	cd "$srcdir/$_gitname"

	# and make qt gui
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1
	make

	# make vertcoin daemon
	cd "$srcdir/$_gitname/src"
	make $MAKEFLAGS -f makefile.unix
}


package() {
	# install vertcoin-qt client
	install -D -m755 "$srcdir/$_gitname/vertcoin-qt" "$pkgdir/usr/bin/vertcoin-qt"

	# install vertcoin daemon
	install -D -m755 "$srcdir/$_gitname/src/vertcoind" "$pkgdir/usr/bin/vertcoind"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# install vertcoin-qt desktop entry
	install -D -m644 "$srcdir/$_gitname/share/pixmaps/vertcoin128.png" "$pkgdir/usr/share/pixmaps/vertcoin128.png"
	install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/vertcoin-git.desktop"
}
