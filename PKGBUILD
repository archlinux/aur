# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgbase=sm64-port
_sm64ver=jp
_pkgname=${_pkgbase}-${_sm64ver}

pkgname=${_pkgname}-git
pkgver=irix2.r55.g733fafc
pkgrel=1
pkgdesc="A port of Super Mario 64 (${_sm64ver^^}) for modern devices"
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/sm64-port/${_pkgbase}"
license=("unknown")
makedepends=("python" "sdl2")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}"
        "file://baserom.${_sm64ver}.z64"
        "${_pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=("SKIP"
            "9cf7a80db321b07a8d461fe536c02c87b7412433953891cdec9191bfad2db317"
            "bd5744ca3e5fdb657755995176ab1f0f101d0a50dc0221a3fd38d4d162a3533d"
            "b0596710dc99bae4f004703766d1d767afb3f7d650ede0781cd31d6ca2f0c56a")

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "${srcdir}"

  cp baserom.${_sm64ver}.z64 "${srcdir}/${_pkgbase}"
}

build() {
  cd "${srcdir}/${_pkgbase}"

  make VERSION=${_sm64ver}
}

package() {
  cd "${srcdir}"

  # Install binary and launcher
  install -Dm0755 ${_pkgbase}/build/${_sm64ver}_pc/sm64.${_sm64ver} "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
  install -Dm0755 ${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"

  # Install desktop entry
  install -Dm0644 ${_pkgbase}/textures/segment2/segment2.05A00.rgba16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
  install -Dm0644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
