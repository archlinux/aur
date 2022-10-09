# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=invader-git
pkgver=0.51.3.r3993.56391735
pkgrel=1
pkgdesc="An open source toolkit for creating maps and assets for Halo: Combat Evolved (git build)"
depends=('libtiff' 'libarchive' 'libsquish' 'flac' 'freetype2' 'libsamplerate'
         'libvorbis' 'qt6-base' 'sdl2' 'zlib')
makedepends=('cmake' 'corrosion' 'git' 'ninja' 'python' 'rust')
arch=('x86_64')
url="https://invader.opencarnage.net"
license=('GPL3')
source=("git+https://github.com/SnowyMouse/${pkgname%-git}.git"
        "git+https://github.com/SnowyMouse/riat.git")
sha256sums=('SKIP'
            'SKIP')
provides=('invader')
conflicts=('invader')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd invader
  git submodule init
  git config submodule.riat.url "${srcdir}/riat"
  git submodule update
}

build() {
  cmake -S "${pkgname%-git}" \
    -G Ninja \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
