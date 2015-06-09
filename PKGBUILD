# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=asmutils
pkgver=0.18
pkgrel=3
pkgdesc="A 32-bit *NIX userland written in assembly"
arch=('i686' 'x86_64')
license=('GPLv2')
url="http://asm.sourceforge.net/asmutils.html"
makedepends=("nasm")
options=('docs' 'staticlibs' '!strip')
source=("http://asm.sourceforge.net/asmutils/asmutils-${pkgver}.tar.gz")
md5sums=('a11c8fea347026449ecd2e5807e77d64')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/24$/31/' MCONFIG
  sed -i 's/gmake/make/' MCONFIG
  sed -i 's/static //' lib/libm.c
  if test "$CARCH" == x86_64; then
    sed -i 's/LD := ld/& -melf_i386/' MCONFIG
    sed -i 's/CC := gcc/& -m32/' MCONFIG
  fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  find . -name "*.asm" -delete
  find . -name "*.o" -delete
  find . -name "*.h" -delete
  find . -name "*.c" -delete
  find . -name "Makefile" -delete

  mkdir -p "$pkgdir"/opt/asmutils/{bin,lib,doc}
  cp -ar src/* "$pkgdir"/opt/asmutils/bin/
  cp -ar lib "$pkgdir"/opt/asmutils/
  cp -ar doc "$pkgdir"/opt/asmutils/
}
