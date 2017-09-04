# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=oclint
pkgver=0.12
pkgrel=1
pkgdesc="A static source code analysis tool to improve quality and reduce
defects for C, C++ and Objective-C"
arch=('i686' 'x86_64')
url="http://oclint.org/"
license=('BSD')
dependencies=('clang' 'clang-analyzer' 'llvm' 'llvm-libs' 'openssl')
makedepends=('clang' 'cmake' 'subversion' 'python' 'llvm' 'libxml2'
'countly-cpp')
source=("https://github.com/oclint/oclint/archive/v${pkgver}.tar.gz"
        "openssl.patch")
sha1sums=('5b5adc001fff5733e55a90a498c3fe57f9fdda8e'
          '234485f8cd210794cfb393e8b550079c33d21192')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/openssl.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver/oclint-scripts"
  ./makeWithSystemLLVM /usr
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
