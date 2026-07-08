# Maintainer: BoBeR182 <aur AT nullvoid DOT me>
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Dominika Solarz <dominikasolarz@gmail.com>
# Contributor: J!PRA

pkgname=openlierox
pkgver=20260708.16
pkgrel=1
pkgdesc="An extremely addictive realtime worms shoot-em-up backed by an active gamers community"
arch=(x86_64)
license=("LGPL-2.0-only")
url="https://github.com/openlierox/openlierox"
depends=(
  "sdl2"
  "sdl2_image"
  "gd"
  "zlib"
  "libzip"
  "libxml2"
  "curl"
  "openal"
  "freealut"
  "libvorbis"
  "yaml-cpp"
  "binutils"
  "libx11"
  "hicolor-icon-theme"
)
optdepends=("python: dedicated server scripts")
makedepends=("cmake" "boost" "git")
source=("git+https://github.com/openlierox/openlierox.git#tag=${pkgver}")
sha256sums=('68cbdb40af08826f48abb3553669099554879ca71e3c83e4ae6d6425da356d28')

prepare() {
  cd $srcdir/openlierox

  # Bump minimum CMake version to silence deprecation warnings on CMake >= 4.0
  sed -i 's/cmake_minimum_required(VERSION 2\.4)/cmake_minimum_required(VERSION 3.5)/' CMakeLists.txt CMakeOlxCommon.cmake

  # Fix missing <cstdint> include for GCC 14+
  sed -i '/#include <cmath>/a #include <cstdint>' include/MathLib.h
}

build() {
  cd $srcdir/openlierox

  cmake -B build \
    -DSYSTEM_DATA_DIR=/usr/share \
    -DDEBUG=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    .
  make -C build
}

package() {
  cd $srcdir/openlierox

  install -Dm755 build/bin/openlierox "$pkgdir/usr/bin/openlierox"

  install -Dm644 share/net.openlierox.OpenLieroX.desktop "$pkgdir/usr/share/applications/openlierox.desktop"
  install -Dm644 share/net.openlierox.OpenLieroX.appdata.xml "$pkgdir/usr/share/metainfo/net.openlierox.OpenLieroX.appdata.xml"

  install -Dm644 share/OpenLieroX.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/OpenLieroX.svg"
  install -Dm644 share/OpenLieroX.16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/OpenLieroX.png"
  install -Dm644 share/OpenLieroX.32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/OpenLieroX.png"
  install -Dm644 share/OpenLieroX.64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/OpenLieroX.png"
  install -Dm644 share/OpenLieroX.128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/OpenLieroX.png"
  install -Dm644 share/OpenLieroX.xpm "$pkgdir/usr/share/pixmaps/OpenLieroX.xpm"

  install -dm755 "$pkgdir/usr/share/OpenLieroX"
  cp -r share/gamedir/* "$pkgdir/usr/share/OpenLieroX/"
  find "$pkgdir/usr/share/OpenLieroX" -type d -print0 | xargs -0 -- chmod 755
  find "$pkgdir/usr/share/OpenLieroX" -type f -print0 | xargs -0 -- chmod 644
}
