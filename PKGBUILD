# Maintainer: Angelo Theodorou <encelo@gmail.com>

pkgname=spookyghost-git
pkgver=r71.d3660bf
pkgrel=1
pkgdesc="A procedural sprite animation tool made with the nCine"
arch=('i686' 'x86_64')
url="https://encelo.itch.io/spookyghost"
license=('MIT')
depends=('glew' 'libpng' 'sdl2' 'lua' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
conflicts=('spookyghost')
provides=('spookyghost')
options=(!strip)
source=('git+https://github.com/SpookyGhost2D/SpookyGhost')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/SpookyGhost"
  ( set -o pipefail
    git describe --tags --long --exact-match 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  git clone https://github.com/nCine/nCine || git -C nCine pull
  git clone https://github.com/nCine/nCine-data || git -C nCine-data pull
  git clone https://github.com/SpookyGhost2D/SpookyGhost-data || git -C SpookyGhost-data pull
}

build() {
  cmake -S nCine -B nCine-build\
        -DCMAKE_BUILD_TYPE=Release\
        -DNCINE_DYNAMIC_LIBRARY=OFF\
        -DIMGUI_VERSION_TAG=docking\
        -DNCINE_PREFERRED_BACKEND=SDL2\
        -DNCINE_WITH_THREADS=OFF\
        -DNCINE_WITH_WEBP=OFF\
        -DNCINE_WITH_AUDIO=OFF\
        -DNCINE_WITH_SCRIPTING_API=OFF\
        -DNCINE_BUILD_TESTS=OFF
  make -C nCine-build

  mkdir -p build && cd build

  cmake ../SpookyGhost\
        -DCMAKE_BUILD_TYPE=Release\
        -DnCine_DIR=$PWD/../nCine-build\
        -DNCPROJECT_BUILD_ANDROID=OFF\
        -DNCPROJECT_STRIP_BINARIES=ON\
        -DNCPROJECT_DATA_DIR_DIST=ON\
        -DCMAKE_INSTALL_PREFIX=/usr\
        -DCUSTOM_ITCHIO_BUILD=OFF
  make
}

package() {
  make -C build DESTDIR=$pkgdir PREFIX= install
  install -Dm0644 $srcdir/SpookyGhost/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
