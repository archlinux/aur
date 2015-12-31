# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoind-unlimited-git
pkgver=20151227.bffc279
pkgrel=1
pkgdesc="Bitcoin Unlimited versions of bitcoind, bitcoin-cli, and bitcoin-tx"
arch=('i686' 'x86_64')
url="http://www.bitcoinunlimited.info/software"
depends=('boost'
         'boost-libs'
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
source=(git+https://github.com/gandrewstone/BitcoinUnlimited.git#branch=0.11cfg_stats
        bitcoin.conf
        bitcoin.logrotate)
sha256sums=('SKIP'
            '00362da5b6c9ab3dd19b195751eb0f54bdb796d7b4bc825cb9be4ea0261c22b8'
            '7bf4bdad419c1ee30b88c7e4190707c5ff250da8b23d68d5adf14043f8e2ac73')
sha512sums=('SKIP'
            'f26ca0c80e78f650a52840e52217a93fcbe1f61546f0dc7aa0cab11adb7448d28b01bca7a37ccbfd7d4f6ca37aae34470d309cd884854c1cc95b66e9f9bf3952'
            'ec2a33c546e60d14249652de0249352bbda57ee4b293715b3eaf7d37c0e9a904894dddb02ad63cad2780510fb9866fdc6421a5ed15649f63967eaae5cbb59f3b')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin' 'bitcoin-unlimited' 'bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin' 'bitcoin-unlimited' 'bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt'
           'bitcoin-tx')
install=bitcoin.install

pkgver() {
	cd "$srcdir/BitcoinUnlimited"
  git log -1 --date=short --format="%cd.%h" | sed "s|-||g"
}

build() {
	cd "$srcdir/BitcoinUnlimited"

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
    --with-gnu-ld
  make
}

package() {
	cd "$srcdir/BitcoinUnlimited"

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
  install -Dm 644 "$srcdir/BitcoinUnlimited/contrib/init/bitcoind.service" \
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
