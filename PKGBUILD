# Maintainer: Stitchless
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.69.0
pkgrel=1
pkgdesc="Engine for running Transport Tycoon Deluxe with JGR's patch pack"
arch=(x86_64)
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL-2.0-only' 'BSD-3-Clause' 'LGPL-2.1-or-later' 'MIT' 'Zlib')
depends=(fluidsynth fontconfig hicolor-icon-theme lzo sdl2-compat)
makedepends=(cmake ninja)
optdepends=(
  'openttd-jgrpp-opengfx: free graphics'
  'openttd-jgrpp-opensfx: free sound set'
  'openttd-jgrpp-openmsx: free music set'
)
options=(!debug)
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-$pkgver.tar.gz")
b2sums=('f1c3775ab2be738deacad12e7949f77dee7f3b25c87cd514a91188d8b5b658cfcdb3350ee44debd4aa12017f35a984bb39b162d2a8387f30cc201c06817acb79')

_dirname=OpenTTD-patches-jgrpp

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D BINARY_NAME="$pkgname" \
    -D CMAKE_INSTALL_BINDIR="bin" \
    -D CMAKE_INSTALL_DATADIR="/usr/share" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D PERSONAL_DIR=".$pkgname" \
    -G Ninja \
    -S "$_dirname-$pkgver"

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  sed -i "s|^Name=OpenTTD+JGRPP$|Name=OpenTTD (JGR Patch Pack)|g" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -D -m644 "$_dirname-$pkgver/COPYING.md" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
