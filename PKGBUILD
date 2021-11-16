# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=tunneltanks-git
_pkgname=tunneltanks
pkgver=r74.44cf228
pkgrel=4
pkgdesc="SDL remake of the early 90's tank game Tunneler"
url="https://github.com/raydog/tunneltanks"
depends=('sdl')
makedepends=('git' 'gendesk')
conflicts=(tunneltanks)
license=('GPL')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/raydog/tunneltanks.git')
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec "tunneltanks" --categories "Game;ActionGame"
  sed -i 's/SDLK_SLASH/SDLK_RCTRL/' src/gamelib/SDL/control.c
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
  install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
