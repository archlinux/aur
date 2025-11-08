# Maintainer:
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

_pkgname="woof-doom"
pkgname="$_pkgname-git"
pkgver=15.2.0.r265.g4968b3c
pkgrel=1
pkgdesc="Doom port remaining faithful to Lee Killough's MBF on DOS"
arch=("x86_64")
url="https://github.com/fabiangreffrath/woof"
license=('GPL-2.0-or-later')

depends=(
  'hicolor-icon-theme'
  'libebur128'
  'libsndfile'
  'openal'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python'

  ## sdl3
  'jack'
  'wayland-protocols'
  'alsa-lib'
  'mesa'
  'libpulse'
  'libxrandr'
  'libxinerama'
  'wayland'
  'libxkbcommon'
  'ibus'
  'libxss'
  'pipewire'
  'libdecor'
  'vulkan-headers'
  'sndio'

  'libxext'
  'libxrender'
  'libx11'
  'libgl'
  'libxcursor'
  'hidapi'
  'libusb'
)
optdepends=(
  'fluidsynth'
  'libxmp'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "sdl3"::"git+https://github.com/libsdl-org/SDL.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --match='woof_*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build_sdl3
    -S sdl3
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev

    -DBUILD_SHARED_LIBS=OFF
    -DSDL_RPATH=OFF
    -DSDL_STATIC=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build_sdl3
  DESTDIR="fakeinstall" cmake --install build_sdl3

  _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev

    -DSDL3_DIR="$srcdir/fakeinstall/usr/lib/cmake/SDL3"
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
