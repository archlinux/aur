## Maintainer: peerchemist <peerchemist@protonmail.ch>

pkgname=('peercoin-qt' 'peercoind')
pkgbase=peercoin
_gitname=peercoin
pkgver=0.6.2
pkgrel=3
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
sha256sums=('d64a8fdcd874d2e211f5dd3002e187769b3ec656f985f538ea0510f1b58ac2b6'
            'bc898697baab589b87b0b78edd5aed35a3b800fe039afc03637b4895cfd28f32'
            '3f71859675561dd35c4527d96651b07996968e318dfbf26e8ce959f61a0d682f')

prepare() {
	cd "$srcdir/${_gitname}-${pkgver}ppc"
	./autogen.sh
}

build() {
	cd "$srcdir/${_gitname}-${pkgver}ppc"

	msg2 'Building...'
	./configure --with-incompatible-bdb --with-gui=qt5
  	make
}

check() {
  cd "$srcdir/${_gitname}-${pkgver}ppc"
  
  make check
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
	install -Dm755 "src/qt/peercoin-qt" "${pkgdir}/usr/bin/$pkgname"
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
