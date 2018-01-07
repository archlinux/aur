# Maintainer: Michael Thalmeier <michael@thalmeier.at>
# Contributor: Michael Thalmeier <michael@thalmeier.at>

pkgname=('desire-daemon' 'desire-cli' 'desire-qt')
pkgbase=desire
pkgver=0.12.2.1
pkgrel=0
arch=('i686' 'x86_64')
url="http://www.desire-crypto.com/"
depends=('boost-libs' 'libevent')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
optdepends=('zeromq: Optional, allows generating ZMQ notifications'
            'miniupnpc: Firewall-jumping support'
            'db4.8: Wallet storage')
pkgdesc="Desire peer-to-peer network based digital currency "
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lazyboozer/Desire/archive/Desire-v.${pkgver}.tar.gz"
	"txmempool.patch"
	"desired@.service")
sha256sums=('8461553d17922a11f9575547227aa6d9a90dac5cc3b489b6bb5bd056439ba9df'
	    '2d033c1ee77e1fae89da61f3b0e494feaf91f1b860fe4b3c0ec848c013776a25'
            'f75b464c6ca050848c758c71848e830f4264e7ee70627592fa5442a293b3b5ca')

prepare() {
	cd "${srcdir}/Desire-Desire-v.${pkgver}"
	patch -p1 -i "$srcdir/txmempool.patch"
}

build() {
  cd "${srcdir}/Desire-Desire-v.${pkgver}"
  chmod +x autogen.sh
  chmod +x share/genbuild.sh
  ./autogen.sh
  ./configure --with-incompatible-bdb --enable-hardening
  make
}

package_desire-daemon() {
  pkgdesc+="(daemon)"

  cd "${srcdir}/Desire-Desire-v.${pkgver}"
  install -Dm644 "${srcdir}/desired@.service"            "${pkgdir}/usr/lib/systemd/system/desired@.service"
  install -Dm755 "src/desired" 						   "${pkgdir}/usr/bin/desired"
  install -Dm644 "contrib/debian/examples/desire.conf"   "${pkgdir}/usr/share/doc/${pkgname}/examples/desire.conf"
  install -Dm644 "contrib/debian/manpages/desired.1" 	   "${pkgdir}/usr/share/man/man1/desired.1"
  install -Dm644 "contrib/debian/manpages/desire.conf.5" "${pkgdir}/usr/share/man/man5/desire.conf.5"
  install -Dm644 "COPYING" 					  		   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_desire-cli() {
  pkgdesc+="(CLI)"

  cd "${srcdir}/Desire-Desire-v.${pkgver}"
  install -Dm755 "src/desire-cli" "${pkgdir}/usr/bin/desire-cli"
  install -Dm755 "src/desire-tx"  "${pkgdir}/usr/bin/desire-tx"
  install -Dm644 "COPYING" 	    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_desire-qt() {
  depends+=('qt5-base' 'qt5-tools' 'miniupnpc')
  optdepends=('protobuf: Data interchange format used for payment protocol'
              'qrencode: Optional for generating QR codes')

  pkgdesc+="(Qt)"

  cd "${srcdir}/Desire-Desire-v.${pkgver}"
  install -Dm755 "src/qt/desire-qt" 				  "${pkgdir}/usr/bin/desire-qt"
  install -Dm644 "contrib/debian/desire-qt.desktop" "${pkgdir}/usr/share/applications/desire.desktop"
  install -Dm644 "share/pixmaps/desire128.png"   "${pkgdir}/usr/share/pixmaps/desire128.png"
  install -Dm644 "COPYING" 						  "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
