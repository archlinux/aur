# Maintainer: Essem <smswessem@gmail.com>

_pkgname=furnace
pkgname=furnace-git
pkgver=r9500.845c5245c
pkgrel=1
pkgdesc="A multi-system chiptune tracker compatible with DefleMask modules"
url="https://github.com/tildearrow/furnace"
depends=(
  'sdl2'
  'libsndfile'
  'fmt'
  'hicolor-icon-theme'
  'alsa-lib'
  'fftw'
  'rtmidi'
  'portaudio'
  'freetype2'
)
makedepends=('git' 'jack' 'cmake')
optdepends=('jack: JACK audio support')
provides=('furnace')
conflicts=('furnace')
arch=('x86_64')
license=('GPL-2.0-or-later')
source=(
  "git+https://github.com/tildearrow/furnace.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_GUI=ON
    -D SYSTEM_FFTW=ON
    -D SYSTEM_FMT=ON
    -D SYSTEM_FREETYPE=ON
    -D SYSTEM_LIBSNDFILE=ON
    -D SYSTEM_PORTAUDIO=ON
    -D SYSTEM_RTMIDI=ON
    -D SYSTEM_SDL2=ON
    -D SYSTEM_ZLIB=ON
    -D WITH_JACK=ON
    -D WITH_DEMOS=ON
    -S "$_pkgname"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
