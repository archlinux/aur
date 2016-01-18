# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=motogt
pkgver=20110505
pkgrel=3
pkgdesc="MotoGT is a 2D top-viewed game where you drive a MotoGP bike"
arch=('i686' 'x86_64')
url="http://motogt.sourceforge.net/"
license=('GPL2')
depends=('freeglut' 'libpng' 'sfml1.6')
source=(http://prdownloads.sourceforge.net/motogt/MotoGT-$pkgver.zip
        motogt
        motogt-init.patch
        motogt-png15.patch
        motogt-savedir.patch
        MotoGT.desktop
        MotoGT.png)
md5sums=('5fa3a8ba52ea75bc46f011906ddc6747'
         'fe654d2910156d66efce53f82a1add08'
         '70eee66a05be2b7bf799bbf392e10fc6'
         'b653c830225c2fe5abccd6b7134a2e51'
         '03f67136094c2eafea5daa05ea7f44b9'
         '969b607bd91ebf06f2efd6e0d6595a28'
         '7d426217b802a5691e568134cef89160')


build() {
  cd $srcdir

  patch -p0 -i ../motogt-init.patch
  patch -p0 -i ../motogt-png15.patch
  patch -p0 -i ../motogt-savedir.patch

  # Patches (Add glut, OpenGL and use sfml1.6 libraries in Makefile.lnx)
  cd MotoGT
  sed -i 's%ffast-math%& -I/usr/include/sfml-1.6%' src/Makefile.lnx
  sed -i '4d' src/Makefile.lnx
  #sed -i '4iLIBS= -s -lglut -lGL -lpng -lsfml1.6-window -lsfml1.6-graphics -lsfml1.6-system -lsfml1.6-audio' src/Makefile.lnx
  sed -i '4iLIBS= -s -lglut -lGL -lpng -lsfml-window-1.6 -lsfml-graphics-1.6 -lsfml-system-1.6 -lsfml-audio-1.6' src/Makefile.lnx

  # Build
  make
}

package() {
  cd $srcdir/MotoGT

  # Installation
  mkdir -p $pkgdir/usr/share/MotoGT
  install -Dm755 MotoGT.bin $pkgdir/usr/share/MotoGT/MotoGT.bin
  cp -R data/ data_low/ $pkgdir/usr/share/MotoGT

  # Start file
  cd $startdir
  install -Dm755 motogt $pkgdir/usr/bin/motogt

  # Desktop icon
  install -Dm644 MotoGT.png $pkgdir/usr/share/pixmaps/MotoGT.png
  install -Dm644 MotoGT.desktop $pkgdir/usr/share/applications/MotoGT.desktop
}
