# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Nicolas Doualot <packages@slubman.info>

pkgname=('dash-daemon' 'dash-cli' 'dash-qt')
pkgbase=dash
pkgver=0.14.0.5
pkgrel=2
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
sha512sums=('48344e2fe43ca9d2e8621f59b5141243ca3d9da58da7701903ce65d8b56e41bb98cf31e8284835f2303182a934a4df5cc4e13438d346938851fda79d924cb388'
            'b5c59efacbe85de0292590af12e35d8c001c2b71eebda9829754be48e61a70ad7e8ed99662ed4e8da53006eb72e1994c435813b35c16a9c566ddf455efe81b5b'
            'bb85a882cf5646cef7eb50a4fd1c60fb50409fafc5ef18351a767fce927fd7dbe616b468f74d02d4ed267683de798e563b9cd7be9b1c7a5100113b2164b54825')

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
