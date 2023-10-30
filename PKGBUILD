#!/bin/hint/bash
# Maintainer: Fredrick Brennan <copypaste@kittens.ph>

pkgname=deskew-git
_name=deskew
_user=galfar
pkgrel=2
pkgver=v1.30.r40.ga29039e
pkgdesc="deskew is a command-line program which deskews images containing text"
arch=("any")
url="http://jwilk.net/software/deskew"
license=('MPL')
makedepends=('fpc')
source=("${_name}::git+https://github.com/${_user}/${_name}"
	"0001_fix_libtiff_soname.patch")
provides=('deskew')
conflicts=('deskew')
b2sums=('SKIP'
        '00fb80949f1123e6a5cf2182eeeed8eb944455097b796937f43409df8b713ad932185f30dd632b3f54e0324fa75feccc109ad1d705b9d24ecf1754df471d5b2d')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
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
  install -D "$srcdir/${_name}/Bin/deskew" "$pkgdir/usr/bin/deskew"
}

# vim: syntax=bash
