# Maintainer: M0Rf30

pkgname=rtcwcoop-git
pkgver=1.0.2.r3.g8695325f 
pkgrel=1
pkgdesc="A Return to Castle Wolfenstein modification which enables cooperative gameplay, based on iortcw"
arch=('i686' 'x86_64')
url="http://www.rtcwcoop.com"
license=('GPL')
depends=('wolf-data' 'freetype2' 'sdl2' 'openal' 'opus' 'opusfile' 'libogg' 'zlib')
makedepends=('cmake' 'git')
noextract=('patch-data-141.zip')
install='rtcwcoop-git.install'
source=("rtcwcoop::git+https://github.com/rtcwcoop/rtcwcoop.git"
	"https://github.com/rtcwcoop/rtcwcoop/releases/download/1.0.2/patch-data-141.zip"
	'rtcwcoop.launcher'
	'rtcwcoopded.launcher'
	'create_pk3.sh'
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
  
  mkdir -p $pkgdir/opt/rtcwcoop/{coopmain,main}
  unzip -o patch-data-141.zip -d $srcdir/patch-data
  cd $srcdir/patch-data/main
  cp -r *.pk3 $pkgdir/opt/rtcwcoop/main
  cp -r scripts $pkgdir/opt/rtcwcoop/main
  cp -r rotate.cfg $pkgdir/opt/rtcwcoop/main
  cp -r ../pb $pkgdir/opt/rtcwcoop/main
 
  rm $pkgdir/opt/rtcwcoop/main/pb/{*.dll,*.mac,*.exe}
  
  cd $srcdir/rtcwcoop
  
  make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/rtcwcoop/ copyfiles
  
  ln -s -r /opt/wolf-data/mp_pak0.pk3   $pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak1.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak2.pk3	$pkgdir/opt/rtcwcoop/main  
  ln -s -r /opt/wolf-data/pak0.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/sp_pak1.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/sp_pak2.pk3	$pkgdir/opt/rtcwcoop/main
  
 # Create Coop PK3
  cp $srcdir/create_pk3.sh .
  ./create_pk3.sh
  cp media/*.pk3 $pkgdir/opt/rtcwcoop/coopmain
  
 # Modify Launcher Scripts
    if [ "$CARCH" = "x86_64" ]; then
        #
        # x86_64 Systems
        #
        sed -i "s:ARCH:x86_64:" \
            $srcdir/rtcwcoop.launcher
        sed -i "s:ARCH:x86_64:" \
            $srcdir/rtcwcoopded.launcher
    else
        #
        # i686 Systems
        #
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
         '291a37caa9d65d0b81f767918b76fa56'
         '301306637434f08f4958f1ed4734f68f'
         'c4b7030bb2739c46eef479fd1f3d1b63'
         '32223e6aec5bb6f425d0f7b5a5c41416'
         'bf26dc4c10d4bbfbd0c7a052a00c3cdf'
         'd09a95bbf34f3a37a77247c267e4a51b')
