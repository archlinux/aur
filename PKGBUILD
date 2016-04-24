# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>

pkgbase=gridcoinresearch
pkgname=('gridcoinresearch-daemon' 'gridcoinresearch-qt')
pkgver=3.5.6.3
pkgrel=1
pkgdesc="Gridcoin P2P Cryptocurrency"
arch=('i686' 'x86_64')
url="http://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research-$pkgver"

makedepends=('boost' 'qt5-base' 'qt5-tools' 'openssl' 'libzip' 'qrencode' 'db' 'curl'
             'miniupnpc')
source=("gridcoinresearch-${pkgver}.tar.gz::https://github.com/gridcoin/Gridcoin-Research/archive/${pkgver}.tar.gz"
        'gridcoinresearch-qt.desktop')

sha256sums=('c602c54f942d13885f0046290b1c3120efae83107c638036433243e946af5d01'
          '1c547e531726d3172895683f9673379fc51639689989e49494aa0f40fc6cb053')

prepare() {
  cd "$srcdir/$_sourcename"

  mkdir -p src/obj

  chmod 755 src/leveldb/build_detect_platform
}

build() {
  cd "$srcdir/$_sourcename"

  cd src

  make ${MAKEFLAGS} -f makefile.unix DEBUGFLAGS="" USE_UPNP=1

  cd ..

  qmake "USE_QRCODE=1 USE_UPNP=1 NO_UPGRADE=1"
  make ${MAKEFLAGS}
}

package_gridcoinresearch-daemon() {
  pkgdesc="GridCoin is a PoS-based cryptocurrency - Daemon"
  depends=('boost-libs' 'libzip' 'miniupnpc' 'curl' 'boinc')
  install=gridcoin.install

  cd "$srcdir/$_sourcename/src"
  install -Dm755 gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearch-qt() {
  pkgdesc="GridCoin is a PoS-based cryptocurrency - Qt"
  depends=('boost-libs' 'qrencode' 'qt5-base' 'libzip' 'miniupnpc' 'curl' 'boinc')
  install=gridcoin.install

  cd "$srcdir/$_sourcename"
  install -Dm755 gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"

  install -Dm644 "${srcdir}/gridcoinresearch-qt.desktop" "$pkgdir/usr/share/applications/gridcoinresearch-qt.desktop"

  install -Dm644 share/pixmaps/grc-small.png "$pkgdir/usr/share/pixmaps/grc-small.png"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

