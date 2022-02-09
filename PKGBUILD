# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgbase=sm64-port
_sm64ver=sh
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
            "f8807b5e28f1b1a31c5d3675d23ece73f949ccb553dcbb07972666a1e76adfa2"
            "0816bf07b7697d490e874188b12ed12d45410b4479d52b461087289440e18ae8"
            "c2e603c3996471c85a889b32ef62bf4cc4f63268b8318a4e6f9dcdaf90e3f4ed")

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
