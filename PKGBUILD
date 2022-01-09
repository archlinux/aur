# Maintainer: Harvey <harv@gmx.de>
license=('GPL' 'custom:Brother')
arch=('i686' 'x86_64')
pkgname=brscan4
pkgver=0.4.11_1
pkgrel=1
pkgdesc="SANE drivers from Brother for compatible models"
depends=('sane' 'gtk2')
url="http://support.brother.com"
install=brscan4.install

[ "$CARCH" = "x86_64" ] && _pkg="dlf105203/${pkgname}-${pkgver/_/-}.x86_64.rpm" || _pkg="dlf105202/${pkgname}-${pkgver/_/-}.i386.rpm"
[ "$CARCH" = "x86_64" ] && _pkg_md5sum="54dec75887de091fde5fcd511d9a57c3" || _pkg_md5sum="dc87c907c9a2f086dcc56eb2e8fafbbc"

source=("https://download.brother.com/welcome/$_pkg"
	"agree.html"
	mk-udev-hwdb)
md5sums=($_pkg_md5sum
	 'ccffb9a6f6d436b21be25b0241068981'
	 '8966d38375d535028a63a6ef5f6104eb')

build() {
  cd "$srcdir"
  ./mk-udev-hwdb opt/brother/scanner/brscan4/{Brsane4.ini,models4/*.ini} > hwdb
}

package() {
  cp -r $srcdir/etc $pkgdir
  cp -r $srcdir/opt $pkgdir
  cp -r $srcdir/usr $pkgdir
  [ "$CARCH" = "x86_64" ] && mv $pkgdir/usr/lib64 $pkgdir/usr/lib
  install -D -m644 $srcdir/agree.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
  install -D -m644 $srcdir/hwdb $pkgdir/usr/lib/udev/hwdb.d/20-$pkgname.hwdb
  # move the links to the right direction
  cd $pkgdir/usr/lib/sane
  ln -sf libsane-brother4.so.1.0.7 $pkgdir/usr/lib/sane/libsane-brother4.so.1
  ln -sf libsane-brother4.so.1 $pkgdir/usr/lib/sane/libsane-brother4.so
}
