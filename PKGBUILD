pkgname=openjade1.3
pkgver=1.3.2
pkgrel=3
_debpatch=13
pkgdesc="Implementation of the DSSSL language"
arch=('i686' 'x86_64')
url="http://openjade.sourceforge.net/"
license=('custom')
depends=('opensp' 'docbook-dsssl')
makedepends=('perl-perl4-corelibs')
install=openjade1.3.install
source=(http://downloads.sourceforge.net/project/${pkgname%1.3}/${pkgname%1.3}/${pkgver}/${pkgname%1.3}-${pkgver}.tar.gz
        http://ftp.debian.org/debian/pool/main/o/${pkgname}/${pkgname}_${pkgver}-${_debpatch}.diff.gz)
sha256sums=('1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1'
            '11d90e242eae60ce06bf27fd234adbd8efd7d4a9a4a2da058faa4e8336dc423a')

prepare() {
  cd "$srcdir/${pkgname%1.3}-$pkgver"
  patch -p1 -i "$srcdir/${pkgname}_${pkgver}-${_debpatch}.diff"
}

build() {
  cd "$srcdir/${pkgname%1.3}-$pkgver"
  ./configure --prefix=/usr --enable-default-catalog=/etc/sgml/catalog \
  --datadir=/usr/share/sgml/openjade1.3 --enable-html --enable-http --enable-mif
  make
}

package() {
  cd "$srcdir/${pkgname%1.3}-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -dm755 "$pkgdir"/usr/share/sgml/openjade1.3
  install -m644 dsssl/builtins.dsl dsssl/dsssl.dtd \
    dsssl/style-sheet.dtd dsssl/fot.dtd \
    dsssl/catalog "$pkgdir"/usr/share/sgml/openjade1.3
}
