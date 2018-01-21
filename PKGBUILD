# Maintainer: Michael Thalmeier <michael@thalmeier.at>
# Contributor: Michael Thalmeier <michael@thalmeier.at>

pkgname=('polis-daemon' 'polis-cli' 'polis-qt')
pkgbase=polis
pkgver=1.2.1
pkgrel=0
arch=('i686' 'x86_64')
url="http://www.polispay.org/"
depends=('boost-libs' 'libevent')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
optdepends=('zeromq: Optional, allows generating ZMQ notifications'
            'miniupnpc: Firewall-jumping support'
            'db4.8: Wallet storage')
pkgdesc="Polis peer-to-peer network based digital currency "
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/polispay/polis/archive/v${pkgver}.tar.gz"
	"txmempool.patch"
	"polisd@.service")
sha256sums=('94b09a54ca943d4132ae06abc89c41229bb8c83a3ee9e5a0a5d257076386ccd3'
	    '2d033c1ee77e1fae89da61f3b0e494feaf91f1b860fe4b3c0ec848c013776a25'
            '59fc628be7c2aa6dc6db31d7a621392d2e24f1722328b4cfb0797ffe76e108be')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  patch -p1 -i "$srcdir/txmempool.patch"
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  chmod +x autogen.sh
  chmod +x share/genbuild.sh
  ./autogen.sh
  ./configure --with-incompatible-bdb --enable-hardening --disable-tests
  make
}

package_polis-daemon() {
  pkgdesc+="(daemon)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm644 "${srcdir}/polisd@.service"            "${pkgdir}/usr/lib/systemd/system/polisd@.service"
  install -Dm755 "src/polisd" 						   "${pkgdir}/usr/bin/polisd"
  install -Dm644 "contrib/debian/examples/polis.conf"   "${pkgdir}/usr/share/doc/${pkgname}/examples/polis.conf"
  install -Dm644 "contrib/debian/manpages/polisd.1" 	   "${pkgdir}/usr/share/man/man1/polisd.1"
  install -Dm644 "contrib/debian/manpages/polis.conf.5" "${pkgdir}/usr/share/man/man5/polis.conf.5"
  install -Dm644 "COPYING" 					  		   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_polis-cli() {
  pkgdesc+="(CLI)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "src/polis-cli" "${pkgdir}/usr/bin/polis-cli"
  install -Dm755 "src/polis-tx"  "${pkgdir}/usr/bin/polis-tx"
  install -Dm644 "COPYING" 	    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_polis-qt() {
  depends+=('qt5-base' 'qt5-tools' 'miniupnpc')
  optdepends=('protobuf: Data interchange format used for payment protocol'
              'qrencode: Optional for generating QR codes')

  pkgdesc+="(Qt)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "src/qt/polis-qt" 				  "${pkgdir}/usr/bin/polis-qt"
  install -Dm644 "contrib/debian/polis-qt.desktop" "${pkgdir}/usr/share/applications/polis.desktop"
  install -Dm644 "share/pixmaps/polis128.png"   "${pkgdir}/usr/share/pixmaps/polis128.png"
  install -Dm644 "COPYING" 						  "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
