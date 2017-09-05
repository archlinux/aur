#Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.2.4
pkgrel=2
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt4' 'hamlib' 'fftw' 'openjpeg2')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop
        color.cpp.patch
        qsstv.pro.patch)
arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('a354fcc086c08b5bea69416d9d5f9ad7bde5ff496edeecf6403249c77d8f27176b6928dc9885c924a8f61db087a4c8286f1b6f26a73034b72723ba390ce8a9fd'
            '99aa49c0e03c03ec645196354c809016fbcdf6106aea8d79b4ed9e90f0d1127eabbc08a6bd20b3c4f66866aa3ffcc35beaf16cd6a926c9996f3ec431bb8759e8'
            'cf2e56b9fb1718a8d3b1f66744e18447f9fa894b56b1d0f1e6456039febb2d0042c6733a032f604cf176155a54c5ddbcbe8da587136e4b790b0a05a57e8231ec'
            '1f577693604853970c56f3ed01df95ad9e84861f67658e5b01c407f81dc53aa38362b63226137c15b0a9aceb08fd1b763594b839452f2e992d10ed15b5a384f3')

build() {
  
  cd $srcdir
  patch -p0 < color.cpp.patch
  patch -p0 < qsstv.pro.patch

  cd $srcdir/${pkgname}_$pkgver

  # trick qmake
  qmake-qt4 PREFIX=$pkgdir/usr/
  make $MAKEFLAGS
}

package() {
  cd $srcdir/${pkgname}_$pkgver
  mkdir -p $pkgdir/usr/bin/
  make INSTALL_ROOT=$pkgdir install

  cd $srcdir
  install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/${pkgname}_$pkgver/qsstv/icons/${pkgname}.png $pkgdir/usr/share/pixmaps/${pkgname}.png
}
