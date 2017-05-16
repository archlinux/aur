# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>

pkgname=gridcoinresearch-qt-git
pkgver=3.5.8.9.r850.1ddf6b8
pkgrel=1
pkgdesc="GridCoin is a cryptocurrency that helps science via BOINC - Qt"
depends=('boost-libs' 'qrencode' 'qt5-base' 'libzip' 'miniupnpc' 'curl' 'boinc')
makedepends=('boost' 'git' 'qt5-tools' 'qt5-charts' 'qrencode' 'db')

conflicts=('gridcoinresearch-qt')

arch=('i686' 'x86_64' 'armv7h')
url="http://gridcoin.us"
license=('custom:gridcoin')

_sourcename="${pkgname%-qt-git}"

source=('gridcoinresearch::git+https://github.com/gridcoin/Gridcoin-Research.git'
        'gridcoinresearch-qt.desktop'
        '0001-Openssl-1.1.0-185.patch')

sha256sums=('SKIP'
            '1c547e531726d3172895683f9673379fc51639689989e49494aa0f40fc6cb053'
            '6aec7fc3612444cdf5b837c82177268f29aba4f9b6bb4a8c47a7d6fca831b42c')

prepare() {
  cd "$srcdir/$_sourcename"
  patch -Np1 -i "$srcdir/0001-Openssl-1.1.0-185.patch"
}

pkgver() {
  cd "$srcdir/$_sourcename"

  printf "%s.r%s.%s" \
    "$(grep CLIENT_VERSION src/clientversion.h | awk '{print $NF}' | sed ':a;N;$!ba;s/\n/./g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_sourcename"

  qmake USE_QRCODE=1 USE_UPNP=1 NO_UPGRADE=1
  make
}

package() {
  cd "$srcdir/$_sourcename"

  install -Dm755 gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"
  install -Dm644 "${srcdir}/gridcoinresearch-qt.desktop" "$pkgdir/usr/share/applications/gridcoinresearch-qt.desktop"
  install -Dm644 share/pixmaps/grc-small.png "$pkgdir/usr/share/pixmaps/grc-small.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

