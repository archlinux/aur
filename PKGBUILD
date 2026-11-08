# Maintainer: colinjmatt
# Contributor: envolution
# Contributor: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE
# shellcheck shell=bash disable=SC2034,SC2154

pkgname='corsix-th'
_pkgname='CorsixTH'
pkgver=0.70.2
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://corsixth.com/'
arch=('x86_64' 'armv7h')
license=('MIT')
depends=(
  'curl'
  'ffmpeg'
  'fluidsynth'
  'freetype2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libpng'
  'lua'
  'lua-filesystem'
  'lua-lpeg'
  'rtmidi'
  'sdl2'
  'sdl2_mixer'
  'soundfont-fluid'
  'zlib'
)
makedepends=(
  'cmake'
)
checkdepends=(
  'busted'
  'luacheck'
)
optdepends=(
  'timidity++: Alternative ALSA MIDI sequencer daemon for RtMidi output'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CorsixTH/CorsixTH/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bba0218e903294f41691529411e680549f549a887a4707df01b10e031e1fc2dc03806fe191d8ba0ddb2ed817aa1c565ad246d0ebd80c363e0b930041f5b445f4')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # Silence upstream CMake warning by forcing the pkg-config fallback
  sed -i 's/find_package(RtMidi)/#find_package(RtMidi)/g' CMakeLists.txt
}

build() {
  cmake -S "${_pkgname}-${pkgver}" \
    -B 'build' \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_UNIT_TESTS=OFF
  cmake --build 'build'
}

check() {
  cd "${_pkgname}-${pkgver}"
  luacheck --codes --ranges CorsixTH
  busted \
    --verbose \
    --directory=CorsixTH/Luatest \
    --filter-out="Calculate simple VIP rating"
}

package() {
  DESTDIR="${pkgdir}/" cmake --install 'build'
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
