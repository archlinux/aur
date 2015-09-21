# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Doktor Schliemann <doktor.schliemann@gmail.com>
# Original Contributors: Fortunato Ventre (voRia) <vorione@gmail.com>
#			 Custom Processing Unlimited (CPUnltd) <CPUnltd@gmail.com>
#			 Giancarlo Bianchi <giancarlobianchi76@gmail.com>
#			 Nopsty <michi@nicce.at>
#			 Michael Unterkalmsteiner (mun) <miciu@gmx.de>
#			 Giancarlo Bianchi <giancarlobianchi76@gmail.com>
pkgname=cnijfilter-mg3100
pkgver=3.60
pkgrel=5
_pkgver=3.60-1
pkgdesc="Canon IJ Printer Driver (for MG3100 series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100392802.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('libcups' 'cups' 'popt' 'ghostscript' 'gsfonts' 'atk>=1.9.0' 'gtk2>=2.8.0' 'pango>=1.12.3' 'libpng>=1.5' 'libtiff' 'cairo>=1.0.2' 'libxml2>=2.6.24' 'fontconfig>=2.3.0' 'libxinerama')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
conflicts=('cnijfilter-common')
install=cnijfilter-mg3100.install
source=(http://gdlp01.c-wss.com/gds/8/0100003928/01/cnijfilter-source-${_pkgver}.tar.gz
	'build-fixes.patch'
	'cups.patch'
	'id.po.patch'
	'libpng15.patch')

package() {
  if [ "$CARCH" == "x86_64" ]; then  
    libdir=libs_bin64
  else
    libdir=libs_bin32
  fi

  ## Patches
  patch -p0 < build-fixes.patch
  patch -p0 < cups.patch
  patch -p0 < id.po.patch
  patch -p0 < libpng15.patch

  ## Compile and install mg3100 stuff
  # ppd file
  cd ${srcdir}/cnijfilter-source-${_pkgver}/ppd
  ./autogen.sh --prefix=/usr --enable-ppdpath=/usr/share/cups/model --program-suffix=mg3100
  make clean
  make
  make DESTDIR=${pkgdir} install

  # cnijfilter
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter
  autoreconf -i
  ./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --program-suffix=mg3100
  make clean
  make
  make DESTDIR=${pkgdir} install

  # printui
  cd ${srcdir}/cnijfilter-source-${_pkgver}/printui
  ./autogen.sh --prefix=/usr --datadir=/usr/share --program-suffix=mg3100
  make clean
  make
  make DESTDIR=${pkgdir} install

  # lgmon
  cd ${srcdir}/cnijfilter-source-${_pkgver}/lgmon
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --program-suffix=mg3100
  make clean
  make
  make DESTDIR=${pkgdir} install

  # cngpijmon
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=mg3100
  make clean
  make
  make DESTDIR=${pkgdir} install
  
  ## Compile and install common stuff
  # libs
  cd ${srcdir}/cnijfilter-source-${_pkgver}/libs
  ./autogen.sh --prefix=/usr
  make clean
  make
  make DESTDIR=${pkgdir} install

  # cngpij
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
  make clean
  make
  make DESTDIR=${pkgdir} install

  # pstocanonij
  cd ${srcdir}/cnijfilter-source-${_pkgver}/pstocanonij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
  make clean
  make
  make DESTDIR=${pkgdir} install

  # backend
  cd ${srcdir}/cnijfilter-source-${_pkgver}/backend
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
  make clean
  make
  make DESTDIR=${pkgdir} install

  # backendnet
  cd ${srcdir}/cnijfilter-source-${_pkgver}/backendnet
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/${libdir}"
  make clean
  make
  make DESTDIR=${pkgdir} install

  # sm sub process
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr
  ./autogen.sh --prefix=/usr LDFLAGS="-ldl"
  make clean
  make
  make DESTDIR=${pkgdir} install

  # Install mg3100 libraries
  install -d ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgver}/387/${libdir}/*so.* ${pkgdir}/usr/lib/
  install -d ${pkgdir}/usr/lib/bjlib/
  install -m 644 ${srcdir}/cnijfilter-source-${_pkgver}/387/database/* ${pkgdir}/usr/lib/bjlib/

  # Install common libraries
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgver}/com/${libdir}/*so.* ${pkgdir}/usr/lib/
  install -m 666 ${srcdir}/cnijfilter-source-${_pkgver}/com/ini/* ${pkgdir}/usr/lib/bjlib/

  # Make symbolic links for libraries
  cd ${pkgdir}/usr/lib/
  ln -s libcnnet.so.1.2.2 libcnnet.so
  ln -s libcnbpcmcm387.so.8.10.1 libcnbpcmcm387.so
  ln -s libcnbpcnclapi387.so.3.6.1 libcnbpcnclapi387.so
  ln -s libcnbpcnclbjcmd387.so.3.3.0 libcnbpcnclbjcmd387.so
  ln -s libcnbpcnclui387.so.3.6.1 libcnbpcnclui387.so
  ln -s libcnbpess387.so.4.1.3 libcnbpess387.so
  ln -s libcnbpo387.so.1.0.2 libcnbpo387.so

  # Install license file
  cd ${srcdir}/cnijfilter-source-${_pkgver}
  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}
md5sums=('70e412331a21f4b573b4e901c89cee18'
         '5f4b3523f6542f0a90886e7e6264f19a'
         'e406c2629159b9608c4552a5343471f0'
         'e228560529d46e1f03617ba7bc9aa657'
         '0eb3e6f17c090b07490f4a5d01de49da')
