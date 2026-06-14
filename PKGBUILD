# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=eternity-engine
pkgver=4.06.00
pkgrel=1
pkgdesc="An advanced Doom port with vanilla compatibility"
url="https://eternity.youfailit.net/"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net' 'zlib')
makedepends=('git' 'cmake')
source=("eternity::git+https://github.com/team-eternity/eternity.git#tag=${pkgver}"
        "git+https://github.com/Wohlstand/libADLMIDI.git#commit=99d07d222e84412dc28089464e07cdedab6d4ece")
b2sums=('0a7e179c8b1c619d2e093785c84f73226b81a6fc00a6a91aa0e7f6bb6e96a0f527627fff0c987810d2f0d6325f4123ecaf798c2040d77fd21817dc26e760d921'
        'f28ec7224370e458d511581f466b244adf4a5311560cc4feef739836f624f9d53879382a3fdf943ed2240542af111681465c5ae1166f6923a4a00aeb369351c7')

prepare() {
  cd "${srcdir}/eternity"
  git submodule init
  git config submodule.adlmidi.url "${srcdir}/libADLMIDI"
  git -c protocol.file.allow=always submodule update
}

build() {
  local cmake_options=(
    -B build
    -S eternity
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
