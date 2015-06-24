# Maintainer: Alex <devkral at web.de>

#THANKS: mouse256
#THANKS:  Jakob Nixdorf
#THANKS: http://eduard-dopler.de/111/canon-mp640-unter-ubuntu-installieren/
#TODO: remove [] from AM_CONFIG_HEADERS and re-add config.h

#autotools is black magic created by some stoned vodoo priests and the driver quality extremely bad.
#So don't wonder when this package sometimes stopped building. But I will do my best to fix this mess.

pkgname=cupsdriver-mp640
pkgver=3.20
pkgrel=10
install=cnijfilter.install
pkgdesc="Canon Printer Driver (For Multifunction MP640) (build from source with grayscale support and quality selection via updated ppd)"
url="http://software.canon-europe.com/products/0010757.asp"
arch=('i686' 'x86_64')
license=('custom')

#yes for building
#use better ppd (from the blog)
betterppd="yes"

#yes for building
#warning: gtk2 doesn't work because of this dataroot which isn't transformed fix sed transformation, I hate this driver
buildgtk="no"

if [ "${CARCH}" = 'x86_64' ]; then
if [ "$buildgtk" = "yes" ]; then
	depends=('lib32-libcups' 'cups' 'lib32-popt' 'ghostscript' 'lib32-libtiff' 'lib32-libpng' 'lib32-gtk2')
else
	depends=('lib32-libcups' 'cups' 'lib32-popt' 'ghostscript' 'lib32-libtiff' 'lib32-libpng')
fi

	makedepends=('gcc-multilib')
else
  if [ "$buildgtk" = "yes" ]; then
    depends=('cups' 'popt' 'ghostscript' 'libtiff' 'libpng' 'gtk2')
  else
    depends=('cups' 'popt' 'ghostscript' 'libtiff' 'libpng')
  fi
fi

conflicts=('cnijfilter-mp640')
source=('http://files.canon-europe.com/files/soft37280/Software/IJ_Linux_Printer_Driver_Source_320.tar'
	'libpng15.patch'
	'unknown-chars.patch'
	'fixautomake.patch'
	'fixconfigh.patch'
	'cups.patch'
	'id.patch'
	'cnijfilter.install'
	'canonmp640+.ppd') # a better ppd with grayscale support
	#'missing-include.patch' 
	#'remove-broken-po.patch'
sha256sums=('ef1e6da87aa0ecfd61a22a128321d0163c6566e60b9cbe6a4bd29f4742103299'
            'da3333adfca8e319aa197bc87ec8e88a58ccb666c0e944ae72bd737140a6158e'
            'b18e0d02d2272be390199a67637886b2a718fa9836fe73badae937d0200ddfd7'
            'afbc2caf4783b151a37d4ac26771f54db89d17fe7d71ea4f649f0a04904346ac'
            'd4de612eb476762c569aee63dc241e01cc90656d88cfc7a85b133527a7f379ba'
            '0f3aadea09d84fc981c4cd4be511eba81fa72552329f66166f38b0e279716541'
            '8edfc00b955895e9c4dbe1707ba700c8efee212a6b5fde46b80f2a92e5a0df38'
            '169f64e900af2d098471c70b3da47aeea5194a547a6c1d1e3734f497f0916e25'
            'cdf8b1f9df5cf2c3898a10b8606187bda686a3cc7eeca7d2f8b36ad5a328a369')

#
build() {
  if [ "${CARCH}" = 'x86_64' ]; then
	export CC="gcc -m32 -D_IPP_PRIVATE_STRUCTURES"
	export CXX="g++ -m32 -D_IPP_PRIVATE_STRUCTURES"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	LIBDIR="--libdir=/usr/lib32"
  fi
  cd "${srcdir}"
  #install -d ${pkgdir}
  tar -xf IJ_Linux_Printer_Driver_Source_320.tar
  tar -xf cnijfilter-source-3.20-1.tar.gz
  cd "${srcdir}"/cnijfilter-source-3.20-1
  patch -Np0 -i ../libpng15.patch
  #######patch -Np0 -i ../missing-include.patch
  patch -Np0 -i ../unknown-chars.patch
  ########patch -Np0 -i ../remove-broken-po.patch
  patch -Np0 -i ../fixautomake.patch
  patch -Np0 -i ../fixconfigh.patch
  patch -Np1 -i ../cups.patch
  patch -Np1 -i ../id.patch
  
  
  
  rename configure.in configure.ac "${srcdir}"/cnijfilter-source-3.20-1/{libs,ppd,cngpij,cngpijmon,lgmon,cnijfilter,pstocanonij,backend,backendnet,printui}/*
  sed -i -e "s/AM_CONFIG_HEADERS/#AC_CONFIG_HEADERS/g" "${srcdir}"/cnijfilter-source-3.20-1/{libs,ppd,cngpij,cngpijmon,lgmon,cnijfilter,pstocanonij,backend,backendnet,printui}/configure.ac
  sed -i -e "s/configure.in/configure.ac/g" "${srcdir}"/cnijfilter-source-3.20-1/{libs,ppd,cngpij,cngpijmon,lgmon,cnijfilter,pstocanonij,backend,backendnet,printui}/autogen.sh
  sed -i -e "s|#include \"config.h\"||g" -e "s|#include <config.h>||g" -e "s|#include	\"config.h\"||g" "${srcdir}"/cnijfilter-source-3.20-1/{cngpijmon,lgmon}/src/*
  
  #genius fix
  sed -i -e 's/${program_suffix}/mp640/g' "${srcdir}"/cnijfilter-source-3.20-1/*/configure.ac
}

