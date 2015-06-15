# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=oclint
pkgver=0.8.1
_pkgver=0.8
pkgrel=1
pkgdesc="static code analysis tool for improving quality and reducing defects"
arch=('i686' 'x86_64')
url="http://oclint.org/"
license=('BSD')
dependencies=('clang' 'clang-analyzer' 'llvm' 'llvm-libs')
makedepends=('cmake' 'subversion' 'python2' 'libxml2')
source=(http://archives.oclint.org/releases/$_pkgver/$pkgname-$pkgver-src.tar.gz)
md5sums=('58567911cb0a93858de8ad76590d769a')

build() {
  cd "$srcdir/$pkgname-$pkgver-src/oclint-scripts"
  ./build -llvm-root=/usr -release
}

package() {
	cd "$srcdir/$pkgname-$pkgver-src"

  # Copy llvm LICENSE.txt
  mkdir -p llvm
  cp /usr/include/llvm/Support/LICENSE.TXT llvm

  # Run bundle scripts
  cd oclint-scripts
  ./bundle -llvm-root=/usr -release
  cd ..

  # Fix python path
  sed -i '1 s/^.*$/#!\/usr\/bin\/env python2/' ./build/oclint-release/bin/oclint-json-compilation-database

   mkdir -p $pkgdir/usr/bin
   cp ./build/oclint-release/bin/oclint-$pkgver $pkgdir/usr/bin/oclint
   cp ./build/oclint-release/bin/oclint-json-compilation-database $pkgdir/usr/bin/oclint-json-compilation-database
 
   mkdir -p $pkgdir/usr/lib/oclint
   cp -r ./build/oclint-release/lib/oclint/* $pkgdir/usr/lib/oclint/
}
