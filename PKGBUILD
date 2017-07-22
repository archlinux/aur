# Maintainer: tuxayo <victor àt tuxayo dôt net>
# Contributor: redfish <redfish at galactica.pw>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: André Vitor de Lima Matos <andre.vmatos at gmail.com>

pkgname=bitcoind-unlimited-git
_pkgbase=BitcoinUnlimited
pkgver=1.0.3.0.r1124.g21a81e275
# ↓to be used in pkgver() when we need version without git revision
upstream_release_version=1.0.3.0
pkgrel=1
pkgdesc="Bitcoin Unlimited versions of bitcoind, bitcoin-cli, and bitcoin-tx"
arch=('i686' 'x86_64' 'armv7h')
url="https://www.bitcoinunlimited.info"
depends=('boost'
         'boost-libs'
         'miniupnpc'
         'openssl-1.0')
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
source=(git+https://github.com/BitcoinUnlimited/BitcoinUnlimited.git#branch=release
        bitcoin.conf
        bitcoin.logrotate)
sha256sums=('SKIP'
            '938f4265e238cbc038ebee9cb93076a8ba0ae94708ac7b7379385b1f8d019676'
            '7bf4bdad419c1ee30b88c7e4190707c5ff250da8b23d68d5adf14043f8e2ac73')
sha512sums=('SKIP'
            'd4a1943db156b463063605575c353465fb9ab3fc213e76d290f2a10f91412a3c0001f0217ef372fa36e927df0ff68a2f4a920906a382c208ec0b314283c894a9'
            'ec2a33c546e60d14249652de0249352bbda57ee4b293715b3eaf7d37c0e9a904894dddb02ad63cad2780510fb9866fdc6421a5ed15649f63967eaae5cbb59f3b')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin' 'bitcoin-unlimited' 'bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin' 'bitcoin-unlimited' 'bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt'
           'bitcoin-tx')
install=bitcoin.install

pkgver() {
  cd "$srcdir/$_pkgbase"

  # The latest version was not tagged, so throw away the version we get
  # from the top-most tag, but keep, the commit hash
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  git describe --long | sed "s/^v[^-]\+-\([0-9]\+\)/$upstream_release_version.r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$_pkgbase"

  export CXXFLAGS+=" -I/usr/include/openssl-1.0"
  export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl -lcrypto"

  export SSL_CFLAGS="-I/usr/include/openssl-1.0"
  export SSL_LIBS="-L/usr/lib/openssl-1.0 -lssl -lcrypto"

  export CRYPTO_CFLAGS="-I/usr/include/openssl-1.0"
  export CRYPTO_LIBS="-L/usr/lib/openssl-1.0 -lssl -lcrypto"

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
  cd "$srcdir/$_pkgbase"

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
