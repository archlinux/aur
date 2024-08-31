# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="TempleDriver"
_pkgname="${_binname,,}"
pkgname="${_pkgname}-git"
pkgver=1.1.1.r7.9ba8f69
_commit="f300481b04bff205ad5cbe92a1997cba2d3e59ef"
pkgrel=1
pkgdesc="A driving game dedicated to King Terry A. Davis"
arch=('x86_64')
url="https://github.com/mrbid/${_binname}"
license=('Unlicense')
makedepends=('git')
depends=('glibc' 'hicolor-icon-theme' 'libglvnd' 'sdl2')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_binname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}/flat"
  local version=$(sed -n 's/.*release version="\([^"]*\)".*/\1/p' "${_pkgname}.appdata.xml")

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} ${LDFLAGS} main.c -I inc -lSDL2 -lGLESv2 -lEGL -lm -o "build/${_pkgname}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  cd "flat"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${_pkgname}.appdata.xml"
  install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
