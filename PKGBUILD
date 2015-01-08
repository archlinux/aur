# Maintainer: FoolEcho <foolecho at gmail dot com>
pkgname=zelda-olb-fr
_name=zelda-olb
pkgver=3.6
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="Zelda: Oni Link Begins is the sequel of Zelda: Return of the Hylian (french version)"
url="http://www.zeldaroth.fr/"
license=('Unknown')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image' 'xdg-utils' 'hicolor-icon-theme' 'timidity++')
makedepends=(imagemagick)
optdepends=('timidity-freepats: soundfont for timidity to be able to have music in game'
  'fluidr3: another soundfont for timidity to be able to have music in game if you prefer')
install=${_name}.install
changelog=ChangeLog
source=(
  "http://www.zeldaroth.fr/fichier/OLB/linux/ZeldaOLB-src-linux.zip" 
  zelda-olb.desktop)
md5sums=('93354eb9da873c50349f0158c3ddf90e'
         'aa9e6527ebbdb04aacc7531a1c700865')

prepare () {
  cd $srcdir/ZeldaOLB-src-linux/src
  
  # Fix the Game so that it reads save files from $HOME/.zelda-olb
  sed -i -e s~\"data/save/~string\(getenv\(\"HOME\"\)\)+\"/.$_name/~g Joueur.cpp
  #save/restore volume settings and ranks
  sed -i -e s#\"data/save/system.dat\"#\(string\(getenv\(\"HOME\"\)\)+\"/.$_name/system.dat\"\).c_str\(\)#g Keyboard.cpp
  #remove saves from menu
  sed -i -e s#\"data/save#string\(getenv\(\"HOME\"\)\)+\"/.$_name#g Keyboard.cpp
  #grab rank from Zelda Return of the Hylian
  sed -i -e s#Zelda\ Return\ of\ the\ Hylian/data/save#.zelda-roth#g Keyboard.cpp
  
  #Make the game treat /usr/share/$pkgname as its data directory
  for i in *.cpp
  do
    sed -i -e s~data/~/usr/share/$pkgname/~g $i
  done
  
  # Create the directory $HOME/.zelda-olb if it doesnt exist
  sed -i -e s~'(NULL));'~'&\n\tif (system(\"stat $HOME/.'$_name' \&> /dev/null")) system (\"mkdir $HOME/.'$_name'\");'~ main.cpp
}

build() {
  cd $srcdir/ZeldaOLB-src-linux/src
  make
}

package () {
  
  install -Dm644 $_name.desktop $pkgdir/usr/share/applications/$_name.desktop
  cd $srcdir/ZeldaOLB-src-linux/src
  
  install -Dm755 ZeldaOLB $pkgdir/usr/bin/$_name
  
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
