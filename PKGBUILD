# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoin-headless-addrindex-git
pkgver=20150710
pkgrel=1
pkgdesc="Bitcoin Core headless P2P wallet with addrindex"
arch=('i686' 'x86_64')
url="https://github.com/btcdrak/bitcoin"
depends=('boost'
         'boost-libs'
         'miniupnpc'
         'openssl')
makedepends=('autoconf'
             'automake'
             'binutils'
             'gcc'
             'git'
             'libtool'
             'make'
             'pkg-config'
             'yasm')
license=('MIT')
source=(${pkgname%%-*}::git+https://github.com/btcdrak/bitcoin#branch=addrindex-0.11)
sha256sums=('SKIP')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx')

pkgver() {
  cd ${pkgname%%-*}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%%-*}

  msg 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/bitcoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/bitcoin \
    --localstatedir=/var/lib/bitcoin \
    --enable-hardening \
    --enable-wallet \
    --with-gui=no \
    --with-incompatible-bdb \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%%-*}

  msg 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/${pkgname%%-*}/COPYING"

  msg 'Installing man pages...'
  install -Dm 644 contrib/debian/manpages/bitcoind.1 \
    "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm 644 contrib/debian/manpages/bitcoin.conf.5 \
    "$pkgdir/usr/share/man/man5/bitcoin.conf.5"

  msg 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in \
    `find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n'` \
    release-notes; do
      cp -dpr --no-preserve=ownership doc/$_doc \
        "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  msg 'Installing bitcoin...'
  make DESTDIR="$pkgdir" install

  msg 'Installing bash completion...'
  install -Dm 644 contrib/bitcoind.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/bitcoind"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
