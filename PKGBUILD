# Maintainer: atrament666

pkgname=jerry-git
pkgver=v3.2.0.r8.gf19447f
pkgrel=1
pkgdesc='A chess program build around powerful chess engine Stockfish'
arch=('i686' 'x86_64')
url=http://jerry-chess.github.io
license=('GPL')
depends=('qt5-svg')
provides=('jerry')
sha256sums=('SKIP' 
            '4c62aa9bf79969c71c60962a68d46aeff2c54c398bf76b106f58764f2f25b80d' 
            '2bff53051f51a1a0e85a0fcfea2dd912917ae6ac436a9f66f60479c565ae8dfd')

source=('git+https://github.com/asdfjkl/jerry.git#branch=master' 
        'fix_desktop_file.patch' 
        'fix_stockfish_path.patch')

prepare() {
  cd $srcdir/jerry
  patch --strip=1 -i $srcdir/fix_stockfish_path.patch
  patch --strip=1 -i $srcdir/fix_desktop_file.patch
}

pkgver() {
  cd $srcdir/jerry
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd $srcdir/jerry
  mkdir -p bin
  cd bin
  qmake ../jerry3.pro
  make
}

package() {
  depends=('stockfish')
  install -v ${srcdir}/jerry/bin/Jerry -m 755 -D ${pkgdir}/usr/bin/jerry
  install -v ${srcdir}/jerry/debian_package_files/jerry.desktop -m 755 -D ${pkgdir}/usr/share/applications/jerry.desktop
  install -v ${srcdir}/jerry/res/icons/jerry_icon256.png -m 755 -D ${pkgdir}/usr/share/jerry/icons/jerry_icon256.png
}
