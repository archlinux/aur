# Maintainer: M0Rf30

pkgbase=realrtcw
pkgname=('realrtcw' 'realrtcw-rend2')
pkgver=2.1
pkgrel=2
pkgdesc="RealRTCW brings some realism to the classic Wolfenstein game. You can expect ruthless AI, new weapons and rebalanced gameplay"
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/realrtcw-realism-mod"
license=('GPL')
depends=('iortcw-data' 'freetype2' 'sdl2' 'openal' 'opus' 'opusfile' 'libogg' 'zlib')
makedepends=('cmake' 'unzip')
noextract=("realrtcw$pkgver.zip" "hdpack$pkgver.zip")
install='realrtcw.install'
source=("https://github.com/M0Rf30/RealRTCW/archive/$pkgver.tar.gz"
	"https://github.com/M0Rf30/RealRTCW-assets/raw/master/realrtcw$pkgver.zip"
	"https://github.com/M0Rf30/RealRTCW-assets/raw/master/hdpack$pkgver.zip"
# Classic renderer
	realrtcw-sp.launcher
# Alternative renderer launchers
	realrtcw-sp-rend2.launcher
# Desktop entries
	realrtcw-sp.desktop
	realrtcw-sp-rend2.desktop
)

build() {
  if [ ! -f /opt/iortcw-data/pak0.pk3 ]; then
   echo "pak0.pk3 doesn't exist. The game will not start"
   echo "Follow the iortcw-data package instructions!"
   sleep 5
  fi
}

package_realrtcw() {
  
  mkdir -p $pkgdir/opt/realrtcw/main
  cd "$srcdir/RealRTCW-$pkgver"
  
  cd SP
  make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/realrtcw/ copyfiles
    
  ln -s -r /opt/iortcw-data/mp_bin.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak0.pk3   $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak1.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak2.pk3	$pkgdir/opt/realrtcw/main  
  ln -s -r /opt/iortcw-data/mp_pak3.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak4.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak5.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps0.pk3	$pkgdir/opt/realrtcw/main  
  ln -s -r /opt/iortcw-data/mp_pakmaps1.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps2.pk3	$pkgdir/opt/realrtcw/main  
  ln -s -r /opt/iortcw-data/mp_pakmaps3.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps4.pk3	$pkgdir/opt/realrtcw/main  
  ln -s -r /opt/iortcw-data/mp_pakmaps5.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps6.pk3	$pkgdir/opt/realrtcw/main  
  ln -s -r /opt/iortcw-data/scripts	$pkgdir/opt/realrtcw/main 
  ln -s -r /opt/iortcw-data/pak0.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/sp_pak1.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/sp_pak2.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/sp_pak3.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/sp_pak4.pk3	$pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/rotate.cfg	$pkgdir/opt/realrtcw/main       

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

md5sums=('0b40f6d1e2f31fe42d3a54359694dc03'
         '0e0ef11b046ced39e880638d41c65dd4'
         '6856b2ec43abce7be5d92233ef3ddaa1'
         '3de1b5dde5c91ef521c64b5e56cdbccf'
	 '3cf6ad712d1d797e09c232dcf43c016b'
         '33f08bc165906164461420e1cc6dd86a'
         'f164bb4457675fd05897e2945e2d8c9d')
