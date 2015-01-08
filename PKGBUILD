# Maintainer: FoolEcho <foolecho at gmail dot com>
pkgname=zelda-3t-fr
_name=zelda-3t
pkgver=1.8
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="Zelda: Time To Triumph (french version)"
url="http://www.zeldaroth.fr/"
license=('Unknown')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image' 'xdg-utils' 'hicolor-icon-theme' 'timidity++')
makedepends=(imagemagick)
optdepends=('timidity-freepats: soundfont for timidity to be able to have music in game'
  'fluidr3: another soundfont for timidity to be able to have music in game if you prefer')
install=${_name}.install
changelog=ChangeLog
source=(
  "http://www.zeldaroth.fr/fichier/3T/linux/Zelda3T-src-linux.zip" 
  zelda-3t.desktop)
md5sums=('f1d24ec72bff3413cfc1e835ef4703da'
         'ab544512c46a87f6ef62ae6cdea794fc')

prepare () {
  cd $srcdir/Zelda3T-src-linux/
  
  # Fix the Game so that it reads save files from $HOME/.zelda-3t
  sed -i -e s~\"data/save/~string\(getenv\(\"HOME\"\)\)+\"/.$_name/~g Joueur.cpp
  #save/restore volume settings and ranks
  sed -i -e s#\"data/save/system.dat\"#\(string\(getenv\(\"HOME\"\)\)+\"/.$_name/system.dat\"\).c_str\(\)#g Keyboard.cpp
  #remove saves from menu
  sed -i -e s#\"data/save#string\(getenv\(\"HOME\"\)\)+\"/.$_name#g Keyboard.cpp
  #grab rank from Zelda Return of the Hylian
  sed -i -e s#Zelda\ Return\ of\ the\ Hylian/data/save#.zelda-roth#g Keyboard.cpp
  #grab rank from Zelda Oni Link Begins
  sed -i -e s#Zelda\ Oni\ Link\ Begins/data/save#.zelda-olb#g Keyboard.cpp
  
  #Make the game treat /usr/share/$pkgname as its data directory
  for i in *.cpp
  do
    sed -i -e s~data/~/usr/share/$pkgname/~g $i
  done
  
  # Create the directory $HOME/.zelda3t if it doesnt exist
  sed -i -e s~'(NULL));'~'&\n\tif (system(\"stat $HOME/.'$_name' \&> /dev/null")) system (\"mkdir $HOME/.'$_name'\");'~ main.cpp
}

build () {
  cd $srcdir/Zelda3T-src-linux/
  make
}

package () {
  
  install -Dm644 $_name.desktop $pkgdir/usr/share/applications/$_name.desktop
  cd $srcdir/Zelda3T-src-linux/
  
  install -Dm755 Zelda3T $pkgdir/usr/bin/$_name
  
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
