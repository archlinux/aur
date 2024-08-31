# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="TempleDriver"
pkgname="${_binname,,}"
pkgver=1.1.1
_commit="f300481b04bff205ad5cbe92a1997cba2d3e59ef"
pkgrel=1
pkgdesc="A driving game dedicated to King Terry A. Davis"
arch=('x86_64')
url="https://github.com/mrbid/${_binname}"
license=('Unlicense')
depends=('glibc' 'hicolor-icon-theme' 'libglvnd' 'sdl2')
_pkgsrc="${_binname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('309087c9df20b3edb03724c06a38c82de016d5b5c1fbab0a9031446dd99aa639')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/flat"
  sed -n 's/.*release version="\([^"]*\)".*/\1/p' "${pkgname}.appdata.xml"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} ${LDFLAGS} main.c -I inc -lSDL2 -lGLESv2 -lEGL -lm -o "build/${pkgname}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  cd "flat"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
}
