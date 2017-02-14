# Maintainer: GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m AT riseup DOT net>

pkgname='dashcore-git'
_gitname='dash'
_gitbranch='master'
pkgver=13279.56971f8da
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.dash.org/"
depends=('qt5-base' 'boost' 'boost-libs' 'miniupnpc' 'openssl')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'git' 'qrencode' 'automoc4' 'protobuf' 'qt5-tools')
license=('MIT')
pkgdesc="Dash Core (DASH, Dashpay, formerly Darkcoin) is an open source, privacy-centric digital currency. (Includes the qt-client, the headless daemon and the command-line tool.)"
provides=('dashd' 'dash-qt' 'dash-cli')
conflicts=('dashcore')
source=("git://github.com/dashpay/dash.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git checkout "$_gitbranch" -q
  git pull -q
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  CXXFLAGS+=" -fPIE -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
  cd "$srcdir/$_gitname"
  git checkout "$_gitbranch"
  git pull

  ./autogen.sh
  ./configure --with-incompatible-bdb --with-gui=qt5 --enable-tests=no
  make
}

package() {
  install -D -m755 "$srcdir/$_gitname/src/qt/dash-qt" "$pkgdir/usr/bin/dash-qt"
  install -D -m755 "$srcdir/$_gitname/src/dashd" "$pkgdir/usr/bin/dashd"
  install -D -m755 "$srcdir/$_gitname/src/dash-cli" "$pkgdir/usr/bin/dash-cli"
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "$srcdir/$_gitname/share/pixmaps/dash128.png" "$pkgdir/usr/share/pixmaps/dash128.png"
  install -D -m644 "$srcdir/$_gitname/contrib/debian/dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop"
}
