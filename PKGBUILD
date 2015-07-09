# Maintainer: Malte Wessel <muunleit AT lavabit DOT com>

pkgname=atomzombiesmasher
pkgver=1.94
pkgrel=2
pkgdesc="RTS, evacuating civilians out of zombie-contaminated cities. (Commercial)"
arch=('any')
url="http://blendogames.com/atomzombiesmasher/"
license=("custom:commercial")
[ "$CARCH" = "x86_64" ] && depends=('libgdiplus' 'mono' 'csfml-bin')
conflicts=("atomzombiesmasherdemo")
#source=("http://blendogames.com/files/atomzombiepatch_v${pkgver//./_}_linux.tar")
source=("http://blendogames.com/files/atomzombiepatch_v${pkgver//./_}_linux.tar.gz")
md5sums=('c9512b8c841841967c20a81d36f7a6bc')

# Different known files delivered by Blendo-Games
_v1_23="${pkgname}_v1_23.tar.gz"
_v1_23md5="3286a655fd6a34cf376d69a185b5e53f"
_v1_85="${pkgname}_v1_85.tar"
_v1_85md5="304a494d4c81296c0d13b6cbe051e04c"


build() {
  # Check if game-archive is in build directory
  cd $startdir
  if [[ -e $_v1_23 ]]; then   # If you get another file from Blendo Games, please change it here
    _gamepkg=$_v1_23
    _gamemd5=$_v1_23md5
  elif [[ -e $_v1_85 ]]; then
    _gamepkg=$_v1_85
    _gamemd5=$_v1_85md5
  else
    msg "!! AtomZombieSmasher is a commercial game.
    !! You need a full copy of this game in order to install it.
    !! Please copy $_v1_23 or $_v1_85
    !! to $startdir " && return 1
  fi

  # Validate game-archive
  if [[ "$(md5sum $_gamepkg | awk '{print $1}')" == "$_gamemd5" ]]; then
    msg "Check: $_gamepkg is the correct."
  else
    msg "!! Check: $_gamepkg didn't match md5sum!" && return 1
  fi

  # Extract game-archive
  msg "Extracting archive..."
  tar xaf $startdir/$_gamepkg -C $srcdir 

  cd $srcdir/$pkgname
  sed -i "s/\.\/data/\/opt\/$pkgname\/data/g" AtomZombieSmasher

  # Copy from patch to game
  if ! [[ "$_gamepkg" =~ "${pkgver//./_}" ]]; then
    msg "Patching to version $pkgver ..."
    cp -a $srcdir/data        $srcdir/$pkgname/
    cp -a $srcdir/readme.htm  $srcdir/$pkgname/
  fi

  # Create startscript
	cat > $srcdir/$pkgname.desktop <<- EOF
  [Desktop Entry]
  Name=AtomZombieSmasher
  GenericName=AtomZombieSmasher
  Comment=RTS, evacuating civilians out of zombie-contaminated cities
  Exec=atomzombiesmasher
  Icon=/opt/atomzombiesmasher/data/content/textures/icon.png
  Terminal=false
  Type=Application
  Categories=Game;
	EOF
}

package() {
  # Create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/doc/$pkgname
  install -d $pkgdir/usr/share/applications
  install -g games -d $pkgdir/opt/$pkgname

  # Copy game
  cp -a $srcdir/$pkgname/*              $pkgdir/opt/$pkgname
  mv $pkgdir/opt/$pkgname/readme.htm    $pkgdir/usr/share/doc/$pkgname
  cp -a $srcdir/$pkgname.desktop        $pkgdir/usr/share/applications/

  # executable link
  ln -s /opt/$pkgname/AtomZombieSmasher $pkgdir/usr/bin/$pkgname
  
  if [ "$CARCH" = "x86_64" ]; then
    # remove packaged libraries
    cd $pkgdir/opt/$pkgname/data
    rm *.so*
    rm `ls | grep .dll | grep -v ^sfmlnet | grep -v ^Tao`

    # point startup script to system mono
    sed -i "s|\./mono|mono|" atomzombiesmasher
  fi

}

# vim:set ts=2 sw=2 et:
