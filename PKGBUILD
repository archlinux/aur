# Maintainer: Caepom <caepom at gmail dot com>

pkgname='prboom-plus-um-git'
pkgver=2.6um.r99.ge08e728b
pkgrel=1
pkgdesc='An advanced, Vanilla-compatible Doom engine based on PrBoom. Includes support for UMAPINFO'
url='https://github.com/coelckers/prboom-plus'
arch=('x86_64' 'i686')
license=('GPL2')
depends=('sdl2')
makedepends=('cmake' 'git')
optdepends=('fluidsynth: Midi support'
            'portmidi: Midi support'
            'libmad: MP3 support'
            'libvorbis: Ogg support'
            'dumb: Tracker support'
            'sdl2_mixer: Midi support'
            'sdl2_net: Network play'
            'sdl2_image: High-res textures and PNG screenshots'
            'glu: OpenGL rendering'
            'pcre: Demo file name pattern matching')
provides=('prboom-plus')
conflicts=('prboom-plus-svn' 'prboom-plus' 'prboom-plus-um')
source=("git+https://github.com/coelckers/prboom-plus.git")
sha1sums=('SKIP')

pkgver() {
  cd "prboom-plus"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -B build -S "prboom-plus/prboom2" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

