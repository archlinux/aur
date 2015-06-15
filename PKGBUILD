#Maintainer truh <truhgoj[äT]truh(O)in>

pkgname=flappycoin-qt
_binname=flappycoin
pkgver=4.0.0
pkgrel=1
_version=4.0
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://flappycoin.info/"
license=('MIT')
provides=('flappycoin-qt')
depends=('qt5-base' 'miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
makedepends=('boost' 'gcc' 'make' 'git' 'miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
source=("https://github.com/FlappycoinDEV/flappycoin/archive/v${_version}.tar.gz"
        "flappycoin.desktop")
install=flappycoin.install

sha512sums=('bde1d421ab46dabc86792112be5f69bc49a21d8b3a13be99fe54b0600c9cd6c4ac72bd2867a66541b864f09288e63124366f3fb4b4d41ebe69176d3b50c9153a'
            '166004f5dfbbfc1e389140f9b26f9d7a17b300642338db458045d0bbfe07caeaee4723812cdb9177cdc3fa63505582d7fb7de5af5c7c276146765948310c9bb1')

## files & commands for building
_qmake=qmake-qt5

prepare() {
	cd ${srcdir}/flappycoin-${_version}/
}

build() {
	cd ${srcdir}/flappycoin-${_version}/
	
	${_qmake} -after "QMAKE_CXXFLAGS+=-DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT" ${_binname}-qt.pro
		
	make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd $srcdir/flappycoin-${_version}
    mkdir -p -m 755 "${pkgdir}/usr/share/${_binname}-qt/"
	install -Dm755 ${_binname}-qt "${pkgdir}/usr/bin/${_binname}-qt"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 src/qt/res/icons/bitcoin.png "${pkgdir}/usr/share/pixmaps/${_binname}.png"

    make DESTDIR=${pkgdir} install
}
