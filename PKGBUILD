# Maintainer: ordoban <dirk.langer@vvovgonik.de>

pkgname='dell-e514dw'
pkgver='3.2.0'
pkgrel='1'
pkgdesc='CUPS driver for the Dell Laser Printer E514dw'
arch=('i686' 'x86_64')
url='https://www.dell.com/support/home/de/de/debsdt1/Drivers/DriversDetails?driverId=FV8XM'
license=('GPL' 'unknown')
depends=('perl' 'cups' 'psutils')
depends_x86_64=('lib32-glibc')
makedepends=()
options=('emptydirs')
source=('dell_lpdwrapper_E514dw.patch'
        'https://downloads.dell.com/FOLDER03040876M/1/Printer_E514dw_Driver_Dell_A00_LINUX.zip')
md5sums=('1e5dc53bbb9beb917723e764014e5c19'
         '961ef3d745b0f9ee3987401abcfa29e2')

prepare() {
  cd "$srcdir"
  bsdtar -xf ./E514-Linux/e514dwcupswrapper-3.2.0-1.i386.rpm
  bsdtar -xf ./E514-Linux/e514dwlpr-3.2.0-1.i386.rpm

  cd "$srcdir/opt" || return 1
  patch -p1 < "$srcdir/dell_lpdwrapper_E514dw.patch"

  cd "$srcdir"
  mv "$srcdir/opt/dell/Printers/E514dw/cupswrapper/dell-E514dw-cups-en.ppd" "$srcdir/E514dw.ppd"
  mv "$srcdir/opt/dell/Printers/E514dw/cupswrapper/dell_lpdwrapper_E514dw" "$srcdir/dell_lpdwrapper_E514dw"

  echo "/usr/share/dell/E514dw/lpd/brprintconflsr3 -P E514dw" '$''*' >> "brprintconflsr3_E514dw"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/dell"

  cp -R "$srcdir/opt/dell/Printers/E514dw" "$pkgdir/usr/share/dell/"

  rm "$pkgdir/usr/share/dell/E514dw/inf/setupPrintcap"

  install -m 755 -D "brprintconflsr3_E514dw" "$pkgdir/usr/bin"
  install -m 644 -D "E514dw.ppd" "$pkgdir/usr/share/cups/model/E514dw.ppd"
  install -m 755 -D "dell_lpdwrapper_E514dw" "$pkgdir/usr/lib/cups/filter/dell_lpdwrapper_E514dw"
}
