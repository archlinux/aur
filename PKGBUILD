# Maintainer: charlie137 <slowdive@me.com>
# Contributor: charlie137 <slowdive@me.com>
# Based on PKGBUILD from dashcore maintained by pizzaman

pkgname='axecore'
_pkgname='axe'
pkgver=1.5.0.1
pkgrel=8
pkgdesc="Axe Core (AXE) is an open source cryptocurrency."
arch=('x86_64')
url="https://axerunners.com/"
license=('MIT')
depends=('qt5-base' 'boost' 'boost-libs' 'miniupnpc' 'protobuf' 'db4.8' 'zeromq' 'libevent' 'qrencode' 'libbacktrace-git')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'qt5-tools' 'codablock-bls-signatures')
provides=('axe-daemon' 'axe-qt' 'axe-cli')
conflicts=('axecore-git' 'axecore-bin' 'axe-cli' 'axe-qt' 'axe-daemon')
source=('axe256.png'
        'axe-qt.desktop'
        'deque.patch'
        'https://github.com/axerunners/axe/blob/master/COPYING'
        "https://github.com/axerunners/axe/archive/v${pkgver}.tar.gz")
sha256sums=('595802457042857d57d3437d4c904b524c250a06b8fa9c1f7f857ad3775bafab'
            'c6971f66cbbc7acb74885d35d5f7a9b42ada9a95e864f9c71e67d6f9e8264900'
            'ded0b32ec96d8cbe996557d57c1c31583d30567377d3e9a0c3168f0aec3c817e'
            '828c49a2a7f37e81efd8e6f2a40f073f05f391e6d8d7e3a23910b220ae0809eb'
            '7669039c7370c88d6f38e20838e9ab20ae9b3fefca0b658e3e65f3517bd8dd2d')

prepare () {
  cd "$_pkgname-$pkgver"
 #deque patch 2020-02-12
 #inlcude deque.h library in httpserver.cpp found in https://github.com/dogecoin/dogecoin/pull/1626
 #will delete when axe fixes/commits this.
  patch --forward --strip=1 --input="../../deque.patch"
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
