# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-node
pkgver=3.5.0
pkgrel=5
pkgdesc="Bitcoin Full Node"
arch=('aarch64' 'x86_64')
depends=('boost'
         'boost-libs'
         'icu'
         'libbitcoin-blockchain'
         'libbitcoin-consensus'
         'libbitcoin-database'
         'libbitcoin-network'
         'libbitcoin-system'
         'libsecp256k1')
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
             'm4'
             'make'
             'pkg-config'
             'systemd')
optdepends=('statsd: log to statistics collection server')
groups=('libbitcoin' 'obelisk')
url="https://github.com/libbitcoin/libbitcoin-node"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver
        git+https://github.com/libbitcoin/libbitcoin-node.wiki
        bn.logrotate
        bn-init.service
        bn.service
        obelisk-sysusers.conf
        libbitcoin-node-01-systemd-sysusers.hook
        libbitcoin-node-01-userdel.hook
        libbitcoin-node-02-chown.hook
        libbitcoin-node-02-rm-rf.hook)
sha256sums=('e3a0a96155ca93aa6cba75789c18419f40686a69cbd40c77aa77ca84ccc43cab'
            'SKIP'
            'f291f3b70b430657e92fd165d6a0ebded28681ce57ab1fdb20e9324d4c68da8e'
            'fba120270af0451db203d9e6712cdcee65d1268582ec34ae1fc63783928b4fc2'
            '779b3aa788add61bbfc203ece13c8637bdb7a6f437e315955115ff101bbbcc48'
            '17de557ac9b8a4d354ade339904286fa074facea539984e97b5e83f45a2c305f'
            '651b0cd7c7382acf6862b60f6fdb4cff581c045c02b1915c48e4dde5aa57bf3e'
            'a2670db1e216d686cb975806915ab07e6f600f5dd2e075d421fa118574cae6a8'
            '87fd998294264ad3c8b2d30a643c9374f0d8ec3e7d5b6bce006633e1586b98e1'
            'b5bd4f1f526ded3f6cbef97ae0615768f655f4e9a8f079a764d8835f56f8aaa5')
backup=('etc/obelisk/bn/bn.cfg'
        'etc/logrotate.d/bn')
install=bn.install

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Configuring...'
  cp -dpr --no-preserve=ownership data/bn.cfg data/bn.cfg.in
  sed -i \
    -e 's@^directory.*@directory = /srv/obelisk/db@' \
    -e 's@^debug_file.*@debug_file = /var/log/obelisk/bn/debug.log@' \
    -e 's@^error_file.*@error_file = /var/log/obelisk/bn/error.log@' \
    -e 's@^hosts_file.*@hosts_file = /srv/obelisk/hosts.cache@' \
    -e 's@^archive_directory.*@archive_directory = /var/log/obelisk/bn@' \
    -e 's@^rotation_size.*@rotation_size = 5000000@' \
    -e 's@^maximum_archive_size.*@maximum_archive_size = 35000000@' \
    -e 's@^maximum_archive_files.*@maximum_archive_files = 7@' \
    data/bn.cfg.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-node \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-node \
    --localstatedir=/var/lib/libbitcoin-node \
    --with-bash-completiondir=/usr/share/bash-completion/completions \
    --with-gnu-ld
  make -j$_nproc
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Testing...'
  make -j$_nproc check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-node"

  msg2 'Installing...'
  install -dm 700 "$pkgdir/etc/obelisk"
  install -dm 755 "$pkgdir/srv/obelisk"
  install -dm 755 "$pkgdir/var/log/obelisk/bn"
  make DESTDIR="$pkgdir" install

  msg2 'Installing documentation...'
  cp -dpr --no-preserve=ownership "$srcdir/libbitcoin-node.wiki" \
    "$pkgdir/usr/share/doc/libbitcoin-node/wiki"

  msg2 'Installing conf...'
  install -Dm 600 data/bn.cfg.in "$pkgdir/etc/obelisk/bn/bn.cfg"

  msg2 'Installing systemd service files...'
  install -Dm 644 "$srcdir/bn-init.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bn.service" -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing systemd sysusers configuration file...'
  install -Dm 644 "$srcdir/obelisk-sysusers.conf" \
    "$pkgdir/usr/lib/sysusers.d/obelisk.conf"

  msg2 'Installing logrotate conf...'
  install -Dm 644 "$srcdir/bn.logrotate" "$pkgdir/etc/logrotate.d/bn"

  # XXX: pacman hook on Remove event not firing
  msg2 'Installing pacman hooks...'
  install -Dm 644 "$srcdir"/*.hook -t "$pkgdir/usr/share/libalpm/hooks"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
