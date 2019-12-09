# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoin-core
pkgver=0.19.0.1
pkgrel=1
pkgdesc="Bitcoin Core headless P2P node"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://bitcoincore.org"
depends=('boost' 'boost-libs' 'zeromq' 'libevent')
checkdepends=('python')
makedepends=('autoconf' 'automake' 'binutils' 'libtool' 'm4' 'make' 'pkg-config' 'systemd')
license=('MIT')
source=(https://bitcoincore.org/bin/bitcoin-core-$pkgver/bitcoin-$pkgver.tar.gz
        bitcoin.conf
        bitcoind.logrotate
        bitcoind.service
        bitcoind-reindex.service
        bitcoin-sysusers.conf
        bitcoin-core-01-systemd-sysusers.hook
        bitcoin-core-01-userdel.hook
        bitcoin-core-02-chown.hook
        bitcoin-core-02-rm-rf.hook)
sha256sums=('7ac9f972249a0a16ed01352ca2a199a5448fe87a4ea74923404a40b4086de284'
            'b1908344281498d39bfa40c3b9725f9c95bf22602cd46e6120a1f17bad9dae35'
            '7bf4bdad419c1ee30b88c7e4190707c5ff250da8b23d68d5adf14043f8e2ac73'
            'a25e1a1e42d21f97282a53b8e571f0cef2081ce365dd70743131288ccc579b5c'
            'a04799dece0dc3decaa8c3bdab39fb8bdb074187f9b506a1e25603b572e58ae7'
            'f126b4824e43d9760ab2021460a37d859986f07e1ac9245ee4938e832739f73a'
            '0b4f7ec41cf88aa1278d089a03f116c33bac62dec038903f4ced58da67afb980'
            'f1c3727220df06993a61cc9f4ef25c83cdaf3624179b5ead8383bc9ef7109e70'
            '2fc4d1b5ad05dbed9f1759951c9a96f4e00c7fd45fd45f16f73cff674e836af3'
            '135addcc23c3b58c907618625aeb54e068fe5a6d996e14146c197e6e164027d3')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin'
        'etc/logrotate.d/bitcoind')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx' 'bitcoin-core-git')
install=bitcoind.install

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

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
    --without-miniupnpc \
    --with-gnu-ld
  make -j$_nproc
}

check() {
  cd "$srcdir/${pkgname%-core}-$pkgver"

  msg2 'Testing...'
  make -j$_nproc check
}

package() {
  cd "$srcdir/${pkgname%-core}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%-core}"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes; do
      cp -dpr --no-preserve=ownership "doc/$_doc" \
        "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  msg2 'Installing essential directories'
  install -dm 700 "$pkgdir/etc/bitcoin"

  msg2 'Installing bitcoin...'
  make DESTDIR="$pkgdir" install

  msg2 'Installing bitcoin.conf...'
  install -Dm 600 "$srcdir/bitcoin.conf" -t "$pkgdir/etc/bitcoin"

  msg2 'Installing bitcoind.service...'
  install -Dm 644 "$srcdir/bitcoind.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bitcoind-reindex.service" \
    -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing bitcoin-sysusers.conf...'
  install -Dm 644 "$srcdir/bitcoin-sysusers.conf" \
    "$pkgdir/usr/lib/sysusers.d/bitcoin.conf"

  msg2 'Installing bitcoind.logrotate...'
  install -Dm 644 "$srcdir/bitcoind.logrotate" "$pkgdir/etc/logrotate.d/bitcoind"

  msg2 'Installing bash completion...'
  for _compl in bitcoin-cli bitcoin-tx bitcoind; do
    install -Dm 644 "contrib/${_compl}.bash-completion" \
      "$pkgdir/usr/share/bash-completion/completions/$_compl"
  done

  # XXX: pacman hook on Remove event not firing
  msg2 'Installing pacman hooks...'
  install -Dm 644 "$srcdir"/*.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
