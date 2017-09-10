# Maintainer: M0Rf30
pkgname=rtcwcoop-git
pkgver=1634 
pkgrel=1
pkgdesc="A Return to Castle Wolfenstein modification which enables cooperative gameplay, based on iortcw"
arch=('i686' 'x86_64')
url="http://www.rtcwcoop.com"
license=('GPL')
depends=('wolf-data' 'sdl2' 'opus' 'opusfile' 'libogg' 'zlib')
makedepends=('cmake' 'git')
install='rtcwcoop-git.install'
source=("rtcwcoop::git+https://github.com/rtcwcoop/rtcwcoop.git"
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
  cd rtcwcoop
  
  cd SP
  make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/rtcwcoop/ copyfiles
  cd ../MP
  make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/rtcwcoop/ copyfiles
  
  ln -s -r /opt/wolf-data/mp_bin.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak0.pk3   $pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak1.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak2.pk3	$pkgdir/opt/rtcwcoop/main  
  ln -s -r /opt/wolf-data/mp_pak3.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak4.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pak5.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pakmaps0.pk3	$pkgdir/opt/rtcwcoop/main  
  ln -s -r /opt/wolf-data/mp_pakmaps1.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pakmaps2.pk3	$pkgdir/opt/rtcwcoop/main  
  ln -s -r /opt/wolf-data/mp_pakmaps3.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pakmaps4.pk3	$pkgdir/opt/rtcwcoop/main  
  ln -s -r /opt/wolf-data/mp_pakmaps5.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/mp_pakmaps6.pk3	$pkgdir/opt/rtcwcoop/main  
  ln -s -r /opt/wolf-data/scripts	$pkgdir/opt/rtcwcoop/main 
  ln -s -r /opt/wolf-data/pak0.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/sp_pak1.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/sp_pak2.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/sp_pak3.pk3	$pkgdir/opt/rtcwcoop/main
  ln -s -r /opt/wolf-data/rotate.cfg	$pkgdir/opt/rtcwcoop/main     
  
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
         'e08aab38a8574877258986038f043f89'
         '6630b979c5f9b4ea6e7ff0e2927fa1e1'
         'cbdfd0fcc3b6ca0bec6cc28c0ec66aa8'
         'bf26dc4c10d4bbfbd0c7a052a00c3cdf'
         'f24dc703585569ba11ba0b94625ee8e0')
