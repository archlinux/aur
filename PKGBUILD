# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-node-git
pkgver=20150707
pkgrel=1
pkgdesc="Bitcoin Full Node"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'libbitcoin-blockchain-git'
         'secp256k1-git')
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-node"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin-node)
sha256sums=('SKIP')
provides=('libbitcoin-node')
conflicts=('libbitcoin-node')

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
    --libexecdir=/usr/lib/libbitcoin-node \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-node \
    --localstatedir=/var/lib/libbitcoin-node \
    --with-bash-completiondir=/usr/share/bash-completion/completions \
    --with-gnu-ld \
    --without-tests
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/libbitcoin-node/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
