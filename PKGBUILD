# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-client
pkgver=3.0.0
pkgrel=3
pkgdesc="Bitcoin Client Query Library"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'icu'
         'libbitcoin-protocol'
         'libbitcoin-system'
         'libsecp256k1'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'm4'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-client"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('0c4b7ebc10ecd6350ec18d0588df7b1e68f73078c1183b36fd55ae3c83453720')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-client \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-client \
    --localstatedir=/var/lib/libbitcoin-client \
    --with-gnu-ld \
    --without-examples
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
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-client"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
