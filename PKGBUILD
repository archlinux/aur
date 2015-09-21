# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Andrew Meakovski <meako689@gmail.com>
# PKGBUILD based on: Robert Mihaly <robb.mihaly@gmail.com>
# PKGBUILD based on: Gary Ayre <catchfire@gmail.com>
# PKGBUILD based on: Eric Le Bras <eric.lebras@gmail.com>

printername="mg2100"
printercode=386 #Codename for driver
pkgname=cnijfilter-${printername}
pkgver=3.60
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Pixma ${printername} (MG2140, MG2150, etc) multifunction"
arch=('x86_64')
url="http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MG_series/PIXMA_MG2140.aspx?DLtcmuri=tcm:13-863337&page=1&type=download"
license=('GPL2' 'LGPL2' 'custom')
depends=('libglade' 'cups' 'ghostscript')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
conflicts=('cnijfilter-common')
install=cnijfilter-${printername}.install
source=("http://gdlp01.c-wss.com/gds/8/0100003928/01/cnijfilter-source-${pkgver}-${pkgrel}.tar.gz" "cups.patch" "id.po.patch" "png.patch")
#source=("http://files.canon-europe.com/files/soft40869/software/cnijfilter-source-${pkgver}-${pkgrel}.tar.gz" "cups.patch" "id.po.patch" "png.patch")
md5sums=('70e412331a21f4b573b4e901c89cee18' 'a8a716cad93bd90853129c46006f20ad' '35327dc628d1a22ed0f4db9554d67484' '55f00585a45cf14944b4542c5ab71a76')

package() {
  cd ${srcdir}
  tar xzf cnijfilter-source-${pkgver}-${pkgrel}.tar.gz

  patch -Np0 -i $srcdir/cups.patch || return 1
  patch -Np0 -i $srcdir/id.po.patch || return 1
  patch -Np0 -i $srcdir/png.patch || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/backend
  ./autogen.sh --prefix=/usr --program-suffix=${printername} --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/libs
  ./autogen.sh --prefix=/usr --program-suffix=${printername} || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/pstocanonij
  ./autogen.sh --prefix=/usr --program-suffix=${printername} --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/cngpij
  ./autogen.sh --prefix=/usr --program-suffix=${printername} --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/ppd
  ./autogen.sh --prefix=/usr --program-suffix=${printername} || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=${printername} --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/printui
  ./autogen.sh --prefix=/usr --program-suffix=${printername} --datadir=/usr/share --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=${printername} --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=${printername} --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 ${printercode}/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 ${printercode}/libs_bin64/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
  ln -s /usr/lib/cups/filter/pstocanonij${printername} ${pkgdir}/usr/lib/cups/filter/pstocanonij
  chown -R root:root ${pkgdir}/usr/

}
