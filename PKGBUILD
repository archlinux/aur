# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Maxime Vincent <maxime.vince@gmail.com>

pkgname=wolfssl
pkgver=4.5.0
pkgrel=2
pkgdesc='small, fast, portable implementation of TLS/SSL for embedded devices to the cloud (formerly CyaSSL)'
arch=(i686 x86_64)
license=(GPL)
depends=('sh')
url='https://www.wolfssl.com/'
source=(${pkgname}-${pkgver}-stable.tar.gz::https://github.com/wolfSSL/wolfssl/archive/v$pkgver-stable.tar.gz
        https://github.com/wolfSSL/wolfssl/releases/download/v${pkgver}-stable/${pkgname}-${pkgver}-stable.tar.gz.asc)
sha256sums=('7de62300ce14daa0051bfefc7c4d6302f96cabc768b6ae49eda77523b118250c'
            'SKIP')
validpgpkeys=('A2A48E7BCB96C5BECB987314EBC80E415CA29677')

build() {
  cd $pkgname-$pkgver-stable
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fastmath \
              --disable-bump \
              --enable-opensslextra \
              --enable-fortress \
              --enable-keygen \
              --enable-certgen \
              --disable-debug \
              --disable-ntru \
              --disable-examples \
              --enable-distro
  make
}

package() {
  cd $pkgname-$pkgver-stable
  make install DESTDIR="$pkgdir"
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  libtool --finish /usr/lib
}
