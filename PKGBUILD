# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-consensus-git
pkgver=20170212
pkgrel=1
pkgdesc="Bitcoin Consensus Library"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
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
url="https://github.com/libbitcoin/libbitcoin-consensus"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin-consensus)
sha256sums=('SKIP')
provides=('libbitcoin-consensus')
conflicts=('libbitcoin-consensus')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-consensus \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-consensus \
    --localstatedir=/var/lib/libbitcoin-consensus \
    --with-gnu-ld \
    --without-tests
  make -j$(($(nproc)/2))
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-consensus"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
