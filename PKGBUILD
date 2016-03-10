## Maintainer: peerchemist <peerchemist@protonmail.ch>

pkgname=('peercoin-qt' 'peercoind')
pkgbase=peercoin
_gitname=ppcoin
pkgver=0.5.2
pkgrel=3
pkgdesc="Peercoin wallet client."
makedepends=('boost' 'miniupnpc' 'openssl')
depends=('boost-libs' 'openssl' 'miniupnpc')
replaces=("ppcoin-daemon" "ppcoin-qt" "ppcoind")
arch=('x86_64' 'i686')
url='peercoin.net'
license=('MIT')
source=(https://github.com/ppcoin/ppcoin/archive/v${pkgver}ppc.tar.gz
        peercoin-qt.desktop
        upnp-1.9.patch
        peercoin-qt@.service
        peercoin-qt-tor@.service
        peercoind@.service
        peercoind-tor@.service)
sha256sums=('60c12c0cde3f52f714ec6ba3656da2a39838761cb05c2ec8b21bacd33b268760'
            '6cb18e19847bbf4066920dbbf4371ddf07409392408fc6d079487e8759ea322e'
            '3060917f8e327002da842534265392a1849239ec5049f25c1ae8a81c3952e7b1'
            'cdb6a0083497d382eb36a16bcb6e99cde9a613ea3069b4e45b02f04f233f3ea2'
            '3f71859675561dd35c4527d96651b07996968e318dfbf26e8ce959f61a0d682f'
            '6cebc3ad79dc596f5d4e51d10c6ce5d2cb8b848137f78e532efbee23d2410d57'
            '88459c23c17faca43582745591ebc54ed4baac85beb26aadeb3b43363c852d74')

prepare() {
	cd "$srcdir/${_gitname}-${pkgver}ppc"
	patch -p1 -i ../upnp-1.9.patch
}

build() {
	cd "$srcdir/${_gitname}-${pkgver}ppc"

	## make qt gui
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1 USE_SSL=1 \
	    QMAKE_CFLAGS="${CFLAGS}"\
    	QMAKE_CXXFLAGS="${CXXFLAGS} -pie"
	make

	## make ppcoind
  	make -f makefile.unix USE_UPNP=1 USE_SSL=1 -e PIE=1 -C src
}

package_peercoin-qt() {
	
	pkgdesc="Official implementation of Peercoin, the sustainable and secure cryptocurrency alternative to Bitcoin - QT wallet."
	makedepends=('qt4' 'boost' 'gcc' 'make' 'qrencode' 'openssl' 'miniupnpc')
	depends=('qt4' 'miniupnpc' 'boost-libs' 'qrencode' 'miniupnpc')
	optdepeds=('systemd' 'tor')
	install=peercoin.install

	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 $pkgname@.service "${pkgdir}/usr/lib/systemd/system/$pkgname@.service"
	install -Dm644 $pkgname-tor@.service "${pkgdir}/usr/lib/systemd/system/$pkgname-tor@.service"

	cd "$srcdir/${_gitname}-${pkgver}ppc"
	install -Dm755 ppcoin-qt "${pkgdir}/usr/bin/$pkgname"
	#install -Dm644 COPYING "${pkgdir}/usr/share/licenses/peercoin/COPYING"
	install -Dm644 "src/qt/res/icons/ppcoin.png" "${pkgdir}/usr/share/pixmaps/peercoin.png"
	
}

package_peercoind() {
	
	makedepends=('boost' 'gcc' 'make' 'openssl' 'miniupnpc')
	depends=('boost-libs' 'miniupnpc')
	optdepeneds=('systemd' 'tor')
	pkgdesc="Official implementation of Peercoin, the sustainable and secure cryptocurrency alternative to Bitcoin - daemon."
	install=peercoin.install

	install -Dm644 $pkgname@.service "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
	install -Dm644 $pkgname-tor@.service "$pkgdir/usr/lib/systemd/system/$pkgname-tor@.service"
	install -Dm644 "$srcdir/${_gitname}-${pkgver}ppc/COPYING" "$pkgdir/usr/share/licenses/peercoin/COPYING"

	cd "$srcdir/${_gitname}-${pkgver}ppc"
	install -Dm755 "src/ppcoind" "$pkgdir/usr/bin/$pkgname"
}
