# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoin-headless-addrindex
pkgver=0.12.1
pkgrel=1
pkgdesc="Bitcoin Core headless P2P wallet with addrindex"
arch=('i686' 'x86_64')
url="https://github.com/btcdrak/bitcoin"
depends=('boost'
         'boost-libs'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'binutils'
             'libtool'
             'm4'
             'make'
             'pkg-config')
optdepends=('miniupnpc: build with support for UPnP')
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/btcdrak/${pkgname%%-*}/tar.gz/v$pkgver-addrindex)
sha256sums=('454d8780089428cb28e18ad0fde9235557d125a2c3469f1b054a674314ef5b89')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx')

build() {
  cd "$srcdir/${pkgname%%-*}-$pkgver-addrindex"

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
    --with-gui=no \
    --with-incompatible-bdb \
    --with-gnu-ld
  make
}

package() {
  cd "$srcdir/${pkgname%%-*}-$pkgver-addrindex"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%%-*}"

  msg2 'Installing man pages...'
  install -Dm 644 contrib/debian/manpages/bitcoind.1 \
    -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 contrib/debian/manpages/bitcoin.conf.5 \
    -t "$pkgdir/usr/share/man/man5"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes; do
      cp -dpr --no-preserve=ownership doc/$_doc \
        "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  msg2 'Installing bitcoin...'
  make DESTDIR="$pkgdir" install

  msg2 'Installing bash completion...'
  install -Dm 644 contrib/bitcoind.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/bitcoind"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
