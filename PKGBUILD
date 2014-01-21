# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Micael Soder <zoulnix@gmail.com>

_pkgbase=bombermaaan
pkgname=$_pkgbase-svn
pkgver=1.4.0.658
pkgrel=1
pkgdesc="A classic Bomberman-like game with multiplayer support"
arch=('i686' 'x86_64')
url="http://$_pkgbase.sourceforge.net/"
license=('GPL3')
depends=('sdl_mixer')
makedepends=('subversion')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install=$_pkgbase.install
source=($_pkgbase::"svn+https://svn.code.sf.net/p/$_pkgbase/code/trunk"
        "http://downloads.sourceforge.net/$_pkgbase/Bombermaaan_1.4.0.627_20081018_res.tar.gz"
        "http://media1.gamefront.com/moddb/2011/02/17/Bombermaan_levels_pack.zip"
        "$_pkgbase.desktop")
sha256sums=('SKIP'
            '48c702d42a87b44606cbed2da88b49b250f66c6a65067d1dc43b25980ef1c74a'
            '7a73655f609096271434d20e8a9c33b9af71c547a4a1fc312fbd85866f6c8519'
            '06f8be98170c3c95628003a1419bb25527617330f225bab82baffa564ca1f92b')

pkgver() {
  cd $_pkgbase

  local ver="$(svnversion)"
  printf "1.4.0.%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $_pkgbase/src

  # copy data files for generated library
  cp -r ../../Bombermaaan_1.4.0.627_20081018_res/RES32 .

  # set correct dir
  sed -i "s|share/games/bombermaaan|share/bombermaaan|" Bombermaaan/CGame.cpp

  # force our cflags/ldflags
  sed -e "s|SDL_CFLAGS := |& $CXXFLAGS |" \
    -e "s|SDL_LDFLAGS := |& $LDFLAGS |" -i Bombermaaan/Makefile
}

build() {
  cd $_pkgbase/src

  make
}

package() {
  cd $_pkgbase

  # install executable
  install -Dm755 src/Bombermaaan/Bombermaaan "$pkgdir"/usr/bin/bombermaaan

  # install library
  install -Dm644 src/RESGEN/libbombermaaan.so.1.0.0 "$pkgdir"/usr/lib/libbombermaaan.so.1.0.0
  ln -s libbombermaaan.so.1.0.0 "$pkgdir"/usr/lib/libbombermaaan.so.1
  ln -s libbombermaaan.so.1 "$pkgdir"/usr/lib/libbombermaaan.so

  # install a level pack (by feillyne)
  install -d "$pkgdir"/usr/share/$_pkgbase/Levels
  # http://www.moddb.com/games/bombermaaan/addons/level-pack-151-levels
  install -m644 ../Levels/* "$pkgdir"/usr/share/$_pkgbase/Levels/

  # install desktop entry
  install -Dm644 images/Bombermaaan_Icon.png "$pkgdir"/usr/share/pixmaps/$_pkgbase.png
  install -Dm644 ../$_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop

  # install readme file
  install -Dm644 docs/Readme.html "$pkgdir"/usr/share/doc/$pkgname/README.html
}
