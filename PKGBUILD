# $Id: PKGBUILD 61589 2012-01-03 23:37:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=dcpu-16
pkgver=r3
pkgrel=2
pkgdesc="DCPU-16 assembler and emulator written in C++"
arch=('x86_64' 'i686')
url="http://n.ethz.ch/~vartokb/dcpu.html"
license=('unknown')
depends=('sdl')
source=("http://n.ethz.ch/~vartokb/download/$pkgname-$pkgver.tar.bz2")
sha256sums=('7c4c6d606b504552eb8871899be151fc7fd6401f1274a3d0928d9dc823095c08')

build() {
  cd "$srcdir/$pkgname"

  make clean
  sed -i "s:data/font.bmp:/usr/share/$pkgname/font.bmp:" graphics.hpp
  make
  # Use .dcpx for compiled files
  sed -i 's:".bin":".dcpx":' dcasm/main.cpp
  sed -i 's:"bin":"dcpx":' dcasm/main.cpp
  make -C dcasm
  cd samples
  # Use .dasm16 for source files
  for f in *.asm; do mv "$f" "`basename "$f" .asm`.dasm16"; done;
  for f in *.bin; do mv "$f" "`basename "$f" .bin`.dcpx"; done;
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "dcasm/dcasm" "$pkgdir/usr/bin/dcasm"
  install -Dm644 "data/font.bmp" "$pkgdir/usr/share/$pkgname/font.bmp"
  cp -r samples "$pkgdir/usr/share/$pkgname"

  # No license file yet
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
