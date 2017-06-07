# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-database
pkgver=3.2.0
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
sha256sums=('02586c89ef4d6ba15b50f0863c3a767db6a479f3fd6d1c7fefc54bb1cf349435')
provides=('libbitcoin-database')
conflicts=('libbitcoin-database')

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
    --libexecdir=/usr/lib/libbitcoin-database \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-database \
    --localstatedir=/var/lib/libbitcoin-database \
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
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-database"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
