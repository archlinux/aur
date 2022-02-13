# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgbase=sm64ex
_sm64ver=us
_pkgname=${_pkgbase}-${_sm64ver}

pkgname=${_pkgname}-git
pkgver=r626.db9a6345
pkgrel=1
pkgdesc="Fork of Super Mario 64 Port (${_sm64ver^^}) with additional features"
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/sm64pc/${_pkgbase}"
license=("unknown")
depends=("sdl2")
makedepends=("python")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}"
        "file://baserom.${_sm64ver}.z64"
        "${_pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=("SKIP"
            "17ce077343c6133f8c9f2d6d6d9a4ab62c8cd2aa57c40aea1f490b4c8bb21d91"
            "59183a891702fc4ecb17c85ab3a88a56c1622585dca695696121a4eedeca8ace"
            "fedcaa4a70d88d3358b0d0899ceb25e0f313493b3ea2f52cb94f29f452fff996")

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
  make VERSION=${_sm64ver}
}

package() {
  cd "${srcdir}"

  # Install binary and launcher
  install -Dm0755 ${_pkgbase}/build/${_sm64ver}_pc/sm64.${_sm64ver}.f3dex2e "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
  install -Dm0755 ${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"

  # Install desktop entry
  install -Dm0644 ${_pkgbase}/textures/segment2/segment2.05A00.rgba16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png" # Use extracted Mario head texture as desktop icon
  install -Dm0644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
