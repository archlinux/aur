# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-protocol
pkgver=3.2.0
pkgrel=2
pkgdesc="Bitcoin Blockchain Query Protocol"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'libbitcoin-system'
         'libsecp256k1'
         'protobuf'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'm4'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-protocol"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('506f7ca608c91ccefd467f2a34d36ed5c671a1b7b1dc6bca8f0ebacd887f7837')

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-protocol \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-protocol \
    --localstatedir=/var/lib/libbitcoin-protocol \
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
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-protocol"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
