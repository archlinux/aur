# Maintainer: metscoin <mets_coin@outlook.com>
# shellcheck disable=SC2034

pkgname=lux-qt
pkgver=5.2.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://luxcore.io/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=('boost-libs' 'qt5-base' 'db4.8' 'protobuf' 'libevent' 'openssl-1.0')
optdepends=('miniupnpc: Automatic UPnP port mapping' 'qrencode: For generating QR codes within the GUI' 'zeromq: Send notifications via zeromq')
makedepends=(boost qt5-tools)
provides=('lux-qt' 'luxd' 'lux-tx')
conflicts=('luxcoin' 'luxcore')
install=lux-qt.install
source=("${pkgname%-git}::git+https://github.com/LUX-Core/lux.git#tag=v${pkgver}"
        "$pkgname.desktop"
        "lux.patch")
sha256sums=('SKIP'
            '546ae8129ffd9a1e0b639441e38e97088439a33e204023963dfd771fe9cb756a'
            '2bbe1e79623fdf5d352f736e8844233c0b5ff2975b6e00bb27933253a2dde4b1')

prepare() {
   cd "$srcdir/$pkgname" || exit
   patch -p1 -i "../lux.patch" 
}

build() {
  cd "$srcdir/$pkgname" || exit
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  export PKG_CONFIG_PATH="/usr/lib/openssl-1.0/pkgconfig"
  export CXXFLAGS+=" -I/usr/include/openssl-1.0"
  export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl"
  ./autogen.sh
  ./configure --prefix=/usr --with-pic --disable-shared --enable-cxx \
        --disable-bench --disable-tests
  make ${MAKEFLAGS}
}

package() {
  install -Dm644 lux-qt.desktop "$pkgdir"/usr/share/applications/lux.desktop
  cd "$srcdir/$pkgname" || exit
  #install -Dm755 src/qt/lux-qt "$pkgdir"/usr/bin/lux-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/lux128.png
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="${pkgdir}" install
}
