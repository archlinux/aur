# Maintainer: envolution
# Contributor: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154
# Contributors: jdc, rayman2200, TheCycoONE

pkgname='corsix-th'
_pkgname='CorsixTH'
pkgver=0.69.1
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
b2sums=('01ed0c5a5ff6a7ce8ef8e4eeda2b5ab92a025789507d561be0efa97fc1cfeb80e37081a73a82c9c209ba8ce84f196ec3a939e5cb5559b7fcfde56a9086982304')

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
