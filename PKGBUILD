# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=motogt
pkgver=20170406
pkgrel=1
pkgdesc="2D top-viewed game where you drive a MotoGP bike"
arch=('i686' 'x86_64')
url="http://motogt.sourceforge.net/"
license=('GPL2')
depends=('freeglut' 'libpng' 'sfml1.6')
source=(https://sourceforge.net/code-snapshots/git/m/mo/motogt/code.git/motogt-code-3fdecfabc26fd2d837c44d92dfe7bf1bed31d4c3.zip
        motogt
        MotoGT.desktop
        MotoGT.png)
md5sums=('f13593f2833c15b72cc5c07907ac880f'
         'fe654d2910156d66efce53f82a1add08'
         '969b607bd91ebf06f2efd6e0d6595a28'
         '7d426217b802a5691e568134cef89160')

build() {
  cd $srcdir
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
