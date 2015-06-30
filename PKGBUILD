#Maintainer truh <truhgoj[äT]truh(O)in>

pkgname=flappycoin-qt
pkgver=4.0.1.0
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://flappycoin.info/"
license=('MIT')
provides=('flappycoin-qt')
depends=('qt5-base' 'miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
makedepends=('boost' 'gcc' 'make' 'git' 'miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
source=("https://github.com/FlappycoinDEV/flappycoin/archive/${pkgver}.zip"
        "flappycoin.desktop")
install=flappycoin.install

sha512sums=('a2b8dfba02ebca06180a70aece3ab2e179005656843841f085cdcbde3417e6cc57cf73bbba09daf35911a039742e494a548e4783502b30425969a6fa02c996e0'
            '166004f5dfbbfc1e389140f9b26f9d7a17b300642338db458045d0bbfe07caeaee4723812cdb9177cdc3fa63505582d7fb7de5af5c7c276146765948310c9bb1')

## files & commands for building
_qmake=qmake-qt5

prepare() {
	cd ${srcdir}/flappycoin-${pkgver}/
}

build() {
	cd ${srcdir}/flappycoin-${pkgver}/
	
	${_qmake} -after "QMAKE_CXXFLAGS+=-DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT" flappycoin-qt.pro
		
	make ${MAKEFLAGS}
}

package() {
	install -Dm644 flappycoin.desktop ${pkgdir}/usr/share/applications/flappycoin.desktop

	cd $srcdir/flappycoin-${pkgver}
    mkdir -p -m 755 "${pkgdir}/usr/share/flappycoin-qt/"
	install -Dm755 flappycoin-qt "${pkgdir}/usr/bin/flappycoin-qt"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 src/qt/res/icons/bitcoin.png "${pkgdir}/usr/share/pixmaps/flappycoin.png"

    make DESTDIR=${pkgdir} install
}
