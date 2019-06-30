# Maintainer: robertfoster

pkgname=rtcwcoop-git
pkgver=1.0.2.r46.g799bc3c0 
pkgrel=1
pkgdesc="A Return to Castle Wolfenstein modification which enables cooperative gameplay, based on iortcw"
arch=('i686' 'x86_64')
url="http://www.rtcwcoop.com"
license=('GPL')
depends=('wolf-data' 'freetype2' 'sdl2' 'libjpeg-turbo' 'openal' 'opus' 'opusfile' 'libogg' 'zlib')
makedepends=('cmake' 'git' 'zip')
noextract=('patch-data-141.zip')
install='rtcwcoop-git.install'
source=("rtcwcoop::git+https://github.com/rtcwcoop/rtcwcoop.git"
	'rtcwcoop.launcher'
	'rtcwcoopded.launcher'
	'rtcwcoop.png'
	'rtcwcoop.desktop')

pkgver() {
  cd "$srcdir/rtcwcoop"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  if [ ! -f /opt/wolf-data/pak0.pk3 ]; then
   echo "pak0.pk3 doesn't exist. The game will not start"
   echo "Follow the wolf-data package instructions!"
   sleep 5
  fi
}

package() {
  cd "$srcdir/rtcwcoop"

  mkdir -p $pkgdir/opt/rtcwcoop/{coopmain,main}
   
  cd $srcdir/rtcwcoop
  
  make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/rtcwcoop/ copyfiles
  
  ln -s -r /opt/wolf-data/mp_pak0.pk3   $pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak1.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak2.pk3	$pkgdir/opt/rtcwcoop/main  
  ln -s -r /opt/wolf-data/mp_pak3.pk3   $pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak4.pk3   $pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak5.pk3   $pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/pak0.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/sp_pak1.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/sp_pak2.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/sp_pak3.pk3   $pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/sp_pak4.pk3   $pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/scripts	$pkgdir/opt/rtcwcoop/main 
  ln -s -r /opt/wolf-data/rotate.cfg	$pkgdir/opt/rtcwcoop/main       
  
 # Create Coop PK3
    if [ "$CARCH" = "x86_64" ]; then

        # x86_64 Systems
	./create_pk3_64.sh release
    else

        # i686 Systems
        ./create_pk3.sh release
    fi

  cp media/{bin,sp_pak_coop1}.pk3 $pkgdir/opt/rtcwcoop/coopmain
  
 # Modify Launcher Scripts
    if [ "$CARCH" = "x86_64" ]; then
        # x86_64 Systems

        sed -i "s:ARCH:x86_64:" \
            $srcdir/rtcwcoop.launcher
        sed -i "s:ARCH:x86_64:" \
            $srcdir/rtcwcoopded.launcher
    else
        # i686 Systems

        sed -i "s:ARCH:i386:" \
            $srcdir/rtcwcoop.launcher
        sed -i "s:ARCH:i386:" \
            $srcdir/rtcwcoopded.launcher
    fi
  
  # Install Launcher Script (Single Player Client)
    install -D -m 755 $srcdir/rtcwcoop.launcher \
        $pkgdir/usr/bin/rtcwcoop
  # Install Launcher Script (Multi Player Client)
    install -D -m 755 $srcdir/rtcwcoopded.launcher \
        $pkgdir/usr/bin/rtcwcoopded
        
    install -Dm644 $srcdir/rtcwcoop.png $pkgdir/usr/share/pixmaps/rtcwcoop.png
    install -Dm755 $srcdir/rtcwcoop.desktop $pkgdir/usr/share/applications/rtcwcoop.desktop
}

md5sums=('SKIP'
         '301306637434f08f4958f1ed4734f68f'
         'c4b7030bb2739c46eef479fd1f3d1b63'
         'bf26dc4c10d4bbfbd0c7a052a00c3cdf'
         'd09a95bbf34f3a37a77247c267e4a51b')
