# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Micael Soder <zoulnix@gmail.com>

pkgname=bombermaaan
pkgver=1.4.0.627
pkgrel=5
_pkgdate=20081018
pkgdesc="A classic Bomberman-like game with multiplayer support"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL3')
depends=('sdl_mixer')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/Bombermaaan_${pkgver}_${_pkgdate}_src.tar.gz"
        "http://downloads.sourceforge.net/$pkgname/Bombermaaan_${pkgver}_${_pkgdate}_res.tar.gz"
        "http://media1.gamefront.com/moddb/2011/02/17/Bombermaan_levels_pack.zip"
        "$pkgname.png"
        "$pkgname.desktop")
md5sums=('ee90bdd9654f0886c9585e6d785a1f52'
         '6c12f92ba80788f5958f7d9b65c81307'
         '9986c2abe340b8831eff6f6c4474ad0d'
         '40b94792c2f9f41ebde2d5c5ddf224c6'
         'SKIP')

prepare() {
  cd Bombermaaan_${pkgver}_${_pkgdate}_src

  # copy data files
  cp -r ../Bombermaaan_${pkgver}_${_pkgdate}_res/RES32 .

  # type fix
  sed -i "s|\tchar \*backslash|\tconst char \*backslash|" Bombermaaan/winreplace.cpp

  # set correct dir
  sed -i "s|share/games/bombermaaan|share/bombermaaan|" Bombermaaan/CGame.cpp

  # force our cflags/ldflags
  sed -e "s|SDL_CFLAGS := |& $CXXFLAGS |" \
    -e "s|SDL_LDFLAGS := |& $LDFLAGS |" -i Bombermaaan/Makefile
}

build() {
  cd Bombermaaan_${pkgver}_${_pkgdate}_src

  make
}

package() {
  cd Bombermaaan_${pkgver}_${_pkgdate}_src

  # create folders
  install -d "$pkgdir"/usr/{lib,share/$pkgname/Levels}

  # install executable
  install -Dm755 Bombermaaan/Bombermaaan "$pkgdir"/usr/bin/bombermaaan

  # install library
  install -m644 RESGEN/libbombermaaan.so.1.0.0 "$pkgdir"/usr/lib/
  ln -s libbombermaaan.so.1.0.0 "$pkgdir"/usr/lib/libbombermaaan.so.1
  ln -s libbombermaaan.so.1 "$pkgdir"/usr/lib/libbombermaaan.so

  # install a level pack (by feillyne)
  # http://www.moddb.com/games/bombermaaan/addons/level-pack-151-levels
  install -m644 ../Levels/* "$pkgdir"/usr/share/$pkgname/Levels/

  # install desktop entry
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # install readme file
  install -Dm644 Readme.html "$pkgdir"/usr/share/doc/$pkgname/README.html
}
