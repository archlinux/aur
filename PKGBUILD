# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=bitcoin-abc
pkgver=0.20.8
pkgrel=1
pkgdesc="Bitcoin ABC  with bitcoind, bitcoin-tx, and bitcoin-cli"
arch=('i686' 'x86_64')
url="https://bitcoinabc.org"
depends=('boost-libs' 'libevent' 'openssl' 'zeromq')
makedepends=('boost')
optdepends=('miniupnpc: build with support for UPnP')
license=('MIT')
source=(https://github.com/Bitcoin-ABC/bitcoin-abc/archive/v$pkgver.tar.gz
        bitcoin.conf
        bitcoin.logrotate
        bitcoin.service
        bitcoin-reindex.service
        bitcoin.install)
sha256sums=('6141489cd49bcfb2922fd1946ef464f3490b5827b1ef81db36008adbecd10c21'
            'b1908344281498d39bfa40c3b9725f9c95bf22602cd46e6120a1f17bad9dae35'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            '9643eed2c20d78a9c7347df64099765773615f79d3b8a95693d871c933516880'
            '35ff9331d7df8b90adfc7d82752cca4f8b7ff23a29e5d10b07e4e3fc78050679'
            'c8a667f7138a504f0a3018b48eb687814cfc741f4d38d8699b0b3b5234b25fea')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx')
install=bitcoin.install

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/bitcoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/bitcoin \
    --localstatedir=/var/lib/bitcoin \
    --enable-hardening \
    --with-gui=no \
    --disable-wallet \
    --with-gnu-ld \
    --disable-maintainer-mode \
    --enable-reduce-exports \
    --disable-gui-tests
  make
}

check() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg2 'Testing...'
  make check
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"

  msg2 'Installing man pages...'
  install -Dm 644 doc/man/*.1 -t "$pkgdir/usr/share/man/man1"

  msg2 'Installing examples...'
  install -Dm644 "contrib/debian/examples/bitcoin.conf" \
    -t "$pkgdir/usr/share/doc/bitcoin/examples"

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

  msg2 'Installing bash completion...'
  for _compl in bitcoin-cli bitcoin-tx bitcoind; do
    install -Dm 644 "contrib/${_compl}.bash-completion" \
      "$pkgdir/usr/share/bash-completion/completions/$_compl"
  done
}
