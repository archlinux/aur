# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-node-git
pkgver=20180309
pkgrel=2
pkgdesc="Bitcoin Full Node"
arch=('i686' 'x86_64')
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
             'pkg-config')
optdepends=('statsd: log to statistics collection server')
groups=('libbitcoin' 'obelisk')
url="https://github.com/libbitcoin/libbitcoin-node"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin-node
        git+https://github.com/libbitcoin/libbitcoin-node.wiki
        bn.logrotate
        bn-init.service
        bn.service
        obelisk-sysusers.conf
        libbitcoin-node-git-01-systemd-sysusers.hook
        libbitcoin-node-git-01-userdel.hook
        libbitcoin-node-git-02-chown.hook
        libbitcoin-node-git-02-rm-rf.hook)
sha256sums=('SKIP'
            'SKIP'
            'f291f3b70b430657e92fd165d6a0ebded28681ce57ab1fdb20e9324d4c68da8e'
            'b1da043ad40e0d80519b32a8b01a66d0fb47a6d2b19e2b7ad3f1b14b6d689bdd'
            'd3730c0c1e0fc85dec828daef1d92113a6a79f6245617934113f4b31af75bc43'
            '17de557ac9b8a4d354ade339904286fa074facea539984e97b5e83f45a2c305f'
            '6b4e2f95d4ba2a41493ccad5b867aefb9f9b4f5b8ddbbf0da9a51a4a48d915f8'
            'ac81ca8c96872204b55de0e7076ba3e6410069a3ea292a1191aabba5f2f1839f'
            'fa279c7ea476bda16a3d1f1dea8e3c416bca757c69d5effdbb135f45f2ba3c71'
            '4a284ff024ed702e42f33ec7b62c8c53495188810e6eaea02277435b3698f1c6')
provides=('libbitcoin-node')
conflicts=('libbitcoin-node')
backup=('etc/obelisk/bn/bn.cfg'
        'etc/logrotate.d/bn')
install=bn.install

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
  cp -dpr --no-preserve=ownership data/bn.cfg data/bn.cfg.in
  sed -i \
    -e 's@^directory.*@directory = /srv/obelisk/db@' \
    -e 's@^debug_file.*@debug_file = /var/log/obelisk/bn/debug.log@' \
    -e 's@^error_file.*@error_file = /var/log/obelisk/bn/error.log@' \
    -e 's@^hosts_file.*@hosts_file = /etc/obelisk/hosts.cache@' \
    -e 's@^archive_directory.*@archive_directory = /var/log/obelisk/bn@' \
    -e 's@^rotation_size.*@rotation_size = 5000000@' \
    -e 's@^maximum_archive_size.*@maximum_archive_size = 35000000@' \
    -e 's@^maximum_archive_files.*@maximum_archive_files = 7@' \
    data/bn.cfg.in
}

build() {
  cd ${pkgname%-git}

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
  cd ${pkgname%-git}

  msg2 'Testing...'
  make -j$_nproc check
}

package() {
  cd ${pkgname%-git}

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
