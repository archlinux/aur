# Maintainer: Stitchless
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.72.0
pkgrel=1
pkgdesc="Engine for running Transport Tycoon Deluxe with JGR's patch pack"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/JGRennison/OpenTTD-patches'
license=('GPL-2.0-only')
provides=("$pkgname")
conflicts=("$pkgname")
depends=(
  'fluidsynth'
  'fontconfig'
  'hicolor-icon-theme'
  'lzo'
  'sdl2-compat'
)
makedepends=('cmake')
optdepends=(
  'openttd-jgrpp-opengfx: free graphics'
  'openttd-jgrpp-opensfx: free sound set'
  'openttd-jgrpp-openmsx: free music set'
)
source=("$url/archive/jgrpp-$pkgver.tar.gz")
b2sums=('16b31326baaa3567288fa7ff4abec222ddb4c63db36012fb0a4a10e31326514a5e3d71f39c8957c41144dad892b8b2c7f36948ea6fab429af0838aab50d1ffe9')
_dirname="OpenTTD-patches-jgrpp"

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D BINARY_NAME="$pkgname" \
    -D CMAKE_INSTALL_BINDIR="bin" \
    -D CMAKE_INSTALL_DATADIR="/usr/share" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D PERSONAL_DIR=".$pkgname" \
    -S "$_dirname-$pkgver"

  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  sed -i "s|^Name=OpenTTD+JGRPP$|Name=OpenTTD (JGR Patch Pack)|g" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -D -m644 "$_dirname-$pkgver/COPYING.md" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
