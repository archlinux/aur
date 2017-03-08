# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-node-git
pkgver=20170307
pkgrel=1
pkgdesc="Bitcoin Full Node Library"
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
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-node"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin-node)
sha256sums=('SKIP')
provides=('libbitcoin-node')
conflicts=('libbitcoin-node')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Configuring...'
  cp -dpr --no-preserve=ownership data/bn.cfg data/bn.cfg.in
  sed -i \
    -e 's@^directory.*@directory = /srv/bn/db@' \
    -e 's@^debug_file.*@debug_file = /var/log/bn/debug.log@' \
    -e 's@^error_file.*@error_file = /var/log/bn/error.log@' \
    -e 's@^hosts_file.*@hosts_file = /etc/bn/hosts.cache@' \
    -e 's@^archive_directory.*@archive_directory = /var/log/bn@' \
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
    --with-gnu-ld \
    --without-tests
  make -j$(($(nproc)/2))
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-node"

  msg2 'Installing...'
  install -dm 700 "$pkgdir/etc/bn"
  install -dm 755 "$pkgdir/srv/bn"
  install -dm 755 "$pkgdir/var/log/bn"
  make DESTDIR="$pkgdir" install

  msg2 'Installing conf...'
  install -Dm 600 data/bn.cfg.in "$pkgdir/etc/bn/bn.cfg"
}
