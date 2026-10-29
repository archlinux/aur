# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=dragon-media-backend-git
pkgver=0.83.0_r429.g7020017
pkgrel=1
pkgdesc='Qt C++ library intended for desktop music players'
url="https://invent.kde.org/libraries/${pkgname%-git}"
arch=($CARCH)
license=(BSD-3-Clause)
depends=(ffmpeg kissfft sdl3 kcoreaddons-git ki18n-git kio-git qt6-base qt6-declarative)
optdepends=('libpipewire: PipeWire integration'
            'libpulse: PulseAudio integration')
makedepends=(git extra-cmake-modules-git libpipewire libpulse)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git"
         https://github.com/mborgerding/kissfft/blob/f3fd3a58f1b98972d0f06a1db775a984198cb788/kissfft.hh) # The kissfft package is missing this header
sha256sums=('SKIP'
            '0a31467599b981d784f53a944c19e6991aa96eee703ab424d648e436b2718a8d')
pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -Em1 ' +VERSION' CMakeLists.txt | sed 's/.* //' | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_CXX_FLAGS="-I$srcdir" # Include the missing header
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
