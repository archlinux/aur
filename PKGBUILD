# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-server
pkgver=2.2.0
pkgrel=3
pkgdesc="Bitcoin Full Node and Query Server"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'czmq-git'
         'czmqpp-git'
         'libbitcoin'
         'libbitcoin-blockchain'
         'libbitcoin-consensus'
         'libbitcoin-node'
         'libsodium'
         'secp256k1-git'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'make'
             'pkg-config')
optdepends=('libbitcoin-explorer: CurveZMQ client/server authentication')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-server"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver
        git+https://github.com/libbitcoin/libbitcoin-server.wiki
        bs.logrotate
        bs.service
        bsinit.service)
sha256sums=('7df19518ce2401100b8689c7adb77e9c7c68317219b9c48c0e464c181f5f47d8'
            'SKIP'
            '09ea3d2bf7cb87a0760c2a73893d62d1868d232c9e925cabf6140b1b031efee3'
            '564112d0860f1523049bd89779e1b1bfc189a3d143d2cc808441981ed793658a'
            '2bcf3615cd8e5ba6d4c78429b018b9bf756d5fad6ab879963a13f19e47315c7d')
install=bs.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Configuring...'
  cp -dpr --no-preserve=ownership data/bs.cfg data/bs.cfg.in
  sed -i 's@^database_path.*@database_path = /srv/bs/blockchain@' data/bs.cfg.in
  sed -i 's@^debug_file.*@debug_file = /var/log/bs/debug.log@' data/bs.cfg.in
  sed -i 's@^error_file.*@error_file = /var/log/bs/error.log@' data/bs.cfg.in
  sed -i 's@^hosts_file.*@hosts_file = /etc/bs/hosts.cache@' data/bs.cfg.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-server \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-server \
    --localstatedir=/var/lib/libbitcoin-server \
    --with-bash-completiondir=/usr/share/bash-completion/completions \
    --with-gnu-ld
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-server"

  msg2 'Installing...'
  install -dm 700 "$pkgdir/etc/bs"
  install -dm 700 "$pkgdir/srv/bs"
  make DESTDIR="$pkgdir" install

  msg2 'Installing documentation...'
  cp -dpr --no-preserve=ownership "$srcdir/libbitcoin-server.wiki" \
    "$pkgdir/usr/share/doc/libbitcoin-server/wiki"

  msg2 'Installing conf...'
  install -Dm 600 data/bs.cfg.in "$pkgdir/etc/bs/bs.cfg"

  msg2 'Installing systemd service files...'
  install -Dm 644 "$srcdir/bs.service" \
    "$pkgdir/usr/lib/systemd/system/bs.service"
  install -Dm 644 "$srcdir/bsinit.service" \
    "$pkgdir/usr/lib/systemd/system/bsinit.service"

  msg2 'Installing logrotate conf...'
  install -dm 700 "$pkgdir/var/log/bs"
  install -Dm 644 "$srcdir/bs.logrotate" "$pkgdir/etc/logrotate.d/bs"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
