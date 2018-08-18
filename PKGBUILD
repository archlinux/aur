# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: William Giokas (KaiSforza) <1007380@gmail.com>

pkgname=libbitcoin-system-git
pkgver=20170307
pkgrel=4
pkgdesc="Bitcoin Cross-Platform C++ Development Toolkit"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'icu'
         'libpng'
         'libsecp256k1'
         'qrencode')
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
             'm4'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin
        git+https://github.com/libbitcoin/libbitcoin.wiki)
sha256sums=('SKIP' 'SKIP')
provides=('libbitcoin' 'libbitcoin-system')
conflicts=('libbitcoin' 'libbitcoin-system')

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

pkgver() {
  cd libbitcoin
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd libbitcoin

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
    --with-png \
    --with-qrencode \
    --with-gnu-ld \
    --without-examples
  make -j$_nproc
}

check() {
  cd libbitcoin

  msg2 'Testing...'
  make -j$_nproc check
}

package() {
  cd libbitcoin

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Installing documentation...'
  cp -dpr --no-preserve=ownership "$srcdir/libbitcoin.wiki" \
    "$pkgdir/usr/share/doc/libbitcoin/wiki"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
