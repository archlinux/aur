# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoin-core
pkgver=0.11.0
pkgrel=1
pkgdesc="Bitcoin Core headless P2P node"
arch=('i686' 'x86_64')
url="https://bitcoin.org"
depends=('boost'
         'boost-libs'
         'miniupnpc'
         'openssl')
makedepends=('autoconf'
             'automake'
             'binutils'
             'expect'
             'gcc'
             'libtool'
             'make'
             'pkg-config'
             'yasm')
license=('MIT')
source=(${pkgname%-core}-$pkgver.tar.gz::https://codeload.github.com/bitcoin/bitcoin/tar.gz/v$pkgver
        bitcoin.conf
        bitcoin.logrotate
        bitcoin.service
        bitcoin-reindex.service)
sha256sums=('2bcd61a4c288e5cc5d7fbe724606c610a20037332b06f7a9e99c1153eef73aef'
            '67c464e4314ab5f7234a091098a05706989394086e4ee21e1d9155b9d1421796'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            '5e45f2ceaeb7bfa60aeb66ca4167068191eb4358af03f95ac70fd96d9b006349'
            '10ad0b8c356559886634eaf658992004045853ec26cddee143d16125cb75e8f1')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin.install

build() {
  cd "$srcdir/${pkgname%-core}-$pkgver"

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
    --with-gui=no \
    --disable-wallet \
    --with-gnu-ld
  make
}

package() {
  cd "$srcdir/${pkgname%-core}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-core}/COPYING"

  msg2 'Installing man pages...'
  install -Dm 644 contrib/debian/manpages/bitcoind.1 \
    "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm 644 contrib/debian/manpages/bitcoin-cli.1 \
    "$pkgdir/usr/share/man/man1/bitcoin-cli.1"
  install -Dm 644 contrib/debian/manpages/bitcoin.conf.5 \
    "$pkgdir/usr/share/man/man5/bitcoin.conf.5"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in \
    `find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n'` \
    release-notes; do
      cp -dpr --no-preserve=ownership doc/$_doc \
        "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  msg2 'Installing bitcoin...'
  make DESTDIR="$pkgdir" install

  msg2 'Installing bitcoin.conf...'
  install -Dm 600 "$srcdir/bitcoin.conf" "$pkgdir/etc/bitcoin/bitcoin.conf"

  msg2 'Installing bitcoin.service...'
  install -Dm 644 "$srcdir/bitcoin.service" \
    "$pkgdir/usr/lib/systemd/system/bitcoin.service"
  install -Dm 644 "$srcdir/bitcoin-reindex.service" \
    "$pkgdir/usr/lib/systemd/system/bitcoin-reindex.service"

  msg2 'Installing bitcoin.logrotate...'
  install -Dm 644 "$srcdir/bitcoin.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  msg2 'Installing bash completion...'
  install -Dm 644 contrib/bitcoind.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/bitcoind"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
