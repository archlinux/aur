# Maintainer: charlie137 <slowdive@me.com>
# Contributor: charlie137 <slowdive@me.com>
# Based on PKGBUILD from dashcore maintained by pizzaman

pkgname='axecore'
pkgver=1.5.0.1
pkgrel=5
pkgdesc="Axe Core (AXE) is an open source cryptocurrency."
arch=('x86_64')
url="https://axerunners.com/"
license=('MIT')
depends=('qt5-base' 'boost' 'boost-libs' 'miniupnpc' 'protobuf' 'db4.8' 'zeromq' 'libevent' 'qrencode' 'libbacktrace-git')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'protobuf' 'qt5-tools')
provides=('axed' 'axe-qt' 'axe-cli' 'axe-tx')
source=('axe256.png'
  'axe-qt.desktop'
  'COPYING'
  "https://github.com/axerunners/axe/releases/download/v${pkgver}/${pkgname}-${pkgver}-$CARCH-linux-gnu.tar.gz"{,.asc})
sha256sums=('595802457042857d57d3437d4c904b524c250a06b8fa9c1f7f857ad3775bafab'
            'c6971f66cbbc7acb74885d35d5f7a9b42ada9a95e864f9c71e67d6f9e8264900'
            '9277abe7d3462deb49df07221f13643c2aa55ebc10725c0b9d6d82df8dd7b457'
            '7669039c7370c88d6f38e20838e9ab20ae9b3fefca0b658e3e65f3517bd8dd2d'
            'SKIP')
validpgpkeys=('04B29AF0DA5F8EBD019C74BA278F2A095AC27140')

prepare () {
  cd "$pkgname-$pkgver%.*"
 #deque patch 2020-02-12
 #inlcude deque.h library in httpserver.cpp found in https://github.com/dogecoin/dogecoin/pull/1626
 #will delete when axe fixes/commits this.
  patch --forward --strip=1 --input="../../deque.patch"
}

build() {
  CXXFLAGS+=" -fPIC -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
  cd "$pkgname-$pkgver%.*"
  CPPFLAGS="${CPPFLAGS} -I$PWD/depends/built/$CARCH-pc-linux-gnu/include"
  LDFLAGS="${LDFLAGS} -L${PWD}/depends/built/$CARCH-pc-linux-gnu/lib -L${PWD}/depends/built/$CARCH-pc-linux-gnu/lib64"
  ./autogen.sh
  ./configure --prefix=`pwd`/depends/$CARCH-pc-linux-gnu --with-incompatible-bdb --with-gui=qt5 --enable-tests=no --enable-hardening
  make
}

package() {
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/src/qt/axe-qt" "$pkgdir/usr/bin/axe-qt"
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/src/axed" "$pkgdir/usr/bin/axed"
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/src/axe-cli" "$pkgdir/usr/bin/axe-cli"
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/src/axe-tx" "$pkgdir/usr/bin/axe-tx"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "axe256.png" "$pkgdir/usr/share/pixmaps/axe256.png"
  install -D -m644 "axe-qt.desktop" "$pkgdir/usr/share/applications/axe-qt.desktop"
}
