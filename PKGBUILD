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
pkgver=0.70.0
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
b2sums=('dd81c8a36b4200b9ae12a033e2d0bdb79a9aceeccf2902868b176d534bb294132bf8e439bfd19b1741fc26a86cb7a5bd4183e4543e98547998d3e3b93ea80632')

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
