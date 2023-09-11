# Maintainer: loathingkernel <username at gmail dot com>

pkgbase=sdl-jstest
pkgname=('sdl-jstest' 'sdl2-jstest')
pkgver=0.2.2.r12.e41cb80
_commit=e41cb8081789b54244bb589fff08adc916cf7d64
pkgrel=1
pkgdesc="Simple SDL joystick test application for the console"
url="https://gitlab.com/sdl-jstest/sdl-jstest.git"
arch=('x86_64')
license=('GPLv3')
depends=('ncurses')
makedepends=('sdl' 'sdl2' 'git' 'cmake' 'docbook2x')

source=(git+https://gitlab.com/sdl-jstest/sdl-jstest.git#commit=${_commit}
        git+https://github.com/grumbel/tinycmmc.git
        git+https://github.com/gabomdq/SDL_GameControllerDB.git
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
)

pkgver() {
  cd sdl-jstest
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//g')"
}

prepare() {
  cd sdl-jstest

  git submodule init external/{sdl_gamecontrollerdb,tinycmmc}
  git config submodule.external/sdl_gamecontrollerdb.url ../SDL_GameControllerDB
  git config submodule.external/tinycmmc.url ../tinycmmc
  git -c protocol.file.allow=always submodule update external/{sdl_gamecontrollerdb,tinycmmc}
}

build() {
	cmake \
    -S sdl-jstest \
    -B build-sdl \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SDL_JSTEST=ON \
    -DBUILD_SDL2_JSTEST=OFF \
    -DBUILD_TESTS=OFF
    
  cmake --build build-sdl

	cmake \
    -S sdl-jstest \
    -B build-sdl2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SDL_JSTEST=OFF \
    -DBUILD_SDL2_JSTEST=ON \
    -DBUILD_TESTS=OFF
  cmake --build build-sdl2

}

package_sdl-jstest() {
  depends+=('sdl')

  DESTDIR="${pkgdir}" cmake --install build-sdl
}

package_sdl2-jstest() {
  depends+=('sdl2')

  DESTDIR="${pkgdir}" cmake --install build-sdl2
}
