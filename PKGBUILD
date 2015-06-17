# Maintainer: M0Rf30
pkgname=iortcw-git
pkgver=326
pkgrel=1
pkgdesc="Merge of ioquake3 features and fixes into Return to Castle Wolfenstein"
arch=('i686' 'x86_64')
url="https://github.com/iortcw/iortcw"
license=('GPL')
depends=('wolf-data' 'sdl2' 'openal' 'opus' 'opusfile' 'libogg' 'zlib')
conflicts=('iortcw-svn')
replaces=('iortcw-svn')
makedepends=('cmake' 'subversion')
install='iortcw-svn.install'
source=("git+https://github.com/iortcw/iortcw.git"
	'iortcwsp.launcher'
	'iortcwmp.launcher'
	'iortcwded.launcher'
	'iortcw.desktop'
	'iortcw.png'
	'Makefile.local')

pkgver() {
  cd "$srcdir/iortcw"
  echo $(git rev-list --count master)
}

build() {
  if [ ! -f /opt/wolf-data/pak0.pk3 ]; then
   echo "pak0.pk3 doesn't exist. This process will be terminated"
   echo "Follow the wolf-data package instructions!"
   exit 1
  fi
}

package() {
  
  mkdir -p $pkgdir/opt/iortcw/main
  cd "$srcdir/iortcw"
  
  cd SP
  cp $srcdir/Makefile.local .
  make COPYDIR=$pkgdir/opt/iortcw/ copyfiles
  cd ../MP
  cp $srcdir/Makefile.local .
  make COPYDIR=$pkgdir/opt/iortcw/ copyfiles

    
  ln -s -r /opt/wolf-data/mp_bin.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/mp_pak0.pk3   $pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/mp_pak1.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/mp_pak2.pk3	$pkgdir/opt/iortcw/main  
  ln -s -r /opt/wolf-data/mp_pak3.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/mp_pak4.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/mp_pak5.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/mp_pakmaps0.pk3	$pkgdir/opt/iortcw/main  
  ln -s -r /opt/wolf-data/mp_pakmaps1.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/mp_pakmaps2.pk3	$pkgdir/opt/iortcw/main  
  ln -s -r /opt/wolf-data/mp_pakmaps3.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/mp_pakmaps4.pk3	$pkgdir/opt/iortcw/main  
  ln -s -r /opt/wolf-data/mp_pakmaps5.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/mp_pakmaps6.pk3	$pkgdir/opt/iortcw/main  
  ln -s -r /opt/wolf-data/scripts	$pkgdir/opt/iortcw/main 
  ln -s -r /opt/wolf-data/pak0.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/sp_pak1.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/sp_pak2.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/sp_pak3.pk3	$pkgdir/opt/iortcw/main
  ln -s -r /opt/wolf-data/rotate.cfg	$pkgdir/opt/iortcw/main       
  
# Modify Launcher Scripts
    if [ "$CARCH" = "x86_64" ]; then
        #
        # x86_64 Systems
        #
        sed -i "s:ARCH:x86_64:" \
            $srcdir/iortcwsp.launcher
        sed -i "s:ARCH:x86_64:" \
            $srcdir/iortcwmp.launcher
        sed -i "s:ARCH:x86_64:" \
            $srcdir/iortcwded.launcher
    else
        #
        # i686 Systems
        #
        sed -i "s:ARCH:i386:" \
            $srcdir/iortcwsp.launcher
        sed -i "s:ARCH:i386:" \
            $srcdir/iortcwmp.launcher
        sed -i "s:ARCH:i386:" \
            $srcdir/iortcwded.launcher
    fi
  
  # Install Launcher Script (Single Player Client)
    install -D -m 755 $srcdir/iortcwsp.launcher \
        $pkgdir/usr/bin/iortcwsp
  # Install Launcher Script (Multi Player Client)
    install -D -m 755 $srcdir/iortcwmp.launcher \
        $pkgdir/usr/bin/iortcwmp
  # Install Launcher Script (Dedicated Server)
    install -D -m 755 $srcdir/iortcwded.launcher \
        $pkgdir/usr/bin/iortcwded
  
  # Install Desktop File (Single Player)
    install -D -m 644 $srcdir/iortcw.desktop \
        $pkgdir/usr/share/applications/iortcw.desktop

  # Install Icon File (Single Player)
    install -D -m 644 $srcdir/iortcw.png \
        $pkgdir/usr/share/pixmaps/iortcw.png
}

md5sums=('SKIP'
         'e400094c42766cb2b130d4d95bbe1caf'
         'bbc343567fa9a2f0101bdbd07cc9d32a'
         '1cb1d7fda29d223a57003d097a1a4a31'
         '30c95f4d2b130703d36345ebd259d738'
         'bf26dc4c10d4bbfbd0c7a052a00c3cdf'
         '8fbd50c6b07bd89bc40b1c61d61c9431')
