# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-blockchain
pkgver=3.5.0
pkgrel=2
pkgdesc="Bitcoin Blockchain Library"
arch=('aarch64' 'x86_64')
depends=('boost'
         'boost-libs'
         'icu'
         'libbitcoin-consensus'
         'libbitcoin-database'
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
url="https://github.com/libbitcoin/libbitcoin-blockchain"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('03b8362c9172edbeb1e5970c996405cd2738e8274ba459e9b85359d6b838de20')

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
    --libexecdir=/usr/lib/libbitcoin-blockchain \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-blockchain \
    --localstatedir=/var/lib/libbitcoin-blockchain \
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
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-blockchain"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
