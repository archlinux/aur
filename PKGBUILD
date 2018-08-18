# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-server-git
pkgver=20180315
pkgrel=4
pkgdesc="Bitcoin Full Node and Query Server"
arch=('aarch64' 'x86_64')
depends=('boost'
         'boost-libs'
         'icu'
         'libbitcoin-blockchain'
         'libbitcoin-consensus'
         'libbitcoin-database'
         'libbitcoin-network'
         'libbitcoin-node'
         'libbitcoin-protocol'
         'libbitcoin-system'
         'libsecp256k1'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
             'm4'
             'make'
             'pkg-config')
optdepends=('libbitcoin-explorer: CurveZMQ client/server authentication'
            'statsd: log to statistics collection server')
groups=('libbitcoin' 'obelisk')
url="https://github.com/libbitcoin/libbitcoin-server"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin-server
        git+https://github.com/libbitcoin/libbitcoin-server.wiki
        bs.logrotate
        bs-init.service
        bs.service
        libbitcoin-server-git-01-rm-rf.hook)
sha256sums=('SKIP'
            'SKIP'
            'a2e4a1d6aaabcec9c57207a7e92b004c2dfa4a2d15c0ecfc05eefbf307783a49'
            'cbcc39723f04b51ed15475fbfb19cf94273db04b3e460f961e5078b40e664cb7'
            '17ff3d0ee3580ccbfdd77b227db27f678aa879c7e6fd30d8748bdb2ca84fd371'
            'bb3747db6e4124d4d80cdc7167db0c40ff99413413db1a66276a339e8e263451')
backup=('etc/obelisk/bs/bs.cfg'
        'etc/logrotate.d/bs')
provides=('libbitcoin-server')
conflicts=('libbitcoin-server')
install=bs.install

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Configuring...'
  cp -dpr --no-preserve=ownership data/bs.cfg data/bs.cfg.in
  sed -i \
    -e 's@^directory.*@directory = /srv/obelisk/db@' \
    -e 's@^debug_file.*@debug_file = /var/log/obelisk/bs/debug.log@' \
    -e 's@^error_file.*@error_file = /var/log/obelisk/bs/error.log@' \
    -e 's@^hosts_file.*@hosts_file = /srv/obelisk/hosts.cache@' \
    -e 's@^archive_directory.*@archive_directory = /var/log/obelisk/bs@' \
    -e 's@^rotation_size.*@rotation_size = 5000000@' \
    -e 's@^maximum_archive_size.*@maximum_archive_size = 35000000@' \
    -e 's@^maximum_archive_files.*@maximum_archive_files = 7@' \
    data/bs.cfg.in
}

build() {
  cd ${pkgname%-git}

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
  make -j$_nproc
}

check() {
  cd ${pkgname%-git}

  msg2 'Testing...'
  make -j$_nproc check
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-server"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/var/log/obelisk/bs"
  make DESTDIR="$pkgdir" install

  msg2 'Installing documentation...'
  cp -dpr --no-preserve=ownership "$srcdir/libbitcoin-server.wiki" \
    "$pkgdir/usr/share/doc/libbitcoin-server/wiki"

  msg2 'Installing conf...'
  install -dm 700 "$pkgdir/etc/obelisk"
  install -Dm 600 data/bs.cfg.in "$pkgdir/etc/obelisk/bs/bs.cfg"

  msg2 'Installing systemd service files...'
  install -Dm 644 "$srcdir/bs-init.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bs.service" -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing logrotate conf...'
  install -Dm 644 "$srcdir/bs.logrotate" "$pkgdir/etc/logrotate.d/bs"

  # XXX: pacman hook on Remove event not firing
  msg2 'Installing pacman hooks...'
  install -Dm 644 "$srcdir"/*.hook -t "$pkgdir/usr/share/libalpm/hooks"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
