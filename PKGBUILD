# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoin-core-addrindex
pkgver=0.13.2
pkgrel=7
pkgdesc="Bitcoin Core headless P2P node with addrindex"
arch=('i686' 'x86_64')
url="https://github.com/btcdrak/bitcoin"
depends=('boost'
         'boost-libs'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'binutils'
             'libtool'
             'm4'
             'make'
             'pkg-config')
optdepends=('miniupnpc: build with support for UPnP')
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/btcdrak/bitcoin/releases/download/v0.13.2-addrindex/bitcoin-$pkgver-addrindex.tar.gz
        bitcoin.conf
        bitcoin.logrotate
        bitcoin.service
        bitcoin-reindex.service)
sha256sums=('a580510f8e2d020a751f0a16223f21b1e149768c28e73ee5b4692df46710c923'
            'bebd41435558e3e6ffe1c2edaaf2e26cfd27a6ba8b6ee7da907bb56065f6c20e'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            '9643eed2c20d78a9c7347df64099765773615f79d3b8a95693d871c933516880'
            '35ff9331d7df8b90adfc7d82752cca4f8b7ff23a29e5d10b07e4e3fc78050679')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin.install

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

build() {
  cd "$srcdir/${pkgname%%-*}-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/bitcoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/bitcoin \
    --localstatedir=/var/lib/bitcoin \
    --enable-hardening \
    --with-gui=no \
    --disable-wallet \
    --with-gnu-ld
  make -j$_nproc
}

check() {
  cd "$srcdir/${pkgname%%-*}-$pkgver"

  msg2 'Testing...'
  make -j$_nproc check
}

package() {
  cd "$srcdir/${pkgname%%-*}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%%-*}"

  # code commented out is missing from 0.13.2-addrindex release

  # msg2 'Installing man pages...'
  # install -Dm 644 contrib/debian/manpages/*.1 -t "$pkgdir/usr/share/man/man1"
  # install -Dm 644 contrib/debian/manpages/*.5 -t "$pkgdir/usr/share/man/man5"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes; do
      cp -dpr --no-preserve=ownership "doc/$_doc" \
        "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  msg2 'Installing essential directories'
  install -dm 700 "$pkgdir/etc/bitcoin"
  install -dm 755 "$pkgdir/srv/bitcoin"

  msg2 'Installing bitcoin...'
  make DESTDIR="$pkgdir" install

  msg2 'Installing bitcoin.conf...'
  install -Dm 600 "$srcdir/bitcoin.conf" -t "$pkgdir/etc/bitcoin"

  msg2 'Installing bitcoin.service...'
  install -Dm 644 "$srcdir/bitcoin.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bitcoin-reindex.service" \
    -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing bitcoin.logrotate...'
  install -Dm 644 "$srcdir/bitcoin.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  # msg2 'Installing bash completion...'
  # for _compl in bitcoin-cli bitcoin-tx bitcoind; do
  #   install -Dm 644 "contrib/${_compl}.bash-completion" \
  #     "$pkgdir/usr/share/bash-completion/completions/$_compl"
  # done
}
