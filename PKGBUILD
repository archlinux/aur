# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=andyetitmoves
pkgver=1.2.2
pkgrel=3
pkgdesc="physics-based platform game (full version)"
arch=('i686' 'x86_64')
url="http://www.andyetitmoves.net/"
license=("custom:shareware")
source=("andyetitmoves.desktop")
depends=("mesa" "libxft" "sdl_image" "libvorbis" "libpng12")
options=('!strip')
md5sums=('4f4792260832fe1b52ca8150a03ca176')

[ "$CARCH" = "i686"   ] && depends=(${depends[@]} openal libtheora)
[ "$CARCH" = "x86_64" ] && depends=(${depends[@]} lib32-openal lib32-libtheora lib32-libpng12 lib32-libvorbis lib32-sdl_image)

[ "$CARCH" = "i686"   ] && gamepkg="andyetitmoves-${pkgver}-1_i386.tar.gz"
[ "$CARCH" = "x86_64" ] && gamepkg="andyetitmoves-${pkgver}-1_x86_64.tar.gz"

[ "$CARCH" = "i686"   ] && gamesum='c530630520f062db1d402d99fb25a725'
[ "$CARCH" = "x86_64" ] && gamesum='86544c86a117a653221c38ebfa58c68d'

build() {
   cd ${srcdir}
  
   msg "You need a full copy of this game in order to install it"
   msg "Searching for ${gamepkg} in dir: \"$startdir\""
	 pkgpath=$startdir
   if [[ ! -f "$startdir/${gamepkg}" ]]; then
	   error "Game package not found, please type absolute path to \"${gamepkg}\" (/home/joe/downloads) or enter HIB key (e. g. abcdefgh1234):"
       read pkgpath
       if echo ${pkgpath} | egrep -q "^\s*/"; then
	       if [[ ! -f "${pkgpath}/${gamepkg}" ]]; then
		   error "Unable to find game package." && return 1
	       fi
       else
	       key=${pkgpath}
	       echo "your key is: ${key}"
	       pkgpath=$startdir
               downurl=$(wget -qO - http://www.humblebundle.com/?key=${key} | sed -n '/'${gamepkg}'/s/.* href='\''\(.*\)'\'' data-web=.*/\1/p')
		echo $downurl
               if [ -z "${downurl}" ]; then
		       error "provided key seems to be invalid or something has changed on hib website"
		       return 1
	       fi
	       wget -O ${pkgpath}/${gamepkg} "${downurl}" || rm ${pkgpath}/${gamepkg}
       fi
    fi
    if [ "$(/usr/bin/md5sum ${pkgpath}/${gamepkg} | awk '{print $1}')" != ${gamesum} ]; then
	    error  "md5sum does not match"
	    return 1
    fi
    msg "Found game package, installing."
    tar xvf ${pkgpath}/${gamepkg}
}

package() {
  cd $srcdir/AndYetItMoves
  mkdir -p $pkgdir/usr/{share/AndYetItMoves,bin}
  /bin/tar cf - * | ( cd ../../pkg/usr/share/AndYetItMoves/; tar xfp - )
  ln -s /usr/share/AndYetItMoves/AndYetItMoves $pkgdir/usr/bin/AndYetItMoves
  install -D -m644 icons/48x48.png $pkgdir/usr/share/pixmaps/andyetitmoves.png
  install -D -m644 $srcdir/andyetitmoves.desktop $pkgdir/usr/share/applications/andyetitmoves.desktop
}
