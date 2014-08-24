# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Micael Soder <zoulnix@gmail.com>

pkgname=bombermaaan
pkgver=1.4.0.627
pkgrel=5
_pkgdate=20081018
pkgdesc="A classic Bomberman-like game with multiplayer support"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net"
license=('GPL3')
depends=('sdl_mixer')
install=$pkgname.install
source=("http://downloads.sourceforge.net/$pkgname/Bombermaaan_${pkgver}_${_pkgdate}_src.tar.gz"
        "http://downloads.sourceforge.net/$pkgname/Bombermaaan_${pkgver}_${_pkgdate}_res.tar.gz"
        "http://media1.gamefront.com/moddb/2011/02/17/Bombermaan_levels_pack.zip"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('fb0b6d59569d436ac10b452857b8800b831513ab888b29a66c2dc0ada12d045d'
            '48c702d42a87b44606cbed2da88b49b250f66c6a65067d1dc43b25980ef1c74a'
            '7a73655f609096271434d20e8a9c33b9af71c547a4a1fc312fbd85866f6c8519'
            '803576f10eb6b45e807cd12a4ccd6b17652ddda53bf8f0e2fa1fb5623d9287bc'
            '06f8be98170c3c95628003a1419bb25527617330f225bab82baffa564ca1f92b')

prepare() {
  cd Bombermaaan_${pkgver}_${_pkgdate}_src

  # copy data files for generated library
  cp -r ../Bombermaaan_${pkgver}_${_pkgdate}_res/RES32 .

  cd Bombermaaan
  # type fix
  sed "s|\tchar \*backslash|\tconst char \*backslash|" -i winreplace.cpp
  # adapt directory to arch standards
  sed "s|share/games/bombermaaan|share/bombermaaan|" -i CGame.cpp
  # add our cflags/ldflags
  sed "s|SDL_CFLAGS :=|& $CXXFLAGS |;s|SDL_LDFLAGS :=|& $LDFLAGS |" -i Makefile
}

build() {
  make -C Bombermaaan_${pkgver}_${_pkgdate}_src
}

package() {
  cd Bombermaaan_${pkgver}_${_pkgdate}_src

  # binary
  install -Dm755 Bombermaaan/Bombermaaan "$pkgdir"/usr/bin/bombermaaan
  # library
  install -Dm644 RESGEN/libbombermaaan.so.1.0.0 "$pkgdir"/usr/lib/libbombermaaan.so.1.0.0
  ln -s libbombermaaan.so.1.0.0 "$pkgdir"/usr/lib/libbombermaaan.so.1
  ln -s libbombermaaan.so.1 "$pkgdir"/usr/lib/libbombermaaan.so
  # doc
  install -Dm644 Readme.html "$pkgdir"/usr/share/doc/$pkgname/README.html
  cd ..
  # level pack by feillyne: http://www.moddb.com/games/bombermaaan/addons/level-pack-151-levels
  install -d "$pkgdir"/usr/share/$pkgname/Levels
  install -m644 Levels/* "$pkgdir"/usr/share/$pkgname/Levels
  # .desktop entry
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
