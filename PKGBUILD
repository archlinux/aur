# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-client
pkgver=3.5.0
pkgrel=2
pkgdesc="Bitcoin Client Query Library"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
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
sha256sums=('bafa26647f334ecad04fc4bbef507a1954d7e0682f07bd38b90ab66dba5fe0d2')

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
    --libexecdir=/usr/lib/libbitcoin-client \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-client \
    --localstatedir=/var/lib/libbitcoin-client \
    --with-gnu-ld \
    --without-examples
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
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-client"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
