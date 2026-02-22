# Maintainer: Stitchless
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.70.2
pkgrel=1
pkgdesc="Engine for running Transport Tycoon Deluxe with JGR's patch pack"
arch=('i686' 'x86_64')
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
b2sums=('e8a0ca77593defef7556fd4f17c5543846e68f6eef2ae9a04753a540cbf9da8a890f4b09a52959b208e50138ed17fb7e8e3b029e38bebd050f6696639cba7dda')
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
