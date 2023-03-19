# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Klemen Košir <klemen913@gmail.com>

pkgname=cataclysm-dda-git
pkgver=0.G.2023.03.19
_pkgver=0.G
pkgrel=1
pkgdesc="A post-apocalyptic roguelike."
#url="http://cataclysmrl.blogspot.com/"
#url="http://www.cataclysm.glyphgryph.com/"
#url="http://en.cataclysmdda.com/"
url="https://cataclysmdda.org/"
arch=('i686' 'x86_64')
license=("CCPL:by-sa")
conflicts=('cataclysm-dda' 'cataclysm-dda-ncurses' 'cataclysm-dda-tiles')
depends=('ncurses' 'gettext')
makedepends=('sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'freetype2' 'git')
optdepends=('sdl2_image: for tiles'
            'sdl2_ttf: for tiles'
            'freetype2: for tiles'
            'sdl2_mixer: for tiles')
#source=("$pkgname"::'git://github.com/CleverRaven/Cataclysm-DDA.git#branch=master')
# The git repo is more than a GB
# so download a snapshot while waiting for shallow clone support in makepkg
# (you may uncomment the alternate source/pkgver() if you would prefer to use that)
source=(
  'https://github.com/CleverRaven/Cataclysm-DDA/archive/master.zip'
)
sha512sums=('SKIP')

pkgver() {
  cd "Cataclysm-DDA-master"
  #git describe --tags --long | sed 's/-/.r/; s/-/./'
  # no git metadata in the snapshot, so fake it
  echo "${_pkgver}.$(date +%Y.%m.%d)"
}

prepare() {
  cd "Cataclysm-DDA-master"
  sed -i 's/ncursesw5-config/ncursesw6-config/' Makefile
}

build() {
  cd "Cataclysm-DDA-master"
  make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 LANGUAGE="all" LTO=1 RUNTESTS=0 LINTJSON=0 ASTYLE=0 PCH=0
  make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 LANGUAGE="all" LTO=1 RUNTESTS=0 LINTJSON=0 ASTYLE=0 PCH=0 TILES=1 SOUND=1
  # LOCALIZE = 0   to save 30MB
  # DYNAMIC_LINKING = 1 ?

  # 'make install' needs this
  touch README.txt
}

package() {
  cd "Cataclysm-DDA-master"

  # no DESTDIR
  make PREFIX="$pkgdir/usr" \
  RELEASE=1 ZLEVELS=1 USE_XDG_DIR=1 PCH=0 \
  install

  make PREFIX="$pkgdir/usr" \
  RELEASE=1 ZLEVELS=1 USE_XDG_DIR=1 PCH=0 TILES=1 SOUND=1 \
  install

  # Icon
  install -D 'build-data/osx/AppIcon.iconset/icon_128x128.png' "$pkgdir/usr/share/icons/hicolor/128x128/apps/cataclysm-dda.png"

  # Docs
  install -d "$pkgdir/usr/share/doc/cataclysm-dda"
  cp -r doc/* "$pkgdir/usr/share/doc/cataclysm-dda"
  rm "$pkgdir/usr/share/doc/cataclysm-dda/"*.6
  install -Dm644 doc/cataclysm.6 "$pkgdir/usr/share/man/man6/cataclysm.6"
  install -Dm644 doc/cataclysm-tiles.6 "$pkgdir/usr/share/man/man6/cataclysm-tiles.6"

  # undo symlink
  rm "$pkgdir/usr/share/doc/cataclysm-dda/JSON_LOADING_ORDER.md"
  cp 'data/json/LOADING_ORDER.md' "$pkgdir/usr/share/doc/cataclysm-dda/JSON_LOADING_ORDER.md"

  # License
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
