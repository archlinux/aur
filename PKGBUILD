## Maintainer: peerchemist <peerchemist@protonmail.ch>

pkgname=('peercoin-qt' 'ppcoind')
pkgbase=peercoin
pkgver=0.4.2
pkgrel=1
pkgdesc="Peercoin wallet client."
arch=('x86_64' 'i686')
url='peercoin.net'
license=('MIT')
source=(https://github.com/ppcoin/ppcoin/archive/v${pkgver}ppc.tar.gz
        peercoin-qt.desktop
        upnp-1.9.patch
        peercoin-qt@.service
        ppcoind@.service)
sha256sums=('d1217b40f8b9933b4e824eb4a6f9bfefce6e793f3cafdcf32420c9d7b7049125'
            '6cb18e19847bbf4066920dbbf4371ddf07409392408fc6d079487e8759ea322e'
            '3060917f8e327002da842534265392a1849239ec5049f25c1ae8a81c3952e7b1'
            '28d80670d836c57ffa38729508649afbe05338dc92c89a44c64230a7ebd97eae'
            '5123ec91ad8b304f46c53f49b52ffd1e41c66c3df40c23209128ce2761f7c079')

prepare() {
	cd "$srcdir/peercoin-${pkgver}ppc"
	patch -p1 -i ../upnp-1.9.patch
}

build() {
	cd "$srcdir/ppcoin-${pkgver}ppc"

	## make qt gui
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1 USE_SSL=1 \
	    QMAKE_CFLAGS="${CFLAGS}"\
    	QMAKE_CXXFLAGS="${CXXFLAGS} -pie"
	make

	## make ppcoind
	#cd "$srcdir/peercoin"
  	make -f makefile.unix USE_UPNP=1 USE_SSL=1 -e PIE=1 -C src
}

package_peercoin-qt() {
	
	pkgdesc="Official implementation of Peercoin, the sustainable and secure cryptocurrency alternative to Bitcoin - QT wallet."
	makedepends=('qt4' 'boost' 'gcc' 'make' 'qrencode' 'openssl' 'miniupnpc')
	depends=('qt4' 'miniupnpc' 'boost-libs' 'qrencode' 'miniupnpc')
	optdepeds=('systemd')
	install=peercoin.install

	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 peercoin-qt@.service "${pkgdir}/usr/lib/systemd/system/peercoin-qt@.service"

	cd "$srcdir/peercoin-${pkgver}ppc"
	install -Dm755 ppcoin-qt "${pkgdir}/usr/bin/peercoin-qt"
	#install -Dm644 COPYING "${pkgdir}/usr/share/licenses/peercoin/COPYING"
	install -Dm644 "src/qt/res/icons/ppcoin.png" "${pkgdir}/usr/share/pixmaps/peercoin.png"
	
}

package_ppcoind() {
	
	makedepends=('boost' 'gcc' 'make' 'openssl' 'miniupnpc')
	depends=('boost-libs' 'miniupnpc')
	optdepeneds=('systemd')
	pkgdesc="Official implementation of Peercoin, the sustainable and secure cryptocurrency alternative to Bitcoin - daemon."

	install -Dm644 ppcoind@.service "$pkgdir/usr/lib/systemd/system/ppcoind@.service"
	install -Dm644 "$srcdir/peercoin-${pkgver}ppc/COPYING" "$pkgdir/usr/share/licenses/peercoin/COPYING"

	cd "$srcdir/peercoin-${pkgver}ppc"
	install -Dm755 "src/ppcoind" "$pkgdir/usr/bin/ppcoind"
}
