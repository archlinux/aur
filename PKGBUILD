# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>

pkgbase=gridcoinresearch-git
pkgname=('gridcoinresearch-daemon-git' 'gridcoinresearch-qt-git')
pkgver=3.5.6.3.r673.ce93f74
pkgrel=2
pkgdesc="Gridcoin P2P Cryptocurrency"
arch=('i686' 'x86_64')
url="http://gridcoin.us"
license=('custom:gridcoin')
makedepends=('boost' 'git' 'qt5-base' 'qt5-tools' 'openssl' 'libzip' 'qrencode' 'db' 'curl'
             'miniupnpc')
source=('gridcoinresearch::git+https://github.com/gridcoin/Gridcoin-Research.git'
        'gridcoinresearch-qt.desktop')

sha256sums=('SKIP'
          '1c547e531726d3172895683f9673379fc51639689989e49494aa0f40fc6cb053')

pkgver() {
  cd "$srcdir/${pkgbase%-git}"

  printf "%s.r%s.%s" \
    "$(grep CLIENT_VERSION src/clientversion.h | awk '{print $NF}' | sed ':a;N;$!ba;s/\n/./g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgbase%-git}"

  mkdir -p src/obj

  chmod 755 src/leveldb/build_detect_platform
}

build() {
  cd "$srcdir/${pkgbase%-git}"

  cd src

  make ${MAKEFLAGS} -f makefile.unix DEBUGFLAGS="" USE_UPNP=1

  cd ..

  qmake "USE_QRCODE=1" "USE_UPNP=1" "NO_UPGRADE=1"
  make ${MAKEFLAGS}
}

package_gridcoinresearch-daemon-git() {
  pkgdesc="GridCoin is a PoS-based cryptocurrency - Daemon"
  depends=('boost-libs' 'libzip' 'miniupnpc' 'curl' 'boinc')
  conflicts=('gridcoinresearch-daemon')
  install=gridcoin.install

  cd "$srcdir/${pkgbase%-git}/src"
  install -Dm755 gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearch-qt-git() {
  pkgdesc="GridCoin is a PoS-based cryptocurrency - Qt"
  depends=('boost-libs' 'qrencode' 'qt5-base' 'libzip' 'miniupnpc' 'curl' 'boinc')
  conflicts=('gridcoinresearch-qt')
  install=gridcoin.install

  cd "$srcdir/${pkgbase%-git}"
  install -Dm755 gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"

  install -Dm644 "${srcdir}/gridcoinresearch-qt.desktop" "$pkgdir/usr/share/applications/gridcoinresearch-qt.desktop"

  install -Dm644 share/pixmaps/grc-small.png "$pkgdir/usr/share/pixmaps/grc-small.png"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

