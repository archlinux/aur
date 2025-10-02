# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="SkyEmu"
pkgname="${_Name,,}"
pkgver=4
pkgrel=1
pkgdesc="Game Boy Advance, Game Boy, Game Boy Color, and DS Emulator"
arch=('x86_64')
url="https://github.com/skylersaleh/${_Name}"
license=('MIT')
depends=(
  'alsa-lib'
  'curl'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libgl'
  'libx11'
  'libxcursor'
  'libxi'
  'openssl'
  'sdl2'
)
makedepends=(
  'cmake>=3.15'
  'gendesk'
  'git'
)
_pkgsrc="${url##*/}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}")
b2sums=('a6d017f7627d770cf04b76b88d0465755e5931db36ac8d207ba39effa8e85545bec6db740b135faf3eba2df024b066b1facf93c8b5a3ba3e124e04ec0d8c5ef6')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e '/set(CMAKE_C_FLAGS/d' \
      -e '/set(CMAKE_CXX_FLAGS/d' \
      -i 'CMakeLists.txt'
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D USE_SYSTEM_CURL:BOOL=ON
    -D USE_SYSTEM_OPENSSL:BOOL=ON
    -D USE_SYSTEM_SDL2:BOOL=ON
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"

  gendesk -f -n \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_Name}" \
    --exec "${_Name}" \
    --categories "Game;Emulator"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  install -vDm644 "${pkgname}.desktop"  "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "src/resources/icons"
  install -vDm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -vDm644 "icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
