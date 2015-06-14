# Maintainer: Daniel Hillenbrand <codeworkx [at] bbqlinux [dot] org>
# Modified original script from: Alessio Fachechi

pkgname=cnijfilter-mp560
pkgver=3.20
pkgsubver=1
pkgrel=4
pkgdesc="Canon IJ Printer Driver (MP560 series)"
url="http://software.canon-europe.com/products/0010756.asp"
arch=('i686')
license=('custom')
depends=('patch' 'libcups' 'cups' 'popt' 'ghostscript' 'gsfonts' 'atk>=1.9.0' 'gtk2>=2.8.0' 'pango>=1.12.3' 'libpng>=1.2.8' 'libtiff' 'cairo>=1.0.2' 'libxml2>=2.6.24' 'fontconfig>=2.3.0' 'libxinerama')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
conflicts=('cnijfilter-common')
install=cnijfilter-mp560.install

source=(http://gdlp01.c-wss.com/gds/7/0100002367/01/cnijfilter-source-3.20-1.tar.gz
        grayscale.patch
        cups.patch
        libpng15.patch
        cnij.patch)

md5sums=('0a40b46016511d59d1d0a3d3d9a653dd' 
         'f3d01db16494ae9ca16d9be8e9cd193b' 
         'abd0c2ee747e20558adcf327bb3a8633' 
         'e75b117cd7a399c0861c4e8e10c30294'
         '20e5efa2627f7176a3aa5984e44f1807')

prepare() {

  patch -p0 -d ${srcdir}/cnijfilter-source-${pkgver}-${pkgsubver}/ppd < grayscale.patch

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgsubver}
  patch -p1 -i ${srcdir}/cups.patch
  patch -p1 -i ${srcdir}/libpng15.patch
  patch -p1 -i ${srcdir}/cnij.patch
  
} 

build() {
  
  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgsubver}/libs
  ./autogen.sh --prefix=/usr  --program-suffix=mp560
  make 

  for _dir in cngpij cnijfilter pstocanonij lgmon backend backendnet cngpijmon/cnijnpr
    do 
      cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgsubver}/${_dir}
      ./autogen.sh --prefix=/usr --program-suffix=mp560 --enable-progpath=/usr/bin
      make
    done

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgsubver}/ppd
  ./autogen.sh --prefix=/usr --program-suffix=mp560
  make 
   
} 

package() {

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgsubver}/libs
  make install DESTDIR=${pkgdir} 

  for _dir in cngpij cnijfilter pstocanonij lgmon backend backendnet cngpijmon/cnijnpr
    do 
      cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgsubver}/${_dir}
      make install DESTDIR=${pkgdir}
    done

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgsubver}/ppd
  make install DESTDIR=${pkgdir}

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgsubver}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 360/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 360/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -s -m 755 com/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
  
}
