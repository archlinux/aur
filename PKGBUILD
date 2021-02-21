# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 
# I suggest setting up a local folder to hold generated maps, 
# and copy in map_gen.ini and the contents of the examples folder.
# To use the maps in the game, copy them to ~/.config/c-evo

pkgname=c-evo-map_gen
pkgver=1.1.1
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64')
url="http://www.c-evo.org/bb/viewtopic.php?f=6&t=177"
license=('GPL3')
depends=('glibc')
makedepends=('dos2unix')
source=("$pkgname.zip::http://www.c-evo.org/bb/download/file.php?id=162")
sha256sums=('0824cb3a2081b11dde81f51cc7bfe892088a4967b008c7c5c7bb580f4c66d503')


prepare() {
  rm -fr "$pkgname-$pkgver"	
  mv "map_gen-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

# Convert Windows text format to unix style
  find .        -type f -print0 | xargs -0 dos2unix -k -q 
  find doc      -type f -print0 | xargs -0 dos2unix -k -q 
  find examples -type f -print0 | xargs -0 dos2unix -k -q 
  cd src

# ‘area_dist’ defined but not used
  sed -i '80,88d'              map_gen/scn_fjor.c
  
# Use LDFLAGS for RELRO  
  sed -i 's/cc/cc ${LDFLAGS}/' map_gen/build 
  
# echo text merges with other output!  
  sed -i 's/echo/#/'           map_gen/build 
}


build() {
  cd "$pkgname-$pkgver/src"
  ./build

  cd ../
  cp -v src/bin/map_gen "$pkgname"
}


package() {
  cd "$pkgname-$pkgver"

  install -v  -Dm 755 "$pkgname"             -t "$pkgdir/usr/bin"
  install -pv -Dm 644 map_gen.ini            -t "$pkgdir/usr/share/$pkgname"
  install -pv -Dm 644 examples/*             -t "$pkgdir/usr/share/$pkgname/examples" 
  install -p  -Dm 644 *.txt                  -t "$pkgdir/usr/share/doc/$pkgname"
  install -p  -Dm 644 doc/*                  -t "$pkgdir/usr/share/doc/$pkgname" 
}
