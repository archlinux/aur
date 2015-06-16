# Maintainer: redden0t8 -- contact via Arch Linux forums or AUR
# 
# PKGBUILD based off of official cups-pdf package
#
# Official package credit:
# 	Maintainer: Andreas Radke <andyrtr at archlinux.org>
# 	Contributor: Thomas Baechler <thomas.baechler@rwth-aachen.de>

pkgname=cups-pdf-beta
pkgver=3.0beta2
pkgrel=1
pkgdesc="PDF printer for cups (beta)"
arch=(i686 x86_64)
depends=('cups' 'ghostscript')
provides=("cups-pdf=${pkgver}")
conflicts=('cups-pdf')
install=cups-pdf.install
url="http://www.cups-pdf.de/"
license=('GPL2')
source=("http://www.cups-pdf.de/src/cups-pdf_${pkgver}.tar.gz")
backup=(etc/cups/cups-pdf.conf)
md5sums=('fabfa3a96551a7dd2c466f8b120c13a5')

build() {
  cd $srcdir/cups-pdf-$pkgver/src
  [ -z "$CC" ] && CC=gcc
  $CC $CFLAGS -lcups -Wall -o cups-pdf cups-pdf.c
}

package() {
  cd $srcdir/cups-pdf-$pkgver/src
  install -D -m700 cups-pdf $pkgdir/usr/lib/cups/backend/cups-pdf

  # Install Postscript Color printer
  cd ../extra
  install -D -m644 CUPS-PDF_noopt.ppd $pkgdir/usr/share/cups/model/CUPS-PDF.ppd

  # Install config file
  install -D -m644 cups-pdf.conf $pkgdir/etc/cups/cups-pdf.conf
  
  # use lp group from cups pkg FS#36769
  chgrp -R lp ${pkgdir}/etc/cups
}
