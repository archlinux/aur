# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=oclint
pkgver=0.10.3
pkgrel=1
pkgdesc="A static source code analysis tool to improve quality and reduce
defects for C, C++ and Objective-C"
arch=('i686' 'x86_64')
url="http://oclint.org/"
license=('BSD')
dependencies=('clang' 'clang-analyzer' 'llvm' 'llvm-libs')
makedepends=('cmake' 'subversion' 'python' 'llvm' 'libxml2')
source=("https://github.com/oclint/oclint/archive/v${pkgver}.tar.gz")
md5sums=('bed45dd31e64cc5ddaa3a031f9435a27')

build() {
  cd "$srcdir/$pkgname-$pkgver/oclint-scripts"
  ./build -llvm-root=/usr -release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

  # FIX: Copy llvm LICENSE file for bundle script
  mkdir -p llvm
  cp /usr/include/llvm/Support/LICENSE.TXT llvm

  # Run bundle scripts
  cd oclint-scripts
  ./bundle -llvm-root=/usr -release
  cd ..

  mkdir -p $pkgdir/usr/bin
  cp ./build/oclint-release/bin/oclint-$pkgver $pkgdir/usr/bin/oclint

  mkdir -p $pkgdir/usr/lib/oclint
  cp -r ./build/oclint-release/lib/oclint/* $pkgdir/usr/lib/oclint/
}
