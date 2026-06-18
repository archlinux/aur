# Maintainer: BoBeR182 <aur AT nullvoid DOT me>
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Dominika Solarz <dominikasolarz@gmail.com>
# Contributor: J!PRA

pkgname=openlierox
pkgver=0.58_rc5
pkgrel=5
pkgdesc="An extremely addictive realtime worms shoot-em-up backed by an active gamers community"
arch=(i686 x86_64)
license=("GPL")
url="http://openlierox.sourceforge.net/"
depends=("sdl" "sdl_mixer" "sdl_image" "hawknl" "gd" "zlib" "libxml2" "libzip")
makedepends=("gendesk" "cmake")
source=("http://downloads.sourceforge.net/sourceforge/openlierox/OpenLieroX_${pkgver}.src.tar.bz2"
        "options.cfg"
        "OpenLieroX.png")
md5sums=('9899f4c7e11eb02abe5bebfbdef80dcb'
         '04d00deb6521b3fbcdba6e9546ae67cf'
         'f2aec85a3ad86a6cf7d1362f31b38e51')

prepare() {
  cd $srcdir/OpenLieroX
  gendesk -f -n --pkgname OpenLieroX --pkgdesc "${pkgdesc}" --exec "openlierox" --categories "Game;Shooter;ActionGame"
  # CMake >= 3.31 no longer allows policies set to OLD
  sed -i 's/cmake_policy(SET CMP0005 OLD)/cmake_policy(SET CMP0005 NEW)/' CMakeOlxCommon.cmake
  sed -i 's/cmake_policy(SET CMP0003 OLD)/cmake_policy(SET CMP0003 NEW)/' CMakeOlxCommon.cmake
  sed -i 's/cmake_policy(SET CMP0011 OLD)/cmake_policy(SET CMP0011 NEW)/' CMakeOlxCommon.cmake
  # Bump minimum CMake version to silence deprecation warnings
  sed -i 's/cmake_minimum_required(VERSION 2\.4)/cmake_minimum_required(VERSION 3.5)/' CMakeOlxCommon.cmake
  # Fix missing libxml2 include for xmlNodePtr
  sed -i '/#include <libxml\/xmlmemory.h>/a #include <libxml/tree.h>' include/XMLutils.h
  # Fix libxml2 const-correctness for structured error handler
  sed -i 's/static void xmlErrorHandlerDummy(void \*, xmlErrorPtr)/static void xmlErrorHandlerDummy(void *, const xmlError *)/' src/common/StringUtils.cpp
  # Fix missing <cstdint> include for uint32_t
  sed -i '/#include <cmath>/a #include <cstdint>' include/MathLib.h
}

build() {
  cd $srcdir/OpenLieroX
  if [ -d bd ]
  then
    rm -rf bd
  fi

  mkdir bd && cd bd
  cmake -DSYSTEM_DATA_DIR=/usr/share \
        -DDEBUG=OFF  \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        ..
  make
}

package() {
  cd $srcdir/OpenLieroX
  install -Dm755 bd/bin/openlierox $pkgdir/usr/bin/openlierox
  install -dm755 $pkgdir/usr/share/OpenLieroX
  cp -r share/gamedir/* $pkgdir/usr/share/OpenLieroX/
  find "${pkgdir}/usr/share/OpenLieroX"  -type d -print0 | xargs -0 -- chmod 755
  find "${pkgdir}/usr/share/OpenLieroX" -type f -print0 | xargs -0 -- chmod 644
  install -Dm644 OpenLieroX.desktop "${pkgdir}/usr/share/applications/OpenLieroX.desktop"
  install -Dm644 "${srcdir}/OpenLieroX.png" "${pkgdir}/usr/share/pixmaps/OpenLieroX.png"
  install -Dm644 ${srcdir}/options.cfg "${pkgdir}/usr/share/OpenLieroX/cfg/options.cfg"
}
