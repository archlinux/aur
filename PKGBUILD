# Maintainer: Angelo Theodorou <encelo@gmail.com>

pkgname=nctracer-git
pkgver=r35.089dde7
pkgrel=1
pkgdesc="An ImGui front-end to the pmTracer library made with the nCine"
arch=('i686' 'x86_64')
url="http://ncine.github.io"
license=('MIT')
depends=('glew' 'libpng' 'sdl2' 'lua' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
conflicts=('nctracer')
provides=('nctracer')
options=(!strip)
source=(
  'git+https://github.com/encelo/ncTracer'
  'git+https://github.com/encelo/ncTracer-data'
  'git+https://github.com/nCine/nCine'
  'git+https://github.com/nCine/nCine-data'
  'git+https://github.com/encelo/pmTracer'
)
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/ncTracer"
  ( set -o pipefail
    git describe --tags --long --exact-match 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -S nCine -B nCine-build\
        -DCMAKE_BUILD_TYPE=Release\
        -DNCINE_DYNAMIC_LIBRARY=OFF\
        -DNCINE_PREFERRED_BACKEND=SDL2\
        -DNCINE_WITH_THREADS=ON\
        -DNCINE_WITH_WEBP=OFF\
        -DNCINE_WITH_AUDIO=OFF\
        -DNCINE_WITH_SCRIPTING_API=OFF\
        -DNCINE_BUILD_TESTS=OFF
  make -C nCine-build

  mkdir -p build && cd build

  cmake ../ncTracer\
        -DCMAKE_BUILD_TYPE=Release\
        -DnCine_DIR=$PWD/../nCine-build\
        -DPMTRACER_ROOT=$PWD/../pmTracer\
        -DNCPROJECT_BUILD_ANDROID=OFF\
        -DNCPROJECT_STRIP_BINARIES=ON\
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=$pkgdir PREFIX= install
  install -Dm0644 $srcdir/ncTracer/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
