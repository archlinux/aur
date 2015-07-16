# -*- shell-script -*-
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Klemen Košir <klemen913@gmail.com>

pkgname=cataclysm-dda-git
pkgver=0.A.7768.g6fb2244
pkgrel=1
pkgdesc="Cataclysm: Dark Days Ahead is an actively maintained roguelike set in a post-apocalyptic world. Both SDL tiles and ascii version included."
arch=('i686' 'x86_64')
url="http://www.cataclysmdda.com/"
license=('CCPL:by-sa')
conflicts=('cataclysm-dda', 'cataclysm-dda-ncurses')
depends=('ncurses' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'freetype2' 'gcc-libs' 'glibc' 'zlib' 'bzip2')
makedepends=('git' 'gettext')
optdepends=('lua51')
install=
source=("$pkgname"::'git://github.com/CleverRaven/Cataclysm-DDA.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  make version >&2
  printf "%s" $(sed -n 's/.*VERSION \"\(.*[^\\]\)\"/\1/;s/[- ]/./gp' src/version.h)
}

build() {
  cd "${srcdir}/${pkgname}"
  make RELEASE=1 USE_HOME_DIR=1
  make RELEASE=1 USE_HOME_DIR=1 TILES=1 SOUND=1
}

package() {
  cd "${srcdir}/${pkgname}"

  local instdir=/usr/share/cataclysm-dda,locale

  install -dm755 "$pkgdir/${instdir}/"{data,gfx,doc}
  cp -ru --no-preserve=ownership data gfx doc "$pkgdir/${instdir}/"

  install -Dm755 cataclysm cataclysm-tiles cataclysm-launcher "$pkgdir/${instdir}/"

  # License file
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # User default mod list needs to be writeable
  [ -f "$srcdir/user-default-mods.json" ] || echo "{}" > "$srcdir/user-default-mods.json"
  install -Dm775 -g games "$srcdir/user-default-mods.json" "$pkgdir/var/games/cataclysm-dda/data/mods/user-default-mods.json"
  ln -s "/var/games/cataclysm-dda/data/mods/user-default-mods.json" "$pkgdir/${instdir}/data/mods/user-default-mods.json"
  
  # Launcher symlinks
  install -dm755  "$pkgdir/usr/bin/"
  ln -s "${instdir}/cataclysm-launcher" "$pkgdir/usr/bin/cataclysm"
  ln -s "${instdir}/cataclysm-launcher" "$pkgdir/usr/bin/cataclysm-tiles"

  # Localization
  install -dm755 "$pkgdir/usr/share/locale"
  LOCALE_DIR="$pkgdir/usr/share/locale" lang/compile_mo.sh
}
