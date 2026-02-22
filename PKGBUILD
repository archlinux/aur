# Maintainer: mighty-baseplate <thisisjn.atharva@gmail.com>

pkgname=epson-inkjet-printer-m105
pkgver=1.0.1
pkgrel=1
pkgdesc="Epson M105/M100/M200 inkjet printer driver (official Epson package)"
arch=('x86_64')
url="https://download.ebz.epson.net/"
license=('custom')
options=('!strip' '!debug')
depends=('cups' 'ghostscript' 'cups-filters')
provides=('epson-inkjet-printer-201215w')
conflicts=('epson-inkjet-printer-201215w')
source=("https://download-center.epson.com/f/module/5e7bd6ce-e857-486c-ab78-d4387d665759/epson-inkjet-printer-201215w_${pkgver}-1_amd64.deb")
sha256sums=('f764f04e580024bba9a5ce04e685e23d4911cb05a3f99762d35ff4d7507ee5c3')

package() {

  cd "$srcdir"

  # Extract Debian package
  ar x epson-inkjet-printer-201215w_${pkgver}-1_amd64.deb
  tar -xf data.tar.gz

  # Install Epson directory to /opt
  install -dm755 "$pkgdir/opt"
  cp -r opt/epson-inkjet-printer-201215w "$pkgdir/opt/"

  # Install CUPS filter
  install -dm755 "$pkgdir/usr/lib/cups/filter"
  install -m755 \
    opt/epson-inkjet-printer-201215w/cups/lib/filter/epson_inkjet_printer_filter \
    "$pkgdir/usr/lib/cups/filter/"

  # Install shared libraries
  install -dm755 "$pkgdir/usr/lib"
  install -m755 \
    opt/epson-inkjet-printer-201215w/lib64/libEpson_201215w.so.1.0.1 \
    "$pkgdir/usr/lib/"
  install -m755 \
    opt/epson-inkjet-printer-201215w/lib64/libEpson_201215w.MT.so.1.0.1 \
    "$pkgdir/usr/lib/"

  # Install PPD
  install -dm755 "$pkgdir/usr/share/ppd"
  gunzip -c \
    opt/epson-inkjet-printer-201215w/ppds/Epson/Epson-M105_Series-epson-driver.ppd.gz \
    > "$pkgdir/usr/share/ppd/Epson-M105_Series-epson-driver.ppd"

  # Install license
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 \
    opt/epson-inkjet-printer-201215w/doc/COPYING.EPSON \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
