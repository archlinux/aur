# Maintainer: envolution
# Contributor: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE
# shellcheck shell=bash disable=SC2034,SC2154

pkgname='corsix-th'
_pkgname='CorsixTH'
pkgver=0.68.0
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://corsixth.com/'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(
  'ffmpeg'
  'freetype2'
  'hicolor-icon-theme'
  'lua'
  'lua-filesystem'
  'lua-lpeg'
  'sdl2_mixer'
)
makedepends=(
  'cmake'
  'ninja'
  'doxygen'
)
checkdepends=(
  'busted'
  'luacheck'
)
optdepends=(
  'freepats-legacy: Soundfont for Midi playback'
  'soundfont-fluid: Alternative soundfont for Midi playback'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CorsixTH/CorsixTH/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9823e90927a63591384de49dde3cdcaced9fd1221931dacad0a5d115d0fcee2c9616b1a6785e91170c23a653f4bccbf6438fe352afdda9777078cdbfd84f0fda')

prepare() {
  cmake -S "${_pkgname}-${pkgver}" \
    -B 'build' \
    -G 'Ninja' \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_UNIT_TESTS=OFF
}

build() {
  cmake --build 'build'
}

check() {
  cd "build"
  luacheck --codes --ranges "CorsixTH"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  busted \
    --verbose \
    --directory="CorsixTH/Luatest" \
    --filter-out="Calculate simple VIP rating"

  ctest --extra-verbose --build-config Release --output-on-failure
}

package() {
  DESTDIR="${pkgdir}/" cmake --install 'build'
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
# vim:set ts=2 sw=2 et:
