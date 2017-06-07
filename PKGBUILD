# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoin-qt-addrindex
pkgver=0.13.2
pkgrel=4
pkgdesc="Bitcoin Core GUI P2P wallet with addrindex"
arch=('i686' 'x86_64')
url="https://github.com/btcdrak/bitcoin"
depends=('boost'
         'boost-libs'
         'protobuf'
         'qrencode'
         'qt4'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'binutils'
             'gettext'
             'libtool'
             'm4'
             'make'
             'pkg-config')
optdepends=('miniupnpc: build with support for UPnP')
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/btcdrak/bitcoin/releases/download/v0.13.2-addrindex/bitcoin-$pkgver-addrindex.tar.gz)
sha256sums=('a580510f8e2d020a751f0a16223f21b1e149768c28e73ee5b4692df46710c923')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx')

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

build() {
  cd "$srcdir/${pkgname%%-*}-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/bitcoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/bitcoin \
    --localstatedir=/var/lib/bitcoin \
    --enable-hardening \
    --enable-wallet \
    --with-gui=qt4 \
    --with-incompatible-bdb \
    --with-gnu-ld
  make -j$_nproc
}

check() {
  cd "$srcdir/${pkgname%%-*}-$pkgver"

  msg2 'Testing...'
  make -j$_nproc check
}

package() {
  cd "$srcdir/${pkgname%%-*}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%%-*}"

  # code commented out is missing from 0.13.2-addrindex release

  # msg2 'Installing man pages...'
  # install -Dm 644 contrib/debian/manpages/*.1 -t "$pkgdir/usr/share/man/man1"
  # install -Dm 644 contrib/debian/manpages/*.5 -t "$pkgdir/usr/share/man/man5"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes; do
      cp -dpr --no-preserve=ownership "doc/$_doc" \
        "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  msg2 'Installing bitcoin...'
  make DESTDIR="$pkgdir" install

  # msg2 'Installing desktop files...'
  # install -Dm 644 contrib/debian/bitcoin-qt.desktop \
  #   "$pkgdir/usr/share/applications/bitcoin.desktop"
  # for _pixmap in bitcoin16.png \
  #                bitcoin16.xpm \
  #                bitcoin32.png \
  #                bitcoin32.xpm \
  #                bitcoin64.png \
  #                bitcoin64.xpm \
  #                bitcoin128.png \
  #                bitcoin128.xpm \
  #                bitcoin256.png \
  #                bitcoin256.xpm; do
  #   install -Dm 644 "share/pixmaps/$_pixmap" -t "$pkgdir/usr/share/pixmaps"
  # done

  # msg2 'Installing bash completion...'
  # for _compl in bitcoin-cli bitcoin-tx bitcoind; do
  #   install -Dm 644 "contrib/${_compl}.bash-completion" \
  #     "$pkgdir/usr/share/bash-completion/completions/$_compl"
  # done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
