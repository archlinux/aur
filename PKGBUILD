# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=cenon
pkgver=4.0.2
_libver=4.0.0
pkgrel=1
pkgdesc="GNUstep vector editor for EPS, DXF, Gerber, HPGL.  Includes docs and examples."
arch=('i686' 'x86_64')
url="http://www.cenon.info"
license=('custom:vhfPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gnustep-make' 'gcc-objc')
options=('!strip')
#source=(http://www.vhf-group.com/vhf-interservice/download/source/Cenon-$pkgver.tar.bz2
#  http://www.vhf-group.com/vhf-interservice/download/source/CenonLibrary-$_libver-1.tar.bz2
#  http://www.vhf-group.com/vhf-interservice/download/doc/Cenon-4.0_gb.pdf
source=("http://www.cenon.zone/download/source/Cenon-$pkgver.tar.bz2"
  "http://www.cenon.zone/download/source/CenonLibrary-$_libver-1.tar.bz2"
  "http://www.cenon.zone/download/doc/Cenon-4.0_gb.pdf"
  gcc47.patch)
md5sums=('ba6519d09106a250cbec72b28f970bbc'
         '5d7542f054b4ac3eb630c360d3752aa8'
         'SKIP'
         '015e2c1538788eb42c1320353a2da6e5')

build() {
  cd "$srcdir/Cenon"

  patch -p1 VHFShared/vhfCompatibility.h "$srcdir/gcc47.patch"
  export CFLAGS="$CFLAGS -g"
  export CXXFLAGS="$CXXFLAGS -g"

  make GNUSTEP_MAKEFILES="/usr/share/GNUstep/Makefiles/" \
       GNUSTEP_LOCAL_LIBRARY="/usr/lib/GNUstep/Libraries/" \
       GNUSTEP_LOCAL_APPS="/usr/share/"
}

package() {
  cd "$srcdir/Cenon"
  install -d "$pkgdir/usr/lib/GNUstep/Libraries/"
  install -d "$pkgdir/usr/share/"
  sed -i 's/chmod/#&/' GNUmakefile.postamble
  sed -i 's/cp/#&/' GNUmakefile.postamble
  make DESTDIR="$pkgdir" \
       GNUSTEP_MAKEFILES="/usr/share/GNUstep/Makefiles/" \
       GNUSTEP_LOCAL_LIBRARY="$pkgdir/usr/lib/GNUstep/Libraries/" \
       GNUSTEP_LOCAL_APPS="/usr/share/" \
       install

  chmod -R ugo+rX "$pkgdir"/usr/share/Cenon.*

  install -d "$pkgdir/usr/share/doc/cenon/"
  # yeah, yeah.  use install
  cp -R Devices/ "$pkgdir/usr/share/doc/cenon/"
  cp -R Documentation/ "$pkgdir/usr/share/doc/cenon/"
  cp -R Examples/ "$pkgdir/usr/share/doc/cenon/"
  cp -R Projects/ "$pkgdir/usr/share/doc/cenon/"
  cp ../../Cenon-4.0_gb.pdf "$pkgdir/usr/share/doc/cenon/Documentation/"

  # figure out how to fix the library path for real
  #touch "$pkgdir/usr/bin/cenon"
  #chmod +x "$pkgdir/usr/bin/cenon"
  #echo "#!/bin/sh" >> "$pkgdir/usr/bin/cenon"
  #echo "LD_LIBRARY_PATH=\"/usr/lib/GNUstep/Libraries\" Cenon" >> "$pkgdir/usr/bin/cenon"
}



