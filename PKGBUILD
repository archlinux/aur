# Maintainer: Harvey <harv@gmx.de>
license=('GPL' 'custom:Brother')
arch=('i686' 'x86_64')
pkgname=brscan4
pkgver=0.4.10_1
pkgrel=1
pkgdesc="SANE drivers from Brother for brscan4 compatible models"
depends=('sane' 'libusb-compat')
url="http://support.brother.com"
install=brscan4.install

[ "$CARCH" = "x86_64" ] && pkg="dlf006648/${pkgname}-${pkgver/_/-}.x86_64.rpm" || pkg="dlf006647/${pkgname}-${pkgver/_/-}.i386.rpm"
[ "$CARCH" = "x86_64" ] && pkg_md5sum="f4c4d1f214d4c42a6d40f5451fc40312" || pkg_md5sum="365f1b82ac3b7de73950be76a621bb93"

source=("https://download.brother.com/welcome/$pkg"
	"agree.html"
	mk-udev-rules)
md5sums=($pkg_md5sum
	 'ccffb9a6f6d436b21be25b0241068981'
	 '9a23d2af36609fbf2b0aa75269553701')

build() {
  cd "$srcdir"
  umask 022
  mkdir -p etc/udev/rules.d
  ./mk-udev-rules opt/brother/scanner/brscan4/{Brsane4.ini,models4/*.ini} > etc/udev/rules.d/40-$pkgname.rules
}

package() {
  cp -r $srcdir/etc $pkgdir
  cp -r $srcdir/opt $pkgdir
  cp -r $srcdir/usr $pkgdir
  install -D -m644 $srcdir/agree.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
  [ "$CARCH" = "x86_64" ] && mv $pkgdir/usr/lib64 $pkgdir/usr/lib
  # move the links to the right direction
  cd $pkgdir/usr/lib/sane
  ln -sf libsane-brother4.so.1.0.7 $pkgdir/usr/lib/sane/libsane-brother4.so.1
  ln -sf libsane-brother4.so.1 $pkgdir/usr/lib/sane/libsane-brother4.so
}
