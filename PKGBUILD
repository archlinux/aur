# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-explorer-git
pkgver=20150707
pkgrel=1
pkgdesc="The Bitcoin Command Line Tool"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'czmq-git'
         'czmqpp-git'
         'libbitcoin-client-git'
         'libsodium'
         'secp256k1-git'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-explorer"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin-explorer)
sha256sums=('SKIP')
provides=('libbitcoin-explorer')
conflicts=('libbitcoin-explorer')

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
    --libexecdir=/usr/lib/libbitcoin-explorer \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-explorer \
    --localstatedir=/var/lib/libbitcoin-explorer \
    --with-bash-completiondir=/usr/share/bash-completion/completions \
    --with-gnu-ld \
    --without-tests
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/libbitcoin-explorer/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
