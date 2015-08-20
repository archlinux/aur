pkgname=udt
pkgver=4.11
pkgrel=1
pkgdesc="A protocol built on top of UDP by adding reliability control and congestion control."
arch=('i686' 'x86_64')
url="http://udt.sourceforge.net"
license=('BSD')
source=(http://downloads.sourceforge.net/udt/$pkgname.sdk.$pkgver.tar.gz)
md5sums=('30b1556e5cf0afe179e40a53a1371b08')

build() {
  cd "$srcdir/udt4"

  if [ "$CARCH" == 'i686' ] ; then
    make_arch='arch=IA32'
  else
    make_arch='arch=AMD64'
  fi
  make "$make_arch" src.all
  make "$make_arch" app.all
}

check() {
  cd "$srcdir/udt4"
  LD_LIBRARY_PATH=src app/test
}

package() {
  cd "$srcdir/udt4"

  install -Dm 644 src/libudt.so "$pkgdir/usr/lib/libudt.so"

  include_dir="$pkgdir/usr/include/udt/"
  install -d "$include_dir"
  install -m 644 src/*.h "$include_dir"

  install -Dm 755 app/appclient "$pkgdir/usr/bin/udt_appclient"
  install -Dm 755 app/appserver "$pkgdir/usr/bin/udt_appserver"
  install -Dm 755 app/recvfile "$pkgdir/usr/bin/udt_recvfile"
  install -Dm 755 app/sendfile "$pkgdir/usr/bin/udt_sendfile"

  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
