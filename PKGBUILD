# Maintainer: Nicholas Wang <me@nicho1as.wang>
# PKGBUILD adapted from cnijfilter-mg2100
# Patch adapted from cnijfilter-mg2100 and cnijfilter-ip7200

printername="ip100"
printercode=303 #Codename for driver
pkgname=cnijfilter-${printername}
pkgver=3.70
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Pixma ${printername} (MG2140, MG2150, etc) multifunction"
arch=('x86_64')
url="https://www.canon-europe.com/support/consumer_products/products/printers/inkjet/pixma_ip_series/ip100.html?type=drivers&language=en&os=linux"
license=('GPL2' 'LGPL2' 'custom')
depends=('libglade' 'cups' 'ghostscript')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
conflicts=('cnijfilter-common')
install=cnijfilter-${printername}.install
source=("https://gdlp01.c-wss.com/gds/8/0100004118/01/cnijfilter-source-${pkgver}-${pkgrel}.tar.gz" "cups.patch" "png.patch" "id.po.patch" )
md5sums=('0f23002a95c4dc9e8b85fe612d0cff0b'
         'db2fb9cd651e459f9219b5fc556c3d0e'
         '872716942e916acabf43913f9b7bdcd9'
         'f1defa34fa288a9848db849144244d55')

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
