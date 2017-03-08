# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-database
pkgver=3.0.0
pkgrel=2
pkgdesc="Bitcoin High Performance Blockchain Database"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
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
url="https://github.com/libbitcoin/libbitcoin-database"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('50409965b24e3a394df18b1ccbae2715c4a285fcd8e5502228b39560d365e8c4')
provides=('libbitcoin-database')
conflicts=('libbitcoin-database')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-database \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-database \
    --localstatedir=/var/lib/libbitcoin-database \
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
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-database"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
