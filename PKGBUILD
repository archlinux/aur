# Contributor: karnath <karnathtorjian@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=barnowl
pkgver=1.10
pkgrel=1
pkgdesc="Ncurses-based client with support for Zephyr, XMPP, IRC and Twitter protocols"
arch=('x86_64')
url="https://barnowl.mit.edu/"
license=('BSD' 'GPL')
depends=('glib-perl' 'perl-authen-sasl'
     'perl-io-socket-ssl' 'perl-class-accessor' 'perl-net-dns'
     'perl-par' 'perl-json' 'perl-net-twitter-lite'
     'perl-text-autoformat' 'perl-anyevent' 
     'perl-anyevent-irc' 'zephyr' 'openssl-1.0')
makedepends=('perl-extutils-depends' 'perl-module-install' 'python' 'zip')
source=("https://barnowl.mit.edu/dist/$pkgname-$pkgver-src.tgz")
sha256sums=('4aa88536506516e1a88a59a8a06407fe155b563e64aeea5637fa332633f7b5e1')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i "s/ncursesw\///" owl.h
  sed -i "s/ncursesw\///" tester.c
}

build() {
  cd $srcdir/$pkgname-$pkgver
  CFLAGS="-I/usr/include/openssl-1.0" LDFLAGS="-L/usr/lib/openssl-1.0" \
  ./configure --prefix=/usr   \
    --includedir=/usr/include \
    --mandir=/usr/share/man   \
    --docdir=/usr/share/doc/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/share/$pkgname/examples
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -m644 doc/*.txt $pkgdir/usr/share/doc/$pkgname/
  install -m644 examples/* $pkgdir/usr/share/$pkgname/examples/
}

