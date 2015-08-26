# Maintainer: David Manouchehri <d@32t.ca>

pkgname=ccsc
pkgver=5.012
pkgrel=1
pkgdesc="Proprietary PIC C compiler by CCS"
arch=('i686' 'x86_64')
url="http://www.ccsinfo.com/content.php?page=compilers"
license=('unknown')
source=('pcml.run' 'pcm.crg')
sha512sums=('81d1a4a7ac535f1d31b95cdd2cd3af2d5f878472639ac1855bc451dc7774fe0250b17d7bf919e52ffc0276f42972081429d030de370e1ef3df07668fe9f5e73d'
            'SKIP')

build() {	
  cd $srcdir
  test -s pcm.crg || (printf "\e[1;31mPlease add your registration file to pcm.crg.\e[0m\n"; exit 1)
  test -s pcml.run || (printf "\e[1;31mPlease add your installer file to pcml.run.\e[0m\n"; exit 1)
  ./pcml.run --noexec --target $srcdir/extract/ 
  cd $srcdir/extract/
  rm install # Not needed, no need to keep
}

package() {
  mkdir -p $pkgdir/opt/$pkgname/
  mkdir $pkgdir/etc
  mkdir -p $pkgdir/usr/bin/
  cp $srcdir/pcm.crg $pkgdir/opt/$pkgname/ # This is the registration file
  cp -r $srcdir/extract/* $pkgdir/opt/$pkgname/ # "Install" the main program
  printf "i=/opt/$pkgname/devices/:/opt/$pkgname/drivers/" > $pkgdir/etc/ccsc.ini
  mv $pkgdir/opt/$pkgname/ccsc.bin $pkgdir/opt/$pkgname/ccsc
  printf "export LD_LIBRARY_PATH=\"/opt/$pkgname/so:\$LD_LIBRARY_PATH\"; /opt/$pkgname/ccsc \"\$@\"" > $pkgdir/usr/bin/ccsc 
  chmod +x $pkgdir/usr/bin/ccsc
}
