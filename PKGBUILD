# $Id$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=meataxe
pkgver=2.4.24
pkgrel=3
pkgdesc="A set of programs for working with matrix representations over finite fields"
arch=(i686 x86_64)
url="http://www.math.rwth-aachen.de/~MTX/"
license=(GPL)
depends=(glibc)
#source=("http://www.math.rwth-aachen.de/~MTX/$pkgname-$pkgver.tar.gz")
source=("http://trac.sagemath.org/raw-attachment/ticket/12103/meataxe-$pkgver.tar.gz"
	p1.patch::"http://git.sagemath.org/sage.git/plain/build/pkgs/meataxe/patches/IO_fixes.patch?h=develop"
	p2.patch::"http://git.sagemath.org/sage.git/plain/build/pkgs/meataxe/patches/StrassenWinogradImplementation.patch?h=develop"
	p3.patch::"http://git.sagemath.org/sage.git/plain/build/pkgs/meataxe/patches/StrassenWinogradUsage.patch?h=develop"
	p4.patch::"http://git.sagemath.org/sage.git/plain/build/pkgs/meataxe/patches/TweakEchelon.patch?h=develop"
	p5.patch::"http://git.sagemath.org/sage.git/plain/build/pkgs/meataxe/patches/UseErrorPropagation.patch?h=develop")
md5sums=('e0f384e37a69671c73c2904e4e69dc01'
         '5fbe031993c9aa0c41e6d9138748d902'
         'b2ca48d166c538daa80ef7e6646dbb97'
         '6683ff2a272a3ea0e3851a3826684caf'
         '2eeae8b89e018e86205140d316712a66'
         'a3831f351ca465d8dc57a922e4c52b62')

prepare() {
  cd $pkgname-$pkgver
#  for _patch in IO_fixes StrassenWinogradImplementation StrassenWinogradUsage TweakEchelon UseErrorPropagation; do
  for _patch in p1 p2 p3 p4 p5; do
   patch -p1 -i ../$_patch.patch
  done
}

build() {
  cd $pkgname-$pkgver

  export CFLAGS1="$CFLAGS -std=gnu99 -O -Wall -fPIC"
  export ZZZ=0
  touch Makefile.conf
# make
  make tmp/libmtx.a
}

package() {
  cd $pkgname-$pkgver
  
  mkdir -p "$pkgdir"/usr/{include,lib,share/doc/meataxe}
#  install -m755 bin/* "$pkgdir"/usr/bin
  install -m644 tmp/libmtx.a "$pkgdir"/usr/lib
  install -m644 src/meataxe.h "$pkgdir"/usr/include
  install -m644 doc/* "$pkgdir"/usr/share/doc/meataxe
}
