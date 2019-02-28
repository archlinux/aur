# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=dhewm3-git
pkgver=1.5.0.r16.17c10d4
pkgrel=1
epoch=1
pkgdesc="Doom 3 engine with native 64-bit support, SDL, and OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/dhewm/dhewm3"
license=('GPL3')
depends=('curl' 'doom3-data' 'libjpeg' 'libvorbis' 'openal' 'sdl2')
makedepends=('cmake' 'git')
conflicts=('dhewm3')
provides=('dhewm3')
source=("git+$url"
        'dhewm3.desktop')
sha256sums=('SKIP'
            '7c9ae892c6cf0453fcd57731689ccedac8f8ce10f33043f7dd5fb66bd73d1287')

pkgver() {
  cd "${pkgname/-git/}"

  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${pkgname/-git/}/neo"

  CXXFLAGS='-DLINUX_DEFAULT_PATH=\"/usr/share/games/doom3\"' cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DD3XP=1 -DDEDICATED=1 .
  make
}

package() {
  cd "${pkgname/-git/}/neo"

  make DESTDIR="$pkgdir" libdir="$pkgdir/usr/lib" install
  install -Dm644 ../../dhewm3.desktop "$pkgdir/usr/share/applications/dhewm3.desktop"
}
