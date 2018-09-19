# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>
# Contributor: mrypsilon

pkgbase=gridcoinresearch
pkgname=(gridcoinresearch-qt gridcoinresearchd)
pkgver=3.7.16.0
pkgrel=2
pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network"
makedepends=('boost' 'qt5-charts' 'qt5-tools' 'qrencode' 'db' 'icoutils')

arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research-$pkgver"

source=("$pkgbase-$pkgver.tar.gz::https://github.com/gridcoin/Gridcoin-Research/archive/$pkgver.tar.gz"
        'gridcoinresearch-qt.desktop')

sha256sums=('4309ccd75809dd034083c8f40983ce89b2436237afe388bab3d10af4e0936dd6'
            '1c547e531726d3172895683f9673379fc51639689989e49494aa0f40fc6cb053')

build() {
  cd "$srcdir/$_sourcename"

  ./autogen.sh
  mkdir -p build && cd build
  ../configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --disable-tests
  make DESTDIR="$srcdir/$_sourcename" install
}

package_gridcoinresearch-qt() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Qt GUI)"
  depends=('boost-libs' 'db' 'miniupnpc' 'qrencode' 'qt5-base' 'qt5-charts')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"
  install -Dm644 "${srcdir}/gridcoinresearch-qt.desktop" "$pkgdir/usr/share/applications/gridcoinresearch-qt.desktop"
  install -Dm644 doc/gridcoinresearch.1 "$pkgdir/usr/share/man/man1/gridcoinresearch.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd "$srcdir/$_sourcename/share/pixmaps"
  icotool -x bitcoin16.ico -o bitcoin16.png
  icotool -x bitcoin64.ico -o bitcoin64.png
  for size in 16 32 64 128 256; do
    install -D "bitcoin${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/gridcoinresearch.png"
  done
}

package_gridcoinresearchd() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Daemon/CLI)"
  depends=('boost-libs' 'db' 'miniupnpc')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')
  replaces=('gridcoinresearch-daemon')
  conflicts=('gridcoinresearch-daemon')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"
  install -Dm644 doc/gridcoinresearchd.1 "$pkgdir/usr/share/man/man1/gridcoinresearchd.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
