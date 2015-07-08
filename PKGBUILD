# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: William Giokas (KaiSforza) <1007380@gmail.com>

pkgname=libbitcoin-git
pkgver=20150707
pkgrel=1
pkgdesc="Bitcoin Cross-Platform C++ Development Toolkit"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'curl'
         'icu'
         'leveldb'
         'openssl'
         'secp256k1-git')
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin)
sha256sums=('SKIP')
provides=('libbitcoin')
conflicts=('libbitcoin')

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
    --libexecdir=/usr/lib/libbitcoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin \
    --localstatedir=/var/lib/libbitcoin \
    --with-icu \
    --with-gnu-ld \
    --without-tests
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/libbitcoin/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
