# Maintainer: Thibaud Mouton < thibaud dot mouton at gmail dot com>

pkgname=mathmod-cvs
pkgver=r202
pkgrel=1
pkgdesc="Mathematical modeling software"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mathmod/"
license=('GPL')
depends=('qt5-base' 'mesa')
makedepends=('svn')

provides=('mathmod-cvs')

# svn checkout svn://svn.code.sf.net/p/mathmod/branches/ mathmod

source=("$pkgname"::'svn+http://svn.code.sf.net/p/mathmod/branches/trunk/#revision=202' MathMod.pro.diff)
md5sums=('SKIP'
         '7f398f5e2cea4b4bc65ec9f978780b21')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
  cd "$srcdir/$pkgname"
  patch < $srcdir/MathMod.pro.diff || return 1 
  # hack for myressources.qrc complaining
  touch "path.txt"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname"
  
  # install script is not working correctly so we install by ourself
  # Install executable
  install -D -m755 "MathMod" "${pkgdir}/usr/bin/${pkgname}"
  strip "$pkgdir/usr/bin/${pkgname}"  

  # Install shortcut and icon
  install -D -m644 "icon/catenoid_mini_64x64.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png" 
}
