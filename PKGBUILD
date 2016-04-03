# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-database-git
pkgver=20160403
pkgrel=1
pkgdesc="Bitcoin High Performance Blockchain Database"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'libbitcoin'
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
url="https://github.com/libbitcoin/libbitcoin-database"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin-database)
sha256sums=('SKIP')
provides=('libbitcoin-database')
conflicts=('libbitcoin-database')

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
    --libexecdir=/usr/lib/libbitcoin-database \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-database \
    --localstatedir=/var/lib/libbitcoin-database \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-database"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
