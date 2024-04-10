# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: Harrison <htv04rules at gmail dot com>

_pkgbase=sm64coopdx
#edit if using a non-us rom
_sm64ver=us
_pkgname=${_pkgbase}

pkgname=${_pkgname}-git
pkgver=r3689.30ccad30
pkgrel=1
pkgdesc="Fork of sm64ex-coop with more features, customizability and power to the Lua API."
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/coop-deluxe/${_pkgbase}"
license=("reverse-engineered and unlicensed")
depends=("sdl2")
makedepends=('audiofile' 'git' 'python' 'glew' 'zlib' 'curl')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}"
        "file://baserom.${_sm64ver}.z64"
        "${_pkgname}.sh"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
sha256sums=("SKIP"
            "17ce077343c6133f8c9f2d6d6d9a4ab62c8cd2aa57c40aea1f490b4c8bb21d91" # CHANGE IF USING NON-US ROM.
            "e06407a3a92334db30bebcfa94b7bb9ddfcc1ffe71ea7e5b85a8a15288cf0a42"
            "d51ca0a8e000ed7a99f09c0247cabfb58fa96ac042ac17498d05556e2b42f651"
            "ab30cbc8720714ea02c1e36088bef6f1609c1e81d67b72807ecdd98d21bc03eb")

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"

  cp baserom.${_sm64ver}.z64 "${srcdir}/${_pkgbase}"
}

build() {
  cd "${srcdir}/${_pkgbase}"

  # Reference: https://github.com/sm64pc/sm64ex/wiki/Build-options
  make VERSION=${_sm64ver} TARGET_BITS=64 COOPNET=1 RENDER_API=GL WINDOW_API=SDL2 # OPT_LEVEL=4 TEXTURE_FIX=1
}

package() {
  cd "${srcdir}"

  # Install binary and launcher
  install -Dm0755 ${_pkgbase}/build/${_sm64ver}_pc/sm64coopdx "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
  install -Dm0755 ${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
  # Install Libs
  install -Dm0644 ${_pkgbase}/build/${_sm64ver}_pc/libdiscord_game_sdk.so "${pkgdir}/usr/share/${_pkgname}/libdiscord_game_sdk.so"
  install -Dm0644 ${_pkgbase}/build/${_sm64ver}_pc/libbass.so "${pkgdir}/usr/share/${_pkgname}/libbass.so"
  install -Dm0644 ${_pkgbase}/build/${_sm64ver}_pc/libbass_fx.so "${pkgdir}/usr/share/${_pkgname}/libbass_fx.so"
  install -Dm0644 ${_pkgbase}/build/${_sm64ver}_pc/discord_game_sdk.so "${pkgdir}/usr/share/${_pkgname}/discord_game_sdk.so"
  install -Dm0644 ${_pkgbase}/build/${_sm64ver}_pc/lang/* -t ${pkgdir}/usr/share/${_pkgname}/lang/

  # Install desktop entry
  install -Dm0644 ${_pkgname}.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm0644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
