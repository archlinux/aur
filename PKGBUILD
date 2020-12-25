# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=yorg-git
pkgver=v0.11.0_197_gc0d76d5
pkgrel=1
pkgdesc='Free open source and multiplatform racing game (git)'
arch=('i686' 'x86_64')
url="https://github.com/cflavio/yorg"
license=('GPL')
depends=('panda3d' 'bullet' 'gendesk')
install=yorg.install
makedepends=('git')
provides=(yorg)
conflicts=(yorg)
source=($pkgname::"git+https://github.com/cflavio/yorg.git" "yorg")
md5sums=('SKIP'
         '50eb4f1ff961c69e0e0a6b45416def68')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe | sed -e 's|-|_|g'
}

prepare() {
  # get/update yracing submodule
  cd "${srcdir}/${pkgname}/yracing"
  git submodule init
  git config submodule.yarcing.url https://github.com/cflavio/yracing.git
  git submodule update

  # get/update yyagl submodule
  cd "${srcdir}/${pkgname}/yyagl"
  git submodule init
  git config submodule.yyagl.url https://github.com/cflavio/yyagl.git
  git submodule update

  # get assets
  cd "${srcdir}/${pkgname}"
  python setup.py lang images models

  # generate a .desktop file
  gendesk -f -n --pkgname yorg --pkgdesc "${pkgdesc}" --exec "yorg" --categories "Game;Simulation"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/games/yorg"
  for i in assets menu yorg yracing yyagl
  do
    cp -r "$i" "${pkgdir}/usr/share/games/yorg"
  done
  install -Dm755 main.py "${pkgdir}/usr/share/games/yorg/main.py"
  install -Dm664 options.json "${pkgdir}/usr/share/games/yorg/options.json"
  install -Dm755 "${srcdir}/yorg" "${pkgdir}/usr/bin/yorg"
  install -Dm644 "yorg.desktop" "${pkgdir}/usr/share/applications/yorg.desktop"
  install -Dm644 "assets/images/icon/icon128_png.png" "${pkgdir}/usr/share/pixmaps/yorg.png"
}
