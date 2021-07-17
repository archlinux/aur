# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=motogt
pkgver=20110505
pkgrel=5
pkgdesc="2D top-viewed game where you drive a MotoGP bike"
arch=('i686' 'x86_64')
url="http://motogt.sourceforge.net/"
license=('GPL2')
depends=('freeglut' 'libpng' 'sfml1.6')
source=(http://prdownloads.sourceforge.net/motogt/MotoGT-$pkgver.zip
        motogt
        cumulative.patch.gz
        MotoGT.desktop
        MotoGT.png)
md5sums=('5fa3a8ba52ea75bc46f011906ddc6747'
         'fe654d2910156d66efce53f82a1add08'
         'ad6beb3cb02e2a1800da9c64615436d2'
         '969b607bd91ebf06f2efd6e0d6595a28'
         '7d426217b802a5691e568134cef89160')


build() {
  cd $srcdir

  gunzip -c cumulative.patch.gz | patch -p1

  # Few more patches (Add glut, OpenGL and use sfml1.6 libraries in Makefile.lnx)
  cd MotoGT
  sed -i 's%ffast-math%& -I/usr/include/sfml-1.6%' src/Makefile.lnx
  sed -i '4d' src/Makefile.lnx
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