package()
{
  if [ "${CARCH}" = 'x86_64' ]; then
	export CC="gcc -m32 -D_IPP_PRIVATE_STRUCTURES"
	export CXX="g++ -m32 -D_IPP_PRIVATE_STRUCTURES"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	LIBDIR="--libdir=/usr/lib32"
  fi
  #sed -i -e "s/AM_CONFIG_HEADERS(config.h/#AM_CONFIG_HEADERS([config.h]/g" "${srcdir}"/cnijfilter-source-3.20-1/{libs,ppd,cngpij,cngpijmon,lgmon,cnijfilter,pstocanonij,backend,backendnet,printui}/configure.in

  #first to compile
  cd "${srcdir}"/cnijfilter-source-3.20-1/libs
  ./autogen.sh --prefix=/usr $LIBDIR --enable-progpath=/usr/bin || return 1
  #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
  make
  make install DESTDIR="$pkgdir"
  
   cd "${srcdir}"/cnijfilter-source-3.20-1/ppd
  ./autogen.sh --program-suffix=mp640 --prefix=/usr $LIBDIR || return 1
  #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
  make
  make install DESTDIR="$pkgdir"
  
  cd "${srcdir}"/cnijfilter-source-3.20-1/cngpij
  ./autogen.sh --prefix=/usr  --enable-progpath=/usr/bin $LIBDIR || return 1
  #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
  make
  make install DESTDIR="$pkgdir"
  
  #needs gtk2
  if [ "$buildgtk" = "yes" ]; then
    cd "${srcdir}"/cnijfilter-source-3.20-1/cngpijmon
    ./autogen.sh --prefix=/usr  --enable-progpath=/usr/bin $LIBDIR || return 1
    #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
    make
    make install DESTDIR="$pkgdir"
   
    cd "${srcdir}"/cnijfilter-source-3.20-1/lgmon
    ./autogen.sh --prefix=/usr --program-suffix mp640 --enable-progpath=/usr/bin $LIBDIR || return 1
    #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
    make
    make install DESTDIR="$pkgdir"
  fi
  
  cd "${srcdir}"/cnijfilter-source-3.20-1/cnijfilter
  ./autogen.sh --program-suffix=mp640 --prefix=/usr --enable-libpath=/usr/lib/bjlib $LIBDIR || return 1
  #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
  make
  make install DESTDIR="$pkgdir"
    
  cd "${srcdir}"/cnijfilter-source-3.20-1/pstocanonij
  ./autogen.sh --prefix=/usr  --enable-progpath=/usr/bin $LIBDIR || return 1
   sed -i 's:filterdir =.*$:filterdir = /usr/lib/cups/filter:g' filter/Makefile
   #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
  make
  make install DESTDIR="$pkgdir"
  
  cd "${srcdir}"/cnijfilter-source-3.20-1/backend
  ./autogen.sh --prefix=/usr  --enable-progpath=/usr/bin $LIBDIR || return 1
  #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
  make
  make install DESTDIR="$pkgdir"
  
   cd "${srcdir}"/cnijfilter-source-3.20-1/backendnet
  ./autogen.sh --prefix=/usr  --enable-progpath=/usr/bin $LIBDIR || return 1
  #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
  make
  make install DESTDIR="$pkgdir"

  #needs gtk2  
  if [ "$buildgtk" = "yes" ]; then
    cd "${srcdir}"/cnijfilter-source-3.20-1/printui
    ./autogen.sh --prefix=/usr --program-suffix=mp640 --enable-progpath=/usr/bin $LIBDIR || return 1
    #sed -i -e 's|-DPACKAGE_DATA_DIR=\"\$$\\{datarootdir\\}/mp640/\"|-DPACKAGE_DATA_DIR=\"/usr/share/mp640/\"|g' Makefile
    make
    make install DESTDIR="$pkgdir"
  fi

	#if [ "${CARCH}" = 'x86_64' ]; then
		#hack
	#	mkdir -p $pkgdir/usr/lib/cups/filter
		#mv $pkgdir/usr/lib32/cups/filter/pstocanonij $pkgdir/usr/lib/cups/filter/pstocanonij
		#rmdir $pkgdir/usr/lib32/cups/filter
		#rmdir $pkgdir/usr/lib32/cups/
		#rmdir $pkgdir/usr/lib32
	#fi
	mkdir -p "$pkgdir"/usr/lib/ 2> /dev/null
	cp -a "${srcdir}"/cnijfilter-source-3.20-1/362/libs_bin/* "$pkgdir"/usr/lib/
	cp -a "${srcdir}"/cnijfilter-source-3.20-1/com/libs_bin/* "$pkgdir"/usr/lib/
	chmod 755 "$pkgdir"/usr/lib/*
	install -d "${pkgdir}"/usr/lib/bjlib
	install -m 755 "${srcdir}"/cnijfilter-source-3.20-1/362/database/* "${pkgdir}"/usr/lib/bjlib

  if [ "$betterppd" = "yes" ]; then
    rm "$pkgdir"/usr/share/cups/model/canonmp640.ppd
    install -m 755 "${srcdir}"/canonmp640+.ppd "$pkgdir"/usr/share/cups/model/canonmp640.ppd
  fi

	#chown 0:0 "$pkgdir"/usr/lib/*
	mkdir -p "$pkgdir"/usr/share/licenses/${pkgname}/ 2> /dev/null
	install -m 755 "${srcdir}"/EULA.txt "$pkgdir"/usr/share/licenses/${pkgname}
	install -m 755 "${srcdir}"/cnijfilter-source-3.20-1/LICENSE-cnijfilter-3.20EN.txt "$pkgdir"/usr/share/licenses/${pkgname}/
	
	
}
