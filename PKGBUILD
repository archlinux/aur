# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Nicolas Doualot <packages@slubman.info>

pkgname=('dash-daemon' 'dash-cli' 'dash-qt')
pkgbase=dash
pkgver=0.16.1.1
pkgrel=1
arch=('x86_64')
url="http://www.dash.org/"
depends=('boost-libs' 'libevent' 'libbacktrace-git')
makedepends=('boost' 'codablock-bls-signatures' 'qt5-tools')
optdepends=('miniupnpc: Firewall-jumping support'
            'db4.8: Wallet storage and wallet portability')
pkgdesc="Dash peer-to-peer network based digital currency "
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dashpay/dash/archive/v${pkgver}.tar.gz"
        'dashd@.service'
        'deque.patch'
        'qpainterpath.patch::https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690.patch')
sha512sums=('7347f23897f92ca1a01f84847481450922834a0bb917e7e0ba6a4d98712c86de7bdd151dc3ed42aaa8a8ec9bba24187cc0a9854870b50256ac21a37e6b683fff'
            'b5c59efacbe85de0292590af12e35d8c001c2b71eebda9829754be48e61a70ad7e8ed99662ed4e8da53006eb72e1994c435813b35c16a9c566ddf455efe81b5b'
            'f558e938285fbf14c2f1773b2b23018e52ee03d4d2c89c2e1c73dc5f84180b77acc229a2c041f2f058e3a0ea329302d3bd9ef683c5c88570f3d2c4ab5a7050a6'
            '1eda9a1d5616a0602f85b0d04838657fe5fa75746a2da7a4614124e6081eeb1997e845d61a7d7a9a52a9d5ef9215617205924811cfef32132bf7fce9c3c603fb')

prepare () {
  cd "$pkgbase-$pkgver"
 #deque patch 2020-02-12
 #inlcude deque.h library in httpserver.cpp found in https://github.com/dogecoin/dogecoin/pull/1626
 #will delete when dash fixes/commits this.
  patch --forward --strip=1 --input="../../deque.patch"

 #QPainterPath 2020-10-12 == Add missing QPainterPath include
 #include QPainterPath library in src/qt/trafficgraphwidget.cpp found in https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690
 #will delete when dash fixes/commits this. This happens because dash is compiling against older versions of qt5-base
  patch --forward --strip=1 --input="../../qpainterpath.patch"
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
