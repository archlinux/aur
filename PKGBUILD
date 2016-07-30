## Maintainer: peerchemist <peerchemist@protonmail.ch>

pkgname=('peercoin-qt' 'peercoind')
pkgbase=peercoin
_gitname=ppcoin
pkgver=0.5.4
pkgrel=3
pkgdesc="Peercoin wallet client."
makedepends=('boost' 'miniupnpc' 'openssl' 'qt4')
depends=('boost-libs' 'openssl' 'miniupnpc' 'qt4')
replaces=("ppcoin-daemon" "ppcoin-qt" "ppcoind")
arch=('x86_64' 'i686')
url='peercoin.net'
license=('MIT')
source=(https://github.com/ppcoin/ppcoin/archive/v${pkgver}ppc.tar.gz
        peercoin-qt.desktop
        peercoin-qt@.service
        peercoin-qt-tor@.service
        peercoind@.service
        peercoind-tor@.service)
sha256sums=('61d9de36f111c833afa491d4db2473985e126a26fd5f913db6663bdec88c1075'
            '6cb18e19847bbf4066920dbbf4371ddf07409392408fc6d079487e8759ea322e'
            'bc898697baab589b87b0b78edd5aed35a3b800fe039afc03637b4895cfd28f32'
            '3f71859675561dd35c4527d96651b07996968e318dfbf26e8ce959f61a0d682f'
            '80dcdf2bf3540a3ddd3c2cd1299aa97db06bf1efdadee4ad847e3371658dd62f'
            'fb91690d271faa28919ce11e902f1d2ec926d8eb8ddebff28bef5d2cee78be1e')

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

check() {
  cd "$srcdir/${_gitname}-${pkgver}ppc"
  
  make -f makefile.unix test_${_gitname} -C src
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
