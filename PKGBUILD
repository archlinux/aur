# Maintainer: Miguel Palencia <mike@qtum.org>

pkgname=qtum-core
pkgver=0.17.2
pkgrel=1
pkgdesc="Builds Qtum Core from source, with qtumd, qtum-cli and qtum-qt"
arch=('x86_64')
url="https://qtum.org"
depends=('boost-libs' 'libevent' 'desktop-file-utils' 'qt5-base' 'protobuf' 'openssl' 'miniupnpc' 'zeromq' 'qrencode')
makedepends=('boost' 'qt5-tools' 'miniupnpc' 'qrencode' 'zeromq')
license=('MIT')
source=(https://github.com/qtumproject/qtum/archive/mainnet-ignition-v$pkgver.tar.gz)
sha256sums=('e4899740ae73759796d7769c4631f8d075c1c3eccab58dd6090f14ea539225a9')
provides=('qtum-cli' 'qtum-daemon' 'qtum-tx' 'qtum-qt')
conflicts=('qtum-cli' 'qtum-daemon' 'qtum-tx' 'qtum-qt')


build() {
  cd "$srcdir/qtum-mainnet-ignition-v$pkgver/"
  git clone https://github.com/qtumproject/cpp-eth-qtum.git src/cpp-ethereum
  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr/ \
    --with-incompatible-bdb \

  make
}


package() {
  cd "$srcdir/qtum-mainnet-ignition-v$pkgver"
 msg2 'Fixing btc references...'
  sed -i -e 's/Bitcoin/Qtum/g' contrib/debian/qtum-qt.desktop
  
  msg2 'Installing wallet...'
  install -Dm755 src/qt/qtum-qt "$pkgdir"/usr/bin/qtum-qt
  install -Dm644 contrib/debian/qtum-qt.desktop \
    "$pkgdir"/usr/share/applications/qtum.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/qtum128.png

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"

  msg2 'Installing man pages...'
  install -Dm 644 doc/man/*.1 -t "$pkgdir/usr/share/man/man1"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/qtum"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes.md; do
      cp -dpr --no-preserve=ownership "doc/$_doc" \
        "$pkgdir/usr/share/doc/qtum/$_doc"

  msg2 'Installing essential directories'
  install -dm 700 "$pkgdir/etc/qtum"
  install -dm 755 "$pkgdir/srv/qtum"

  msg2 'Installing qtum...'
  make DESTDIR="$pkgdir" install

  done
}



