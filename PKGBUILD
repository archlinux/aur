## Maintainer: peerchemist <peerchemist@protonmail.ch>

pkgname=('peercoin-qt' 'peercoind')
pkgbase=peercoin
_gitname=peercoin
pkgver=0.6.1
pkgrel=2
pkgdesc="Official Peercoin wallet."
makedepends=('gcc' 'make' 'boost' 'miniupnpc' 'openssl' 'qt5-base' 'qt5-tools')
depends=('boost-libs' 'openssl' 'miniupnpc' 'qt5-base')
replaces=("ppcoin-daemon" "ppcoin-qt" "ppcoind")
conflicts=("peercoind-git" "peercoin-qt-git")
arch=('x86_64' 'i686')
url='peercoin.net'
license=('MIT')
source=(https://github.com/peercoin/peercoin/archive/v${pkgver}ppc.tar.gz
        peercoin-qt@.service
        peercoin-qt-tor@.service
        )
sha256sums=('f6ce0647c9f3b4b4c28c5b77955c9ae4808a8c7f5e55a99f1337317a29a0bc1b'
            'bc898697baab589b87b0b78edd5aed35a3b800fe039afc03637b4895cfd28f32'
            '3f71859675561dd35c4527d96651b07996968e318dfbf26e8ce959f61a0d682f')

build() {
	cd "$srcdir/${_gitname}-${pkgver}ppc"
	
	## make qt gui
	qmake-qt5 USE_QRCODE=1 USE_UPNP=1 USE_DBUS=1 \
	    QMAKE_CFLAGS="${CFLAGS}"\
    	QMAKE_CXXFLAGS="${CXXFLAGS} -pie"
	make

	## make peercoind
  	make -f makefile.unix USE_UPNP=1 -e PIE=1 -C src
}

check() {
  cd "$srcdir/${_gitname}-${pkgver}ppc"
  
  make -f makefile.unix test_${_gitname} -C src
}

package_peercoin-qt() {
	
	pkgdesc="Official implementation of Peercoin, the sustainable and secure cryptocurrency alternative to Bitcoin - QT wallet."
	makedepends=('gcc' 'make' 'qt5-base' 'boost' 'gcc' 'make' 'qrencode' 'openssl' 'miniupnpc' 'qt5-tools')
	depends=('qt5-base' 'miniupnpc' 'boost-libs' 'qrencode' 'miniupnpc')
	optdepeds=('systemd' 'tor')
	install=peercoin-qt.install

	install -Dm644 $pkgname@.service "${pkgdir}/usr/lib/systemd/system/$pkgname@.service"
	install -Dm644 $pkgname-tor@.service "${pkgdir}/usr/lib/systemd/system/$pkgname-tor@.service"

	cd "$srcdir/${_gitname}-${pkgver}ppc"
	install -Dm644 "contrib/debian/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm755 peercoin-qt "${pkgdir}/usr/bin/$pkgname"
	#install -Dm644 COPYING "${pkgdir}/usr/share/licenses/peercoin/COPYING"
	install -Dm644 "src/qt/res/icons/peercoin.png" "${pkgdir}/usr/share/pixmaps/peercoin.png"
	
}

package_peercoind() {
	
	makedepends=('boost' 'gcc' 'make' 'openssl' 'miniupnpc')
	depends=('gcc' 'make' 'boost-libs' 'miniupnpc')
	optdepeneds=('systemd' 'tor')
	pkgdesc="Official implementation of Peercoin, the sustainable and secure cryptocurrency alternative to Bitcoin - daemon."
	install=peercoind.install

	install -Dm644 "$srcdir/${_gitname}-${pkgver}ppc/COPYING" "$pkgdir/usr/share/licenses/peercoin/COPYING"

	cd "$srcdir/${_gitname}-${pkgver}ppc"
	install -Dm755 "src/peercoind" "$pkgdir/usr/bin/$pkgname"
        install -Dm644 "contrib/systemd/${_gitname}d-tor@.service" "$pkgdir/usr/lib/systemd/system/${_gitname}d-tor@.service"
        install -Dm644 "contrib/systemd/${_gitname}d@.service" "$pkgdir/usr/lib/systemd/system/${_gitname}d@.service"

}
