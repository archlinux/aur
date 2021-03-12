# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>
# Contributor: mrypsilon

pkgbase=gridcoinresearch
pkgname=(gridcoinresearch-qt gridcoinresearchd)
pkgver=5.2.1.0
pkgrel=1
pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network"
makedepends=('boost' 'qt5-charts' 'qt5-tools' 'qrencode')
depends=('db' 'libzip')

arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research-$pkgver"

source=("$pkgbase-$pkgver.tar.gz::https://github.com/gridcoin/Gridcoin-Research/archive/$pkgver.tar.gz")

sha256sums=('565bbebf6ba0c67794cd8bf2d01c8ccb6e8c917200c14744a87abda395f2c2e1')

# leaving in case needed for future patches
#prepare() {
#    cd "$srcdir/$_sourcename"
#    patch --strip=1 --input="../trafficgraphwidget.cpp.patch"
#}

build() {
  cd "$srcdir/$_sourcename"

  ./autogen.sh
  mkdir -p build && cd build
  ../configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --disable-tests
  make DESTDIR="$srcdir/$_sourcename" install
}

package_gridcoinresearch-qt() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Qt GUI)"
  depends=('boost-libs' 'miniupnpc' 'qrencode' 'qt5-base' 'qt5-charts' 'qt5-svg')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"
  cp -r ${srcdir}/${_sourcename}/usr/share ${pkgdir}/usr/share/
  install -Dm644 doc/gridcoinresearch.1 "$pkgdir/usr/share/man/man1/gridcoinresearch.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearchd() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Daemon/CLI)"
  depends=('boost-libs' 'miniupnpc')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')
  replaces=('gridcoinresearch-daemon')
  conflicts=('gridcoinresearch-daemon')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"
  install -Dm644 doc/gridcoinresearchd.1 "$pkgdir/usr/share/man/man1/gridcoinresearchd.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
