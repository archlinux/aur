#!/bin/hint/bash
# Maintainer: Fredrick Brennan <copypaste@kittens.ph>

pkgname=deskew
_user=galfar
pkgrel=1
pkgver=1.30
pkgdesc="deskew is a command-line program which deskews images containing text"
arch=("any")
url="http://jwilk.net/software/deskew"
license=('MPL')
makedepends=('fpc')
conflicts=('deskew-git')
source=("$pkgname-$pkgver::https://github.com/$_user/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"0001_fix_libtiff_soname.patch")
b2sums=('972fd8441f72bcf9fa40d023def8ff5e6bce30e6a21e1d1ca625ad3e74e7071fd18f85c1b7867049a6a526ee0aecc4501518a266f82e26f379bd393248053d3b'
        '00fb80949f1123e6a5cf2182eeeed8eb944455097b796937f43409df8b713ad932185f30dd632b3f54e0324fa75feccc109ad1d705b9d24ecf1754df471d5b2d')

builddir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$builddir"
  git apply ../*.patch
  cd Scripts
  GCCLIBDIR=$(find /usr/lib/gcc/x86_64-pc-linux-gnu -mindepth 1 -maxdepth 1 -type d | head -n1)
  # Change \r\n to \n
  (tr -d '\r' | \
  # Change \ to /
  tr '\\' '/' | \
  sed -e "s@fpc@fpc -Fl$GCCLIBDIR@") < Compile.bat > compile.sh
  chmod +x compile.sh
  # This file just makes a dir. & calls `fpc` as of when I wrote this PKGBUILD
  ./compile.sh
}

package() {
  install -D "$srcdir/$builddir/Bin/deskew" "$pkgdir/usr/bin/deskew"
}

# vim: syntax=bash
