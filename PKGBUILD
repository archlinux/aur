# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>
# Contributor: mrypsilon

pkgbase=gridcoinresearch
pkgname=(gridcoinresearch-qt gridcoinresearchd)
pkgver=5.4.5.0
pkgrel=1
pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network"
makedepends=('boost' 'qt5-charts' 'qt5-tools' 'qrencode')
depends=('db5.3' 'libzip')

arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gridcoin.us"
license=('MIT')

_sourcename="Gridcoin-Research-$pkgver"

source=("$pkgbase-$pkgver.tar.gz::https://github.com/gridcoin-community/Gridcoin-Research/archive/$pkgver.tar.gz")

sha256sums=('e25461523e28dd812c8dcb094c0661c0868b07f6478fb578bcf15f811b3f45ee')

# leaving in case needed for future patches
#prepare() {
#    cd "$srcdir/$_sourcename"
#    patch --strip=1 --input="../trafficgraphwidget.cpp.patch"
#}

build() {
  cd "$srcdir/$_sourcename"

  ./autogen.sh
  mkdir -p build && cd build
  #BDB_LIBS="-ldb_cxx-5.3" BDB_CFLAGS="-I/usr/include/db5.3" ../configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb
  ../configure --prefix=/usr --with-gui=qt5
  make DESTDIR="$srcdir/$_sourcename" install
}

check() {
  cd "$srcdir/$_sourcename/build"
  make check
}

package_gridcoinresearch-qt() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Qt GUI)"
  depends=('libzip' 'boost-libs' 'miniupnpc' 'qrencode' 'qt5-base' 'qt5-charts' 'qt5-svg')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"
  install -Dm644 usr/share/applications/gridcoinresearch.desktop "$pkgdir/usr/share/applications/gridcoinresearch.desktop"
  cp -r usr/share/icons "$pkgdir/usr/share/icons"
  install -Dm644 doc/gridcoinresearch.1 "$pkgdir/usr/share/man/man1/gridcoinresearch.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearchd() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Daemon/CLI)"
  depends=('libzip' 'boost-libs' 'miniupnpc')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')
  replaces=('gridcoinresearch-daemon')
  conflicts=('gridcoinresearch-daemon')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"
  install -Dm644 doc/gridcoinresearchd.1 "$pkgdir/usr/share/man/man1/gridcoinresearchd.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
