# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-protocol-git
pkgver=20170304
pkgrel=4
pkgdesc="Bitcoin Blockchain Query Protocol"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'libbitcoin-system'
         'libsecp256k1'
         'protobuf'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
             'm4'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-protocol"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin-protocol)
sha256sums=('SKIP')
provides=('libbitcoin-protocol')
conflicts=('libbitcoin-protocol')

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

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
  cd ${pkgname%-git}

  msg2 'Testing...'
  make -j$_nproc check
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-protocol"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
