# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=lander-git
_pkgname=lander
pkgver=r296.d5cbffd
pkgrel=1
pkgdesc="Lunar Lander clone using OpenGL (git)"
url="https://github.com/nickg/lander"
depends=('sdl2_mixer' 'glew' 'sdl2_image' 'freetype2')
makedepends=('git' 'gendesk')
conflicts=(lander lander-curses-git)
license=('GPL3')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/nickg/lander.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec "lander" --categories "Game;ActionGame"
}

build() {
  cd ${srcdir}/${pkgname}
  if [ -d build ]
  then
    rm -rf build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Debug -DSDL2_LIBRARIES=-lSDL2 -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/${pkgname}
  pushd build
  make DESTDIR="${pkgdir}" install
  popd
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 data/images/ship.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

# vim:set ts=2 sw=2 et:
