# Maintainer: 隠岐奈 <okinan@protonmail.com>
_basename='navcoin'
pkgname='navcoin-git'
pkgver='r809.6f4be6f'
pkgrel='1'
pkgdesc="Privacy-oriented cryptocurrency and distributed computing platform - Git version"
arch=('any')
url="https://navcoin.org/"
license=('MIT')
depends=('boost' 'python')
makedepends=('git' 'miniupnpc' 'db4.8' 'qt5-base' 'protobuf' 'qrencode' 'zeromq')
optdepends=('miniupnpc: Firewall-jumping support'
			'db4.8: Wallet storage'
			'qt5-base: GUI toolkit'
			'protobuf: Data interchange format used for payment protocol'
			'qrencode: Generate QR codes'
			'zeromq: Generate ZMQ notifications')
provides=('navcoin-git')
conflicts=('navcoin' 'navcoin-bin')
source=("git+https://github.com/NAVCoin/navcoin-core.git"
		"navcoin.desktop"
		"navcoind.service")
md5sums=('SKIP'
         '1885c0577f19f819aafc56c7ea52f00a'
         'c67b248610947e2fd11489923eed7fa0')

pkgver() {
    cd "${_basename}-core"
    
    printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_basename}-core"
	
	./autogen.sh
	./configure --enable-upnp-default --prefix=/usr
	
	make
}

package() {
	cd "${_basename}-core"
	
	make DESTDIR="${pkgdir}/" install

	install -Dm644 "${srcdir}/navcoind.service" "${pkgdir}/usr/lib/systemd/system/navcoind.service"
	install -Dm644 "${srcdir}/navcoin.desktop" "${pkgdir}/usr/share/applications/navcoin.desktop"
}
