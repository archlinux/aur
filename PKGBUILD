# Maintainer: robertfoster

pkgbase=realrtcw
pkgname=('realrtcw' 'realrtcw-rend2')
pkgver=2.2
pkgrel=1
pkgdesc="RealRTCW brings some realism to the classic Wolfenstein game. You can expect ruthless AI, new weapons and rebalanced gameplay"
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/realrtcw-realism-mod"
license=('GPL')
depends=('iortcw-data' 'freetype2' 'sdl2' 'openal' 'opus' 'opusfile' 'libogg' 'zlib')
makedepends=('cmake' 'unzip')
noextract=("realrtcw$pkgver.zip" "hdpack$pkgver.zip")
install='realrtcw.install'
source=("https://github.com/wolfetplayer/RealRTCW/archive/$pkgver.tar.gz"
	"http://www.wolfenstein-files.de/rtcw/mods/$pkgname$pkgver.zip"
	"http://www.wolfenstein-files.de/rtcw/mods/hdpack$pkgver.zip"
# Classic renderer
	realrtcw-sp.launcher
# Alternative renderer launchers
	realrtcw-sp-rend2.launcher
# Desktop entries
	realrtcw-sp.desktop
	realrtcw-sp-rend2.desktop
)

build() {
  if [ ! -f /opt/wolf-data/pak0.pk3 ]; then
   echo "pak0.pk3 doesn't exist. The game will not start"
   echo "Follow the wolf-data package instructions!"
   sleep 5
  fi
}

package_realrtcw() {
  
  mkdir -p $pkgdir/opt/realrtcw/main
  cd "$srcdir/RealRTCW-$pkgver"
  
  make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/realrtcw/ copyfiles
    
  ln -s -r /opt/wolf-data/mp_pak0.pk3   $pkgdir/opt/realrtcw/main
  ln -s -r /opt/wolf-data/mp_pak1.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/wolf-data/mp_pak2.pk3	$pkgdir/opt/realrtcw/main  
  ln -s -r /opt/wolf-data/pak0.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/wolf-data/sp_pak1.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/wolf-data/sp_pak2.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/wolf-data/sp_pak3.pk3   $pkgdir/opt/realrtcw/main
  ln -s -r /opt/wolf-data/sp_pak4.pk3   $pkgdir/opt/realrtcw/main

# Unzipping with flattened paths
  unzip -jo $srcdir/realrtcw$pkgver.zip -d $srcdir
  unzip -jo $srcdir/hdpack$pkgver.zip -d $srcdir

# Installing RealRTCW pk3
  install -m 755 $srcdir/z_realrtcw.pk3 \
        $pkgdir/opt/realrtcw/main

# Installing RealRTCW HD pack pk3
  install -m 755 $srcdir/z_hdpack.pk3 \
        $pkgdir/opt/realrtcw/main

# Modify Launcher Scripts
    if [ "$CARCH" = "x86_64" ]; then
        #
        # x86_64 Systems
        #
        sed -i "s:ARCH:x86_64:" \
            $srcdir/realrtcw-sp.launcher
    else
        #
        # i686 Systems
        #
        sed -i "s:ARCH:x86:" \
            $srcdir/realrtcw-sp.launcher
    fi
  
  # Install Launcher Script (Single Player Client)
    install -D -m 755 $srcdir/realrtcw-sp.launcher \
        $pkgdir/usr/bin/realrtcw-sp

  # Install Desktop File (Single Player)
    install -D -m 644 $srcdir/realrtcw-sp.desktop \
        $pkgdir/usr/share/applications/realrtcw-sp.desktop

  # Install Icon File (Single Player)
    install -D -m 644 misc/iortcw.svg \
        $pkgdir/usr/share/pixmaps/realrtcw.svg
}

package_realrtcw-rend2() {
	pkgdesc="Experimental render for RealRTCW"
	
# Modify Launcher Scripts
    if [ "$CARCH" = "x86_64" ]; then
        #
        # x86_64 Systems
        #
        sed -i "s:ARCH:x86_64:" \
            $srcdir/realrtcw-sp-rend2.launcher
    else
        #
        # i686 Systems
        #
        sed -i "s:ARCH:x86:" \
            $srcdir/realrtcw-sp-rend2.launcher
    fi

  # Install Launcher Script (Single Player Client Rend2)
    install -D -m 755 $srcdir/realrtcw-sp-rend2.launcher \
        $pkgdir/usr/bin/realrtcw-sp-rend2

  # Install Desktop File (Single Player Rend2)
    install -D -m 644 $srcdir/realrtcw-sp-rend2.desktop \
        $pkgdir/usr/share/applications/realrtcw-sp-rend2.desktop
}

md5sums=('784c0978eba01201d8cab96b949b3a61'
         'a24763c9d08a87e64c567f6f53296dff'
         '800b2b4f9166a46198c093f9c6365bf3'
         '9e4b9473a017a92a97d71a5a6429fa8c'
         '7e3991e5f331662419ad1ed04e49366c'
         '33f08bc165906164461420e1cc6dd86a'
         'f164bb4457675fd05897e2945e2d8c9d')
