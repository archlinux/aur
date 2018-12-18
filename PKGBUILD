# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Yangtse Su <yangtsesu@gmail.com>
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Klemen Košir <klemen913@gmail.com>

pkgname=cataclysm-dda-tiles
pkgver=0.C.2018.12.18
_pkgver=0.C
pkgrel=1
pkgdesc="A post-apocalyptic roguelike,tiles only"
url="http://en.cataclysmdda.com/"
arch=('x86_64')
license=("CCPL:by-sa")
conflicts=('cataclysm-dda')
depends=('ncurses' 'lua')
makedepends=('sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'freetype2' 'git' 'gettext')
optdepends=('sdl2_image: for tiles'
            'sdl2_ttf: for tiles'
            'freetype2: for tiles'
            'sdl2_mixer: for tiles')
conflicts=('cataclysm-dda' 'cataclysm-dda-ncurses' 'cataclysm-dda-sdl-git')
source=('https://github.com/CleverRaven/Cataclysm-DDA/archive/master.zip')
md5sums=('SKIP')

pkgver() {
  cd "Cataclysm-DDA-master"
  echo "${_pkgver}.$(date +%Y.%m.%d)"
}

build() {
  cd "Cataclysm-DDA-master"

  make PREFIX=/usr RELEASE=1 LOCALIZE=1 USE_XDG_DIR=1 LUA=1 TILES=1 SOUND=1 LANGUAGES=all
}

package() {
  cd "Cataclysm-DDA-master"

  make PREFIX="$pkgdir/usr" RELEASE=1 LOCALIZE=1 USE_XDG_DIR=1 LUA=1 TILES=1 SOUND=1 LANGUAGES=all install

  #The doc goes in /usr/share/doc  
  install -dm755 "$pkgdir/usr/share/doc/cataclysm-dda"
  unlink doc/JSON_LOADING_ORDER.md
  cp -T data/json/LOADING_ORDER.md doc/JSON_LOADING_ORDER.md
  cp -r *.txt doc/* "$pkgdir/usr/share/doc/cataclysm-dda/"
  
  #License file
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
