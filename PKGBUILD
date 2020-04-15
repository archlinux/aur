# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=oclint
pkgver=0.15
pkgrel=1
pkgdesc="A static source code analysis tool to improve quality and reduce
defects for C, C++ and Objective-C"
arch=('i686' 'x86_64')
url="http://oclint.org/"
license=('BSD')
dependencies=('clang' 'clang-analyzer' 'llvm' 'llvm-libs' 'openssl')
makedepends=('clang' 'cmake' 'ninja' 'subversion' 'python' 'llvm')
source=("https://github.com/oclint/oclint/archive/v${pkgver}.tar.gz"
        "oclint-llvm-link.patch")
sha1sums=('0951193cb2e594ac212fea05e51355be8f9b0172'
          '73d13cad422f5bf5e8383376182ca8addbc586de')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/oclint-llvm-link.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver/oclint-scripts"
  ./makeWithSystemLLVM /usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

  # FIX: Copy llvm LICENSE file for bundle script
  # mkdir -p llvm
  # cp /usr/include/llvm/Support/LICENSE.TXT llvm

  # Run bundle scripts
  cd oclint-scripts
  ./bundle -llvm-root=/usr -release
  cd ..

  mkdir -p $pkgdir/usr/bin
  cp ./build/oclint-release/bin/oclint-$pkgver $pkgdir/usr/bin/oclint

  mkdir -p $pkgdir/usr/lib/oclint
  cp -r ./build/oclint-release/lib/oclint/* $pkgdir/usr/lib/oclint/
}
