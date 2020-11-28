# Maintainer: charlie137 <slowdive@me.com>
# Contributor: charlie137 <slowdive@me.com>
# Based on PKGBUILD from dashcore maintained by pizzaman

pkgname='axecore'
_pkgname='axe'
pkgver=1.6.1.1
pkgrel=3
pkgdesc="Axe Core (AXE) is an open source cryptocurrency."
arch=('x86_64')
url="https://axerunners.com/"
license=('MIT')
depends=('qt5-base' 'boost' 'boost-libs' 'miniupnpc' 'protobuf' 'db4.8' 'zeromq' 'libevent' 'qrencode' 'libbacktrace-git')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'qt5-tools' 'codablock-bls-signatures')
provides=('axe-daemon' 'axe-qt' 'axe-cli')
source=('axe256.png'
        'axe-qt.desktop'
        'deque.patch'
        'qpainterpath.patch::https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690.patch'
        'https://github.com/axerunners/axe/blob/master/COPYING'
        "https://github.com/axerunners/axe/archive/v${pkgver}.tar.gz")
sha256sums=('595802457042857d57d3437d4c904b524c250a06b8fa9c1f7f857ad3775bafab'
            'c6971f66cbbc7acb74885d35d5f7a9b42ada9a95e864f9c71e67d6f9e8264900'
            'ded0b32ec96d8cbe996557d57c1c31583d30567377d3e9a0c3168f0aec3c817e'
            '475b6c0e7bc8d797020bdfc048a6b66e0513482fd469d6da2a599d3811f81f52'
            'acda80199188113b714b8954994f6b1650e2ee175e146f846e02c169f7dc56d5'
            '77b9ee10cc426fe7c4ed3745c4315fb36ce36c841303dbcebac4b6bcd605ee3b')

prepare () {
  cd "$_pkgname-$pkgver"
 #deque patch 2020-02-12 == http: add missing header bootlegged by boost < 1.72
 #inlcude deque library in src/httpserver.cpp found in https://github.com/bitcoin/bitcoin/commit/a5929130223973636f3fd25fbfaf2953f2ec96a9 and #inlcude deque.h library in httpserver.cpp found in https://github.com/dogecoin/dogecoin/pull/1626
 #will delete when axe fixes/commits this.
  patch --forward --strip=1 --input="../../deque.patch"

 #QPainterPath 2020-10-12 == Add missing QPainterPath include
 #include QPainterPath library in src/qt/trafficgraphwidget.cpp found in https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690
 #will delete when axe fixes/commits this. This happens because axe is compiling against older versions of qt5-base
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
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/src/qt/axe-qt" "$pkgdir/usr/bin/axe-qt"
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/src/axed" "$pkgdir/usr/bin/axed"
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/src/axe-cli" "$pkgdir/usr/bin/axe-cli"
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/src/axe-tx" "$pkgdir/usr/bin/axe-tx"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "axe256.png" "$pkgdir/usr/share/pixmaps/axe256.png"
  install -D -m644 "axe-qt.desktop" "$pkgdir/usr/share/applications/axe-qt.desktop"
}
