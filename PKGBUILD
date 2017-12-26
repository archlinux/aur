# Maintainer: 隠岐奈 <okinan@protonmail.com>
pkgname='navcoin'
pkgver='4.1.1'
pkgrel='1'
pkgdesc="Privacy-oriented cryptocurrency and distributed computing platform"
arch=('any')
url="https://navcoin.org/"
license=('MIT')
depends=('boost' 'python')
makedepends=('miniupnpc' 'db4.8' 'qt5-base' 'protobuf' 'qrencode' 'zeromq')
optdepends=('miniupnpc: Firewall-jumping support'
			'db4.8: Wallet storage'
			'qt5-base: GUI toolkit'
			'protobuf: Data interchange format used for payment protocol'
			'qrencode: Generate QR codes'
			'zeromq: Generate ZMQ notifications')
provides=('navcoin')
conflicts=('navcoin-bin' 'navcoin-git')
source=("https://github.com/NAVCoin/navcoin-core/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
		"navcoin.desktop"
		"navcoind.service")
md5sums=('35c8b696f09681f80943e7adb0ccab34'
         '1885c0577f19f819aafc56c7ea52f00a'
         'c67b248610947e2fd11489923eed7fa0')

build() {
	cd "${pkgname}-${pkgver}"
	
	./autogen.sh
	./configure --enable-upnp-default --prefix=/usr
	
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	
	make DESTDIR="${pkgdir}/" install

	install -Dm644 "${srcdir}/navcoind.service" "${pkgdir}/usr/lib/systemd/system/navcoind.service"
	install -Dm644 "${srcdir}/navcoin.desktop" "${pkgdir}/usr/share/applications/navcoin.desktop"
}
