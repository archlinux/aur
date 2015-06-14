# Maintainer: grimi <grimi at poczta dot fm>

_pkgname=fs-uae
pkgname=fs-uae-devel
pkgver=2.5.32dev
pkgrel=2
pkgdesc="Cross-platform Amiga emulator based on UAE/WinUAE (development version)."
arch=("i686" "x86_64")
url="http://fs-uae.net/download-devel"
license=("GPL2")
depends=("sdl2" "libpng" "openal" "mesa" "glu" "gettext" "freetype2" "hicolor-icon-theme" "xdg-utils")   # 'glib2' provided by 'gettext', and 'zlib' by 'libpng'
makedepends=('zip')
install="${pkgname}.install"
source=("http://fs-uae.net/devel/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
#source=("http://ppa.launchpad.net/fengestad/devel/ubuntu/pool/main/f/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz")
provides=("fs-uae")
conflicts=("fs-uae")
md5sums=('0ff24bf59a3442312ff8c063d663d9e0')

#MAKEFLAGS="-j1"




## alternative build method for 64bit platform ##
## (with multilib enabled)                     ##
## comment variable to build 64bit version     ##
## 0 = build 32bit jit version                 ##
## 1 and 2 = dual 32/64 bit                    ##
##   1 = default 32bit exe                     ##
##   2 = default 64bit exe                     ##
FSUAE3264=0



if [[ -n $FSUAE3264 && $CARCH == "x86_64" && -n $(gcc -v 2>&1|grep '\-\-enable-multilib') ]]; then
   if [[ $FSUAE3264 == [1-2] ]]; then
      depends+=("lib32-sdl2" "lib32-libpng" "lib32-glib2" "lib32-openal" "lib32-mesa" "lib32-glu" "lib32-gettext" "lib32-freetype2")
     pkgdesc="${pkgdesc/(dev/dual 64 and 32-bit dev}"
   elif [[ $FSUAE3264 == 0 ]]; then
      depends=("lib32-sdl2" "lib32-libpng" "lib32-glib2" "lib32-openal" "lib32-mesa" "lib32-glu" "lib32-gettext" "lib32-freetype2" "xdg-utils" "hicolor-icon-theme")
      pkgdesc="${pkgdesc/(dev/(32-bit dev}"
   fi
else
   unset FSUAE3264
fi



build() {
   cd ${_pkgname}-${pkgver}

   if [[ $FSUAE3264 != 0 ]]; then
      ./configure --prefix=/usr
      make
   fi

   if [[ $FSUAE3264 == [1-2] ]]; then
      cp fs-uae ../fs-uae-64
      cp fs-uae-device-helper ../
      make clean
   fi

   if [[ $FSUAE3264 == [0-2] ]]; then
      export CC="gcc -m32" CXX="g++ -m32" PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
      export CFLAGS="${CFLAGS/x86-64/i686}" CXXFLAGS="${CXXFLAGS/x86-64/i686}"
      ./configure --prefix=/usr
      make
   fi

   if [[ $FSUAE3264 == [1-2] ]]; then
      echo -e "#!/bin/sh\n[[ -z \$FSUAE_EXE ]] && FSUAE_EXE=$(($FSUAE3264*32))\nexec /usr/bin/fs-uae-\${FSUAE_EXE} \"\$@\"" > fs-uae.sh
   fi
}



package() {
   cd ${_pkgname}-${pkgver}

   make install DESTDIR="${pkgdir}"

   if [[ $FSUAE3264 == [1-2] ]]; then
      mv "${pkgdir}"/usr/bin/fs-uae{,-32}
      install -m755 ../fs-uae-64 "${pkgdir}"/usr/bin
      install -m755 ../fs-uae-device-helper "${pkgdir}"/usr/bin
      install -m755 fs-uae.sh "${pkgdir}"/usr/bin/fs-uae
   fi
}


# vim:set ts=3 sw=3 sts=3 et:

