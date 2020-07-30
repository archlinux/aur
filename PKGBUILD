# $Id$
# Maintainer: Eden Rose(endlesseden) <eenov1988 "at"  gmail.com >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Matthew Bowra-Dean <matthew@ijw.co.nz>
#
pkgname=openra-git
pkgver=BLEED.20190714.579d2c19e2
pkgrel=1
pkgdesc="An open-source implementation of the Red Alert engine using .NET/Mono and OpenGL. Red Alert 2, mods Included. -GIT VERSION"
arch=('any')
url="http://www.openra.net"
license=('GPL3')
install=openra.install
depends=('mono' 'msbuild' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'unzip')
provides=('openra')
conflicts=('openra')
options=(!strip)

source=('OpenRA::git://github.com/OpenRA/OpenRA.git#branch=bleed')
        #'RA2::git://github.com/OpenRA/ra2.git')
        #'D2::git://github.com/OpenRA/d2.git')
md5sums=('SKIP')
         #'SKIP')
         #'SKIP')


pkgver() {
  cd "$srcdir/OpenRA"
  
  DATE="$(date +%Y%m%d)"
  PV=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null || echo git-`git rev-parse --short HEAD`) ### get GIT version
  echo "BLEED."$DATE""$PV | sed -e 's/git-/./g' 
}



#prepare() {    ### No Longer Required
#  cd OpenRA    ###
#               ###
#  make version ###
#}              ###

build() {
  cd OpenRA
    #make dependencies      ### Verify Dependencies.
    make all DEBUG=false TARGETPLATFORM=unix-generic   ### Build application and tools...
    #make test DEBUG=false  ### Checking the build, for erroneous yaml files...
    #make check DEBUG=false ### Checking the build, for StyleCop violations...
    #make docs DEBUG=false ### This exists in the Makefile, but is unused? (Make Documentation, mainly aimed at modders)
  cd ../

#  cd RA2
#  if [ -e engine ]; then
#  	rm -r engine
#  fi
#  ln -s ../OpenRA engine
#  #patch -p1 mod.config < $srcdir/RA2-mod.config.patch
#  SPEC_VER="$(cat mod.config | grep ENGINE_VERSION | sed -e 's/=/\n/g' | head -2 | tail -1)"
#  cat mod.config | sed -e s/"$SPEC_VER"/'"{DEV_VERSION}"'/g > mod.config.1
#  mv mod.config.1 mod.config
#  echo '"AUTOMATIC_ENGINE_MANAGEMENT"="False"' > "user.config"
#  make 
  
}

package() {
  cd OpenRA

  make prefix=/usr DESTDIR="$pkgdir" install DEBUG=false                    ### game data...
  make prefix=/usr DESTDIR="$pkgdir" install-linux-shortcuts DEBUG=false    ### all the beautiful shortcuts...
  #make prefix=/usr DESTDIR="$pkgdir" install-linux-mime DEBUG=false        ### apparently removed...
  #make prefix=/usr DESTDIR="$pkgdir" install-linux-appdata DEBUG=false     ### apparently removed...
  
  
  if [ -e $srcdir/RA2 ]; then
  ### adding RA2 to OpenRA
  #if [ ! -d $pkgdir/usr/lib/openra/mods/ra2 ]; then
  #mkdir -p $pkgdir/usr/lib/openra/mods/
  #fi
  cp -rf $srcdir/RA2/mods/ra2 $pkgdir/usr/lib/openra/mods/ra2
  cp -rf $srcdir/RA2/OpenRA.Mods*  $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/*.png  $pkgdir/usr/lib/openra/mods/ra2
   
  #cp -rf $srcdir/RA2/mods/ra2/audio $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/chrome $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/bits $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/installer $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/languages $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/maps $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/rules $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/sequences $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/tilesets $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/uibits $pkgdir/usr/lib/openra/mods/ra2 
  #cp -rf $srcdir/RA2/mods/ra2/weapons $pkgdir/usr/lib/openra/mods/ra2 
  #########################################################
  fi

  if [ -e $srcdir/D2 ]; then
  ### adding DuneII to OpenRA
  if [ ! -d $pkgdir/usr/lib/openra/mods/d2 ]; then
  mkdir $pkgdir/usr/lib/openra/mods/d2
  fi
  cp -rf $srcdir/D2/OpenRA.Mods*  $pkgdir/usr/lib/openra/mods/d2 
  cp -rf $srcdir/D2/*.yaml  $pkgdir/usr/lib/openra/mods/d2 
  cp -rf $srcdir/D2/*.png   $pkgdir/usr/lib/openra/mods/d2 
  cp -rf $srcdir/D2/audio  $pkgdir/usr/lib/openra/mods/d2 
  cp -rf $srcdir/D2/chrome  $pkgdir/usr/lib/openra/mods/d2 
  cp -rf $srcdir/D2/bits  $pkgdir/usr/lib/openra/mods/d2 
  ##cp -rf $srcdir/D2/installer  $pkgdir/usr/lib/openra/mods/d2  ### installer hasnt been made yet.
  cp -rf $srcdir/D2/languages  $pkgdir/usr/lib/openra/mods/d2 
  cp -rf $srcdir/D2/maps  $pkgdir/usr/lib/openra/mods/d2 
  cp -rf $srcdir/D2/rules  $pkgdir/usr/lib/openra/mods/d2 
  cp -rf $srcdir/D2/sequences  $pkgdir/usr/lib/openra/mods/d2 
  cp -rf $srcdir/D2/tilesets  $pkgdir/usr/lib/openra/mods/d2 
  ##cp -rf $srcdir/D2/uibits  $pkgdir/usr/lib/openra/mods/d2    ### Missing atm.
  cp -rf $srcdir/D2/weapons  $pkgdir/usr/lib/openra/mods/d2 
  #########################################################
  fi

}
