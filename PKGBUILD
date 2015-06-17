# Maintainer: M0Rf30
pkgname=bzzwolfsp-svn
pkgver=1634 
pkgrel=1
pkgdesc="A Return to Castle Wolfenstein Single Player engine mod to make Cooperative play possible"
arch=('i686' 'x86_64')
url="https://code.google.com/p/bzzwolfsp/"
license=('GPL')
depends=('wolf-data' 'sdl2' 'opus' 'opusfile' 'libogg' 'zlib')
makedepends=('cmake' 'subversion')
install='bzzwolfsp-svn.install'
source=("bzzwolfsp::svn+http://bzzwolfsp.googlecode.com/svn/trunk/"
	'bzzwolfsp.launcher'
	'bzzwolfspded.launcher'
	'Makefile.local'
	'create_pk3.sh')

pkgver() {
  cd bzzwolfsp
  svnversion | tr -d [A-z]
}

build() {
  cd bzzwolfsp
  if [ ! -f /opt/wolf-data/pak0.pk3 ]; then
    echo "pak0.pk3 doesn't exist. This process will be terminated"
    echo "Follow the wolf-data package instructions!"
  exit 1
  fi
  
  cp $srcdir/Makefile.local .
  make release
}

package() {
  cd bzzwolfsp
  
  mkdir -p $pkgdir/opt/bzzwolfsp/{coopmain,main}
  
  make COPYDIR=$pkgdir/opt/bzzwolfsp/ copyfiles
  
  ln -s -r /opt/wolf-data/mp_bin.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak0.pk3   $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak1.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak2.pk3	$pkgdir/opt/bzzwolfsp/main  
  ln -s -r /opt/wolf-data/mp_pak3.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak4.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak5.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps0.pk3	$pkgdir/opt/bzzwolfsp/main  
  ln -s -r /opt/wolf-data/mp_pakmaps1.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps2.pk3	$pkgdir/opt/bzzwolfsp/main  
  ln -s -r /opt/wolf-data/mp_pakmaps3.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps4.pk3	$pkgdir/opt/bzzwolfsp/main  
  ln -s -r /opt/wolf-data/mp_pakmaps5.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps6.pk3	$pkgdir/opt/bzzwolfsp/main  
  ln -s -r /opt/wolf-data/scripts	$pkgdir/opt/bzzwolfsp/main 
  ln -s -r /opt/wolf-data/pak0.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/sp_pak1.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/sp_pak2.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/sp_pak3.pk3	$pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/rotate.cfg	$pkgdir/opt/bzzwolfsp/main     
  
 # Create Coop PK3
  cp $srcdir/create_pk3.sh .
  ./create_pk3.sh
  cp media/*.pk3 $pkgdir/opt/bzzwolfsp/coopmain
  
 # Modify Launcher Scripts
    if [ "$CARCH" = "x86_64" ]; then
        #
        # x86_64 Systems
        #
        sed -i "s:ARCH:x86_64:" \
            $srcdir/bzzwolfsp.launcher
        sed -i "s:ARCH:x86_64:" \
            $srcdir/bzzwolfspded.launcher
    else
        #
        # i686 Systems
        #
        sed -i "s:ARCH:i386:" \
            $srcdir/bzzwolfsp.launcher
        sed -i "s:ARCH:i386:" \
            $srcdir/bzzwolfspded.launcher
    fi
  

  # Install Launcher Script (Single Player Client)
    install -D -m 755 $srcdir/bzzwolfsp.launcher \
        $pkgdir/usr/bin/bzzwolfsp
  # Install Launcher Script (Multi Player Client)
    install -D -m 755 $srcdir/bzzwolfspded.launcher \
        $pkgdir/usr/bin/bzzwolfspded
}

md5sums=('SKIP'
         'e7d7237e08b1affeab32e52f7d5e3244'
         'b1f5b0189e4576e4b606f98dd2ec0141'
         '53a8ec6a5b3a67f73fe876dbe2384b95'
         'cbdfd0fcc3b6ca0bec6cc28c0ec66aa8')
