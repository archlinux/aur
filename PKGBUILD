# Maintainer: Joern Trefke <joern [at] trefke [dot] com>

pkgname='dell-e310dw'
pkgver='3.2.0'
pkgrel='2'
pkgdesc='CUPS driver for the Dell Laser Printer E310dw'
arch=('i686' 'x86_64')
url='http://www.dell.com/support/home/us/en/04/product-support/product/dell-e310dw-printer/drivers?os=es11'
license=('GPL' 'unknown')
depends=('perl' 'cups' 'psutils')
depends_x86_64=('lib32-glibc')
makedepends=()
options=('emptydirs')
source=('dell_lpdwrapper_E310dw.patch'
        'https://downloads.dell.com/FOLDER03004762M/1/Printer_E310dw_Driver_Dell_A00_LINUX.zip')
md5sums=('52e489ab76b36340d41c4141b04da6e7'
         '1a87209cfcccb9202c078c77d05a8ec2')


prepare() {
  cd "$srcdir"
  bsdtar -xf ./E310-Linux/e310dwcupswrapper-3.2.0-1.i386.rpm
  bsdtar -xf ./E310-Linux/e310dwlpr-3.2.0-1.i386.rpm

  cd "$srcdir/opt" || return 1
  patch -p1 < "$srcdir/dell_lpdwrapper_E310dw.patch"

  cd "$srcdir"
  mv "$srcdir/opt/dell/Printers/E310dw/cupswrapper/dell-E310dw-cups-en.ppd" "$srcdir/E310dw.ppd"
  mv "$srcdir/opt/dell/Printers/E310dw/cupswrapper/dell_lpdwrapper_E310dw" "$srcdir/dell_lpdwrapper_E310dw"

  echo "/usr/share/dell/E310dw/lpd/brprintconflsr3 -P E310dw" '$''*' >> "brprintconflsr3_E310dw"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/dell"

  cp -R "$srcdir/opt/dell/Printers/E310dw" "$pkgdir/usr/share/dell/"

  rm "$pkgdir/usr/share/dell/E310dw/inf/setupPrintcap"

  install -m 755 -D "brprintconflsr3_E310dw" "$pkgdir/usr/bin"
  install -m 644 -D "E310dw.ppd" "$pkgdir/usr/share/cups/model/E310dw.ppd"
  install -m 755 -D "dell_lpdwrapper_E310dw" "$pkgdir/usr/lib/cups/filter/dell_lpdwrapper_E310dw"
}
