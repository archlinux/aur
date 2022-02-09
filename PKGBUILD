# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgbase=sm64-port
_sm64ver=us
_pkgname=${_pkgbase}-${_sm64ver}

pkgname=${_pkgname}-git
pkgver=irix2.r55.g733fafc
pkgrel=2
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
            "17ce077343c6133f8c9f2d6d6d9a4ab62c8cd2aa57c40aea1f490b4c8bb21d91"
            "e9e143a55960598b020c471dbb619f2f500d9ff63d397daf81b6f9d6ec847884"
            "c96db419ebe12dfbabfdf1cb133a4e40a1743361cdaa791ad1d9aaf1dfc91a14")

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
