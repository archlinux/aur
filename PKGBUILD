# Maintainer: loathingkernel <username at gmail dot com>

pkgbase=sdl-jstest
pkgname=('sdl-jstest' 'sdl2-jstest')
pkgver=0.2.1.r25.95784a3
_commit=95784a322faf66f7af79bc883508c8d827ed77b2
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
        sdl-jstest-cmake.patch
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '615d8ff2a8acb0bd0986652f0aeb366947d12b53ae4ba8d7cbdb19e94e521126'
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

  patch -p1 -i "${srcdir}"/sdl-jstest-cmake.patch
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
