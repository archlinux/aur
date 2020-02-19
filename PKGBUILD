# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Nicolas Doualot <packages@slubman.info>

pkgname=('dash-daemon' 'dash-cli' 'dash-qt')
pkgbase=dash
pkgver=0.15.0.0
pkgrel=1
arch=('x86_64')
url="http://www.dash.org/"
depends=('boost-libs' 'libevent')
makedepends=('boost' 'codablock-bls-signatures')
optdepends=('miniupnpc: Firewall-jumping support'
            'db4.8: Wallet storage and wallet portability')
pkgdesc="Dash peer-to-peer network based digital currency "
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dashpay/dash/archive/v${pkgver}.tar.gz"
        'dashd@.service'
        'deque.patch')
sha512sums=('cb7534161e8f25507afeda65a5aca3d07594531b87981be1e80251e8ffbe816525f4829a073c99e3666220de73ade7f3f1c3bdaac377553a667d20d3c21ce3f7'
            'b5c59efacbe85de0292590af12e35d8c001c2b71eebda9829754be48e61a70ad7e8ed99662ed4e8da53006eb72e1994c435813b35c16a9c566ddf455efe81b5b'
            'f558e938285fbf14c2f1773b2b23018e52ee03d4d2c89c2e1c73dc5f84180b77acc229a2c041f2f058e3a0ea329302d3bd9ef683c5c88570f3d2c4ab5a7050a6')

prepare () {
  cd "$pkgbase-$pkgver"
 #deque patch 2020-02-12
 #inlcude deque.h library in httpserver.cpp found in https://github.com/dogecoin/dogecoin/pull/1626
 #will delete when dash fixes/commits this.
  patch --forward --strip=1 --input="../../deque.patch"
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  ./autogen.sh
  ./configure --with-incompatible-bdb --enable-hardening
  make
}

package_dash-daemon() {
  pkgdesc+="(daemon)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm644 "${srcdir}/dashd@.service"            "${pkgdir}/usr/lib/systemd/system/dashd@.service"
  install -Dm755 "src/dashd"                           "${pkgdir}/usr/bin/dashd"
  install -Dm644 "contrib/debian/examples/dash.conf"   "${pkgdir}/usr/share/doc/${pkgname}/examples/dash.conf"
  install -Dm644 "doc/man/dashd.1"                     "${pkgdir}/usr/share/man/man1/dashd.1"
  install -Dm644 "COPYING"                             "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_dash-cli() {
  pkgdesc+="(CLI)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "src/dash-cli" "${pkgdir}/usr/bin/dash-cli"
  install -Dm755 "src/dash-tx"  "${pkgdir}/usr/bin/dash-tx"
  install -Dm644 "COPYING"      "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_dash-qt() {
  depends+=('qt5-base' 'qt5-tools' 'miniupnpc')
  optdepends=('protobuf: Data interchange format used for payment protocol'
              'qrencode: Optional for generating QR codes')

  pkgdesc+="(Qt)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "src/qt/dash-qt"                 "${pkgdir}/usr/bin/dash-qt"
  install -Dm644 "contrib/debian/dash-qt.desktop" "${pkgdir}/usr/share/applications/dash.desktop"
  install -Dm644 "share/pixmaps/dash128.png"      "${pkgdir}/usr/share/pixmaps/dash128.png"
  install -Dm644 "COPYING"                        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
