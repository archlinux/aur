# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE

pkgname='corsix-th'
# TODO: fix versioning next time if needed: 0.66_beta is higher than 0.66
pkgver=0.66_beta2
_tagver=0.66-beta2
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake' 'ninja' 'doxygen')
depends=('freetype2' 'lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg')
optdepends=('freepats-legacy: Soundfont for Midi playback'
            'soundfont-fluid: Alternative soundfont for Midi playback')
install="${pkgname}.install"
source=("${pkgname}-${_tagver}.tar.gz::${url}/archive/v${_tagver}.tar.gz")
b2sums=('0b95e0aac169370c48758c91749f433b4e272e747b486c8026999e94b25f2f4a3b7a5fb6c33095ac097ba1b1ceea36627a3226a219d5d4a443fe0183478c9775')

prepare() {
  printf 'Checking if ccache is enabled for makepkg... '

  if check_buildoption 'ccache' 'y'; then
    printf 'yes\n'
    printf 'Enabling C++ ccache for CMake...\n'
    export CMAKE_CXX_COMPILER_LAUNCHER='ccache'
  else
    printf 'no\n'
  fi

  printf 'Configuring build with CMake...\n\n'
  export CXXFLAGS+=" ${CPPFLAGS}" # CMake ignores CPPFLAGS

  cmake -S "CorsixTH-${_tagver}" \
        -B 'build' \
        -G 'Ninja' \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DWITH_FREETYPE2='ON'
}

build() {
  printf 'Building with CMake...\n\n'
  cmake --build 'build'
}

package() {
  printf 'Installing with CMake...\n\n'
  DESTDIR="${pkgdir}/" cmake --install 'build'

  # license
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s '/usr/share/corsix-th/LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
