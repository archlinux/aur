# Maintainer: Stitchless
# Previous Maintainers: Sam S <smls75@gmail.com>, Gustavo Ramos Rehermann <rehermann6046@gmail.com>
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

_pkgname=openttd-jgrpp
pkgname="$_pkgname-git"
pkgver=0.70.2.r8.g5024b26de0
pkgrel=1
pkgdesc="Engine for running Transport Tycoon Deluxe with JGR's patch pack"
arch=('i686' 'x86_64')
url='https://github.com/JGRennison/OpenTTD-patches'
license=('GPL-2.0-only')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=(
  'fluidsynth'
  'fontconfig'
  'hicolor-icon-theme'
  'lzo'
  'sdl2-compat'
)
makedepends=(
  'cmake'
  'git'
)
optdepends=(
  'openttd-jgrpp-opengfx: free graphics'
  'openttd-jgrpp-opensfx: free sound set'
  'openttd-jgrpp-openmsx: free music set'
)
_gitname="OpenTTD-patches"
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^jgrpp\.//'
}

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D BINARY_NAME="$_pkgname" \
    -D CMAKE_INSTALL_BINDIR="bin" \
    -D CMAKE_INSTALL_DATADIR="/usr/share" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D PERSONAL_DIR=".$_pkgname" \
    -S "$_gitname"

  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  sed -i "s|^Name=OpenTTD+JGRPP$|Name=OpenTTD (JGR Patch Pack)|g" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -D -m644 "$_gitname/COPYING.md" "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
