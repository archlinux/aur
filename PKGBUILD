# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE

pkgname=corsix-th
pkgver=0.66_beta1
_tagver=0.66-beta1
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake' 'ninja' 'doxygen')
depends=('freetype2' 'lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg')
optdepends=('freepats-legacy: Soundfont for Midi playback'
            'soundfont-fluid: Alternative soundfont for Midi playback')
install=$pkgname.install
source=("$pkgname-$_tagver.tar.gz::https://github.com/CorsixTH/CorsixTH/archive/v$_tagver.tar.gz")
sha256sums=('fcbd6b8e18f9aa587c22a8621c710d1719748acecc8988765cab6a9da1c9299c')

prepare() {
  printf 'Checking if ccache is enabled for makepkg... '

  if check_buildoption "ccache" "y"; then
    printf 'yes\n'
    printf 'Enabling C++ ccache for CMake...\n'
    export CMAKE_CXX_COMPILER_LAUNCHER='ccache'
  else
    printf 'no\n'
  fi

  printf 'Configuring build with CMake...\n\n'
  export CXXFLAGS+=" ${CPPFLAGS}" # CMake ignores CPPFLAGS

  cmake -S "CorsixTH-$_tagver" \
        -B build \
        -G Ninja \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DWITH_FREETYPE2=ON
}

build() {
  printf 'Building with CMake...\n\n'
  cmake --build build
}

package() {
  printf 'Installing with CMake...\n\n'
  DESTDIR="$pkgdir/" cmake --install build

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/corsix-th/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
