# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-consensus-git
pkgver=20150707
pkgrel=1
pkgdesc="Libbitcoin Consensus Library"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'secp256k1-git')
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
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
    --with-secp256k1 \
    --without-openssl \
    --without-tests
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/libbitcoin-consensus/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
