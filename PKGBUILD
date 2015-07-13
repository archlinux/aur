#Maintainer truh <truhgoj[äT]truh(O)in>

pkgname=flappycoin-qt
pkgver=4.0.2.0
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

sha512sums=('2873ba2deff68c15431658e756dbeb496809a7b015330f9dd731e00c54b1c40f871960af3c8846cf87b8176d9134d0156816f141abd24ca5df79497c6686379f'
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
