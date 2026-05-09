# Maintainer: Stitchless
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.72.2
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
b2sums=('645372bf1a92f4d11eec027fc5983e97dc4d33fe9df466f541aa30da5b9888fdb6ef4d80d6d6281369a1f5c31c6f594f26f716cb7b63a51293bb5c11f57be503')
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
