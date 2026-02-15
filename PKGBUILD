# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="SkyEmu"
pkgname="${_Name,,}"
pkgver=5
pkgrel=1
pkgdesc="Game Boy Advance, Game Boy, Game Boy Color, and DS Emulator"
arch=(
  'x86_64'
)
url="https://github.com/skylersaleh/${_Name}"
license=(
  'MIT'
)
depends=(
  'alsa-lib'
  'curl'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libgl'
  'libstdc++'
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
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
)
b2sums=('a892b8340fa21c1f1e08d7c39c8ce075aa597645d55bcf1b49008017f4ee21792e6bfc37e7f2077586ac4667c5dec52ad099ac2ae901d75902511aef53db171a')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e '/set(CMAKE_C_FLAGS/d' \
      -e '/set(CMAKE_CXX_FLAGS/d' \
      -i 'CMakeLists.txt'
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D USE_SYSTEM_CURL:BOOL=ON
    -D USE_SYSTEM_OPENSSL:BOOL=ON
    -D USE_SYSTEM_SDL2:BOOL=ON
  )

  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_options[@]}"
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
