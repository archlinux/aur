# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoinxt-git
pkgver=20151207
pkgrel=3
pkgdesc="BitcoinXT headless P2P node"
arch=('i686' 'x86_64')
url="https://github.com/bitcoinxt/bitcoinxt"
depends=('boost'
         'boost-libs'
         'curl'
         'miniupnpc'
         'openssl')
makedepends=('autoconf'
             'automake'
             'binutils'
             'expect'
             'gcc'
             'git'
             'libtool'
             'make'
             'pkg-config')
license=('MIT')
source=(git+https://github.com/bitcoinxt/bitcoinxt
        bitcoin.conf
        bitcoin.logrotate
        bitcoin.service
        bitcoin-reindex.service)
sha256sums=('SKIP'
            '67c464e4314ab5f7234a091098a05706989394086e4ee21e1d9155b9d1421796'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            '5e45f2ceaeb7bfa60aeb66ca4167068191eb4358af03f95ac70fd96d9b006349'
            '10ad0b8c356559886634eaf658992004045853ec26cddee143d16125cb75e8f1')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin.install

pkgver() {
  cd ${pkgname%%-*}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "${pkgname%%-*}"

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
  cd "${pkgname%%-*}"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%%-*}"

  msg2 'Installing man pages...'
  install -Dm 644 contrib/debian/manpages/bitcoind.1 \
    -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 contrib/debian/manpages/bitcoin-cli.1 \
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

  msg2 'Installing bitcoin.conf...'
  install -Dm 600 "$srcdir/bitcoin.conf" -t "$pkgdir/etc/bitcoin"

  msg2 'Installing bitcoin.service...'
  install -Dm 644 "$srcdir/bitcoin.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bitcoin-reindex.service" \
    -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing bitcoin.logrotate...'
  install -Dm 644 "$srcdir/bitcoin.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  msg2 'Installing bash completion...'
  install -Dm 644 contrib/bitcoind.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/bitcoind"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
