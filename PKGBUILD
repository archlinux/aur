# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>
# Based on PKGBUILD from darkcoin-git maintained by Viliam Kubis <viliam dot kubis at gmail dot com>

pkgname='dashcore'
_pkgname='dash'
pkgver=0.16.1.1
pkgrel=1
pkgdesc="Dash Core (DASH, Dashpay, formerly Darkcoin) is an open source, privacy-centric digital currency. (Includes the qt-client, the headless daemon and the command-line tool.)"
arch=('x86_64')
url="https://www.dash.org/"
license=('MIT')
depends=('qt5-base' 'boost' 'boost-libs' 'miniupnpc' 'protobuf' 'db4.8' 'zeromq' 'libevent' 'qrencode' 'libbacktrace-git')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'qt5-tools' 'codablock-bls-signatures')
provides=('dash-daemon' 'dash-qt' 'dash-cli')
conflicts=('dashcore-git' 'dashcore-bin' 'dash-cli' 'dash-qt' 'dash-daemon')
source=('dash256.png'
        'dash-qt.desktop'
        'deque.patch'
        'qpainterpath.patch::https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690.patch'
        'https://github.com/dashpay/dash/blob/master/COPYING'
        "${_pkgname}-v${pkgver}.tar.gz::https://github.com/dashpay/dash/archive/v${pkgver}.tar.gz")
sha256sums=('d719e01df4b47f4d6f0d4d6eac50d402bebb4127d0b6d64764fe2a42e903819b'
            '41f83cb53ecf33688d899f83e09bd52f9aa8e6d7b9b0f30810f192988b26079a'
            'ded0b32ec96d8cbe996557d57c1c31583d30567377d3e9a0c3168f0aec3c817e'
            '475b6c0e7bc8d797020bdfc048a6b66e0513482fd469d6da2a599d3811f81f52'
            'b5290c16b194d488265f3af37a7ab74cb9fecea2de97b910670cefa4e0909853'
            '98bc0f50c65ca1a149c95f1b87ae926457e0e0623af7a1e2a7e345fdfe0eecc8')

prepare () {
  cd "$_pkgname-$pkgver"
 #deque patch 2020-02-12 == http: add missing header bootlegged by boost < 1.72
 #inlcude deque library in src/httpserver.cpp found in https://github.com/bitcoin/bitcoin/commit/a5929130223973636f3fd25fbfaf2953f2ec96a9 and #inlcude deque.h library in httpserver.cpp found in https://github.com/dogecoin/dogecoin/pull/1626
 #will delete when dash fixes/commits this.
  patch --forward --strip=1 --input="../../deque.patch"

 #QPainterPath 2020-10-12 == Add missing QPainterPath include
 #include QPainterPath library in src/qt/trafficgraphwidget.cpp found in https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690
 #will delete when dash fixes/commits this. This happens because dash is compiling against older versions of qt5-base
  patch --forward --strip=1 --input="../../qpainterpath.patch"
}

build() {
  CXXFLAGS+=" -fPIC -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
  cd "$_pkgname-$pkgver"
  CPPFLAGS="${CPPFLAGS} -I$PWD/depends/built/$CARCH-pc-linux-gnu/include"
  LDFLAGS="${LDFLAGS} -L${PWD}/depends/built/$CARCH-pc-linux-gnu/lib -L${PWD}/depends/built/$CARCH-pc-linux-gnu/lib64"
  ./autogen.sh
  ./configure --prefix=`pwd`/depends/$CARCH-pc-linux-gnu --with-incompatible-bdb --with-gui=qt5 --enable-tests=no --enable-hardening
  make
}

package() {
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/src/qt/dash-qt" "$pkgdir/usr/bin/dash-qt"
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/src/dashd" "$pkgdir/usr/bin/dashd"
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/src/dash-cli" "$pkgdir/usr/bin/dash-cli"
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/src/dash-tx" "$pkgdir/usr/bin/dash-tx"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "dash256.png" "$pkgdir/usr/share/pixmaps/dash256.png"
  install -D -m644 "dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop"
}
