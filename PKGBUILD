# Maintainer: FoolEcho <foolecho at gmail dot com>
pkgname=zelda-roth-fr
_name=zelda-roth
pkgver=6.11
pkgrel=4
pkgdesc="Zelda: Return of the Hylian (french version)"
arch=('i686' 'x86_64')
url="http://www.zeldaroth.fr/"
license=('Unknown')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image' 'xdg-utils' 'hicolor-icon-theme' 'timidity++')
makedepends=(imagemagick)
optdepends=('timidity-freepats: soundfont for timidity to be able to have music in game'
  'fluidr3: another soundfont for timidity to be able to have music in game if you prefer')
install=${_name}.install
changelog=ChangeLog
source=(
  "http://www.zeldaroth.fr/fichier/ROTH/linux/ZeldaROTH-src-linux.zip" 
  zelda-roth.desktop)
md5sums=('3e3f9a3c944491d1cb7683a06437ae38'
         'e668913f4420520de8775192639997f5')

prepare () {
  cd $srcdir/ZeldaROTH-src-linux/src
  
  # Fix the Game so that it reads save files from $HOME/.zelda-roth
  sed -i -e s~\"data/save/~string\(getenv\(\"HOME\"\)\)+\"/.$_name/~g Joueur.cpp
  #save/restore volume settings and ranks
  sed -i -e s#\"data/save/system.dat\"#\(string\(getenv\(\"HOME\"\)\)+\"/.$_name/system.dat\"\).c_str\(\)#g Keyboard.cpp
  #remove saves from menu
  sed -i -e s#\"data/save#string\(getenv\(\"HOME\"\)\)+\"/.$_name#g Keyboard.cpp
  
  #Make the game treat /usr/share/$pkgname as its data directory
  for i in *.cpp
  do
    sed -i -e s~data/~/usr/share/$pkgname/~g $i
  done
  
  # Create the directory $HOME/.zelda-roth if it doesnt exist
  sed -i -e s~'(NULL));'~'&\n\tif (system(\"stat $HOME/.'$_name' \&> /dev/null")) system (\"mkdir $HOME/.'$_name'\");'~ main.cpp
}

build () {
  cd $srcdir/ZeldaROTH-src-linux/src
  make
}

package () {
  
  install -Dm644 $_name.desktop $pkgdir/usr/share/applications/$_name.desktop
  cd $srcdir/ZeldaROTH-src-linux/src
  
  install -Dm755 ZeldaROTH $pkgdir/usr/bin/$_name
  
  cd data
  for i in {map,music,sound}/*
  do
    install -Dm644 $i $pkgdir/usr/share/$pkgname/$i
  done
  
  cd images
  for i in */*
  do
    install -Dm644 $i $pkgdir/usr/share/$pkgname/images/$i
  done
  mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
  convert logos/fond.png -resize 256x256\! $pkgdir/usr/share/icons/hicolor/256x256/apps/$_name.png
}
