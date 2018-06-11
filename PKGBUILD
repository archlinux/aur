# Maintainer: Michael Thalmeier <michael@thalmeier.at>
# Contributor: Michael Thalmeier <michael@thalmeier.at>

pkgname=('gravium-daemon' 'gravium-cli' 'gravium-qt')
pkgbase=gravium
pkgver=1.0.2.1
pkgrel=0
arch=('i686' 'x86_64')
url="https://gravium.io/"
depends=('boost-libs' 'libevent')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
optdepends=('zeromq: Optional, allows generating ZMQ notifications'
            'miniupnpc: Firewall-jumping support'
            'db4.8: Wallet storage')
pkgdesc="Gravium peer-to-peer network based digital currency "
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Gravium/gravium/archive/${pkgver}.tar.gz"
	"graviumd@.service")
sha256sums=('b837ecf3ae5a750b9862d0aefb2b5016b4689b77eddf29e9833fe299bda839ff'
            '60fe54a68a3d251f67022c96e2324c6a8f8bc826405272f254978d8c305e06c7')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  chmod +x autogen.sh
  chmod +x share/genbuild.sh
  ./autogen.sh
  ./configure --with-incompatible-bdb --enable-hardening --disable-tests
  make
}

package_gravium-daemon() {
  pkgdesc+="(daemon)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm644 "${srcdir}/graviumd@.service"            "${pkgdir}/usr/lib/systemd/system/graviumd@.service"
  install -Dm755 "src/graviumd" 						   "${pkgdir}/usr/bin/graviumd"
  install -Dm644 "contrib/debian/examples/gravium.conf"   "${pkgdir}/usr/share/doc/${pkgname}/examples/gravium.conf"
  install -Dm644 "contrib/debian/manpages/graviumd.1" 	   "${pkgdir}/usr/share/man/man1/graviumd.1"
  install -Dm644 "contrib/debian/manpages/gravium.conf.5" "${pkgdir}/usr/share/man/man5/gravium.conf.5"
  install -Dm644 "COPYING" 					  		   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_gravium-cli() {
  pkgdesc+="(CLI)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "src/gravium-cli" "${pkgdir}/usr/bin/gravium-cli"
  install -Dm755 "src/gravium-tx"  "${pkgdir}/usr/bin/gravium-tx"
  install -Dm644 "COPYING" 	    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_gravium-qt() {
  depends+=('qt5-base' 'qt5-tools' 'miniupnpc')
  optdepends=('protobuf: Data interchange format used for payment protocol'
              'qrencode: Optional for generating QR codes')

  pkgdesc+="(Qt)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "src/qt/gravium-qt" 				  "${pkgdir}/usr/bin/gravium-qt"
  install -Dm644 "contrib/debian/gravium-qt.desktop" "${pkgdir}/usr/share/applications/gravium.desktop"
  install -Dm644 "share/pixmaps/gravium128.png"   "${pkgdir}/usr/share/pixmaps/gravium128.png"
  install -Dm644 "COPYING" 						  "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
