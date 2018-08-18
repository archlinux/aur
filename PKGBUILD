# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-explorer-git
pkgver=20170307
pkgrel=4
pkgdesc="Bitcoin Command Line Tool"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'icu'
         'libbitcoin-client'
         'libbitcoin-network'
         'libbitcoin-protocol'
         'libbitcoin-system'
         'libpng'
         'libsecp256k1'
         'qrencode'
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
url="https://github.com/libbitcoin/libbitcoin-explorer"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin-explorer
        git+https://github.com/libbitcoin/libbitcoin-explorer.wiki)
sha256sums=('SKIP' 'SKIP')
provides=('libbitcoin-explorer')
conflicts=('libbitcoin-explorer')

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
    --libexecdir=/usr/lib/libbitcoin-explorer \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-explorer \
    --localstatedir=/var/lib/libbitcoin-explorer \
    --with-bash-completiondir=/usr/share/bash-completion/completions \
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
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-explorer"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Installing documentation...'
  cp -dpr --no-preserve=ownership "$srcdir/libbitcoin-explorer.wiki" \
    "$pkgdir/usr/share/doc/libbitcoin-explorer/wiki"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
