# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-node
pkgver=3.0.0
pkgrel=2
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
             'libtool'
             'm4'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-node"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('b6588145608cadd6643c556efb8b9e967107d5d6e9f75d6f341f493aec763463')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

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
  make -j$(($(nproc)/2))
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Testing...'
  make -j$(($(nproc)/2)) check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

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
