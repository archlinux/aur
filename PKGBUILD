# Maintainer: Tarn Burton <twburton at gmail dot com>

pkgname=cocoa
pkgver=0.99555
pkgrel=2
pkgdesc="A C++ library for doing Computations in Commutative Algebra. Also includes the CoCoA-5 Interpreter."
arch=('i686' 'x86_64')
url="http://cocoa.dima.unige.it/"
license=('GPL')
depends=('cddlib' 'gsl' 'boost-libs' 'normaliz' 'cblas' 'lapack' 'readline') #'qt4')
makedepends=('frobby' 'boost')
source=("http://cocoa.dima.unige.it/cocoalib/tgz/CoCoALib-$pkgver.tgz" "package.patch" "cocoa5")
sha256sums=('0a7d96789885027c7fcb875f281aadb613ab5e7ff6e1f233abbf2c499136c517'
            '36689a63fb699806f0fb59a782ca4eff234b86363c517ecc0e0a046318b82bdb'
            'e9cc79cb1e35f28399afe8c2fd8f521da7566a996363e9789ed76d55093511b3')

prepare() {
  cd "$srcdir/CoCoALib-$pkgver"
  patch -Np1 -i ../package.patch
}

build() {
  cd "$srcdir/CoCoALib-$pkgver"
  ./configure --with-libreadline=/usr/lib/libreadline.so \
              --with-libcddgmp=/usr/lib/libcddgmp.so \
              --with-libfrobby=/usr/lib/libfrobby.a \
              --with-libnormaliz=/usr/lib/libnormaliz.so \
              --with-libgsl=/usr/lib/libgsl.so
              #--with-libgfan=/usr/lib/Singular/libgfan.a
  make -s CXXFLAGS='-Wno-deprecated-declarations -fPIC' library
  cd src/CoCoA-5
  make -s CXXFLAGS='-Wno-deprecated-declarations -fPIC' cocoa5
}

package() {
  cd "$srcdir/CoCoALib-$pkgver"
  install -d "$pkgdir/usr/include/CoCoA"
  for file in include/CoCoA/*.H; do
      install "$file" "$pkgdir/usr/$file"
  done
  install -d "$pkgdir/usr/lib"
  install -m 644 lib/libcocoa.a "$pkgdir/usr/lib/libcocoa.a"
  install -d "$pkgdir/usr/lib/CoCoA/bin"
  #install src/server/CoCoAServer "$pkgdir/usr/lib/CoCoA/bin/CoCoAServer"
  #install src/CoCoA-5/C5 "$pkgdir/usr/lib/CoCoA/bin/C5"
  install src/CoCoA-5/CoCoAInterpreter "$pkgdir/usr/lib/CoCoA/bin/CoCoAInterpreter"
  install -d "$pkgdir/usr/lib/CoCoA/packages"
  for file in src/CoCoA-5/packages/*; do
      install "$file" "$pkgdir/usr/lib/CoCoA/packages"
  done
  install -d "$pkgdir/usr/lib/CoCoA/examples"
  for file in examples/*; do
      install "$file" "$pkgdir/usr/lib/CoCoA/examples"
  done
  install -d "$pkgdir/usr/lib/CoCoA/doc"
  for file in doc/*.html; do
      install "$file" "$pkgdir/usr/lib/CoCoA/doc"
  done
  install -d "$pkgdir/usr/lib/CoCoA/doc/html"
  for file in doc/html/*.html; do
      install "$file" "$pkgdir/usr/lib/CoCoA/doc/html"
  done
  install "doc/CoCoALib.pdf" "$pkgdir/usr/lib/CoCoA/doc"
  install "doc/COPYING" "$pkgdir/usr/lib/CoCoA/doc"
  install "COPYING-GPLv3" "$pkgdir/usr/lib/CoCoA"
  install -d "$pkgdir/usr/bin"
  install ../cocoa5 "$pkgdir/usr/bin/cocoa5"
}
