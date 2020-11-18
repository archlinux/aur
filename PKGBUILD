# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m AT riseup DOT net>
# WARNING: Use the `dashcore` package instead of this one unless you know what
# you are doing. The `dashcore` package provides the official, supported, tested,
# stable, precompiled build. This package provides the development, unstable,
# untested, and therefore possibly broken build. Use at your own risk.

pkgname='dashcore-git'
_gitname='dash'
_gitbranch='master'
pkgver=v0.16.1.1.r0.g43d2973a0e
pkgrel=1
arch=('x86_64')
url="https://github.com/dashpay/dash"
depends=('qt5-base' 'boost' 'boost-libs' 'miniupnpc' 'protobuf' 'db4.8' 'zeromq' 'libevent' 'qrencode' 'libbacktrace-git')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'git' 'qt5-tools' 'python3' 'cmake' 'codablock-bls-signatures')
license=('MIT')
pkgdesc="Dash Core (DASH, Dashpay, formerly Darkcoin) is an open source, privacy-centric digital currency. (Includes the qt-client, the headless daemon and the command-line tool). WARNING: Unstable, development version."
provides=('dash-daemon' 'dash-qt' 'dash-cli')
conflicts=('dashcore' 'dashcore-bin' 'dash-cli' 'dash-qt' 'dash-daemon')
source=('deque.patch'
        'qpainterpath.patch::https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690.patch'
        "git://github.com/dashpay/dash.git")
sha512sums=('87c8fbe782a66222fd1121d61bde967d89e6ddda2f1a4dfc7f17eabfce1502ce172af13f52d94d752464ee125fa69d9b423f495baa52bde1fe02e4762aa889d5'
            '1eda9a1d5616a0602f85b0d04838657fe5fa75746a2da7a4614124e6081eeb1997e845d61a7d7a9a52a9d5ef9215617205924811cfef32132bf7fce9c3c603fb'
            'SKIP')

prepare () {
  cd "$_gitname"
  git pull origin v0.16.x
 #deque patch 2020-02-12 == http: add missing header bootlegged by boost < 1.72
 #inlcude deque library in src/httpserver.cpp found in https://github.com/bitcoin/bitcoin/commit/a5929130223973636f3fd25fbfaf2953f2ec96a9 and #inlcude deque.h library in httpserver.cpp found in https://github.com/dogecoin/dogecoin/pull/1626
 #will delete when dash fixes/commits this. 
  patch --forward --strip=1 --input="../../deque.patch"

 #QPainterPath 2020-10-12 == Add missing QPainterPath include
 #include QPainterPath library in src/qt/trafficgraphwidget.cpp found in https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690
 #will delete when dash fixes/commits this. This happens because dash is compiling against older versions of qt5-base
  patch --forward --strip=1 --input="../../qpainterpath.patch"
}

pkgver() {
  cd "$_gitname"
( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  CXXFLAGS+=" -fPIC -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
  cd "$_gitname"
  CPPFLAGS="${CPPFLAGS} -I$PWD/depends/built/$CARCH-pc-linux-gnu/include"
  LDFLAGS="${LDFLAGS} -L${PWD}/depends/built/$CARCH-pc-linux-gnu/lib -L${PWD}/depends/built/$CARCH-pc-linux-gnu/lib64"
  ./autogen.sh
  ./configure --prefix=`pwd`/depends/$CARCH-pc-linux-gnu --with-incompatible-bdb --with-gui=qt5 --enable-tests=no --enable-hardening
  make
}

package() {
  install -D -m755 "$srcdir/$_gitname/src/qt/dash-qt" "$pkgdir/usr/bin/dash-qt"
  install -D -m755 "$srcdir/$_gitname/src/dashd" "$pkgdir/usr/bin/dashd"
  install -D -m755 "$srcdir/$_gitname/src/dash-cli" "$pkgdir/usr/bin/dash-cli"
  install -D -m755 "$srcdir/$_gitname/src/dash-tx" "$pkgdir/usr/bin/dash-tx"
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "$srcdir/$_gitname/share/pixmaps/dash128.png" "$pkgdir/usr/share/pixmaps/dash128.png"
  install -D -m644 "$srcdir/$_gitname/contrib/debian/dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop"
}
