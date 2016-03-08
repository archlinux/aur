# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoind-classic-git
pkgver=v0.12.0cl1.r2.gd10f990
pkgrel=1
pkgdesc="Bitcoin Classic versions of bitcoind, bitcoin-cli, and bitcoin-tx"
arch=('any')
url="https://bitcoinclassic.com/"
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
source=('git+https://github.com/bitcoinclassic/bitcoinclassic.git#branch=0.12'
        bitcoin.logrotate)
sha256sums=('SKIP'
            '7bf4bdad419c1ee30b88c7e4190707c5ff250da8b23d68d5adf14043f8e2ac73')
sha512sums=('SKIP'
            'ec2a33c546e60d14249652de0249352bbda57ee4b293715b3eaf7d37c0e9a904894dddb02ad63cad2780510fb9866fdc6421a5ed15649f63967eaae5cbb59f3b')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin' 'bitcoin-classic' 'bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin' 'bitcoin-classic' 'bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt'
           'bitcoin-tx')
install=bitcoin.install

pkgver() {
  cd "$srcdir/bitcoinclassic"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/bitcoinclassic"

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
    --with-gnu-ld \
    --with-incompatible-bdb
  make
}

package() {
  cd "$srcdir/bitcoinclassic"

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
  rm $pkgdir/usr/bin/*_bitcoin

  msg2 'Installing bitcoin.conf...'
  # Install bitcoin.conf is one does not already exist
  [[ ! -e "/etc/bitcoin/bitcoin.conf" ]] && install -Dm 600 \
  "$srcdir/bitcoinclassic/contrib/debian/examples/bitcoin.conf" -t "$pkgdir/etc/bitcoin"
  # Password generating python script for rpcauth
  install -Dm 755 "$srcdir/bitcoinclassic/share/rpcuser/rpcuser.py" \
               -t "$pkgdir/etc/bitcoin"

  msg2 'Installing bitcoin.service...'
  install -Dm 644 "$srcdir/bitcoinclassic/contrib/init/bitcoind.service" \
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
