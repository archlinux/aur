# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on Aaron Paden <aaronbpaden@gmail.com> PKGBUILD for pcem
pkgname=pcem-git
_pkgname=pcem
pkgver=17.r250.gfbf5ece3
pkgrel=1
pkgdesc="Emulator for various IBM PC computers and clones - development version"
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL-2.0-or-later')
depends=('wxwidgets-gtk3' 'openal' 'sdl2-compat' 'alsa-lib' 'libpcap' 'libslirp')
makedepends=('git' 'cmake' 'clang')
conflicts=('pcem')
provides=("pcem=${pkgver}")
source=("git+https://github.com/sarah-walker-pcem/pcem.git"
        pcem.desktop
        pcem.svg
        COPYING)
sha256sums=('SKIP'
            '95d1594ee1b2807a25deeb63e67c43b4d4828a917ad5cf508a0a07e837aaf510'
            '31d9959d8e8b98204f396522fcc773767d0d7f6dd4bfdc28f5dc22928459e008'
            '61b65d8be67f0acb3a370ce0826c073b7c54a5c08b502ed6f7ffec94a300477f')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
  cd "${srcdir}/pcem"

  # New building part from Martian PKGBUILD. Thanks!
  export CC=clang
  export CXX=clang++
  export LDFLAGS="-Wl,--allow-multiple-definition"

  cmake -B build \
       -DCMAKE_BUILD_TYPE=Release \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DUSE_NETWORKING=ON \
       -DUSE_ALSA=ON

  cmake --build build
}

package() {
  cd "${srcdir}/pcem/"
  DESTDIR="${pkgdir}" cmake --install build
  # Based on pcem stable PKGBUILD
  install -Dm644 ../../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 ../../pcem.desktop "$pkgdir/usr/share/applications/pcem.desktop"
  install -Dm644 ../../pcem.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pcem.svg"

}

# vim:set ts=2 sw=2 et:

