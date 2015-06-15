#! /bin/bash
#Contributor: scj <scj archlinux us>
#Maintainer: jorge_barroso <jorge.barroso.11@gmail.com

pkgname=4th
pkgver=3.62.0
pkgrel=4
pkgdesc="A Forth Compiler"
arch=('i686' 'x86_64')
url="http://www.xs4all.nl/~thebeez/4tH/index.html"
license=('LGPL')
install=
if [ "$CARCH" = "x86_64" ]; then
source=("https://4th.googlecode.com/files/${pkgname}-${pkgver}-$CARCH.tar.gz"
	'Makefile.patch')
sha512sums=('e9a5824d937cc72511ca7ee49c39adefed261865231e47797dac7f49f1a3c1b3476882a76121765b1f5f4936cc3693e8eae2f3d0df6aa48aae9f761abfacdc9f'
            '80d5b2da61b419be13c96cb5a89066a54c0d5abde85300eda625fd106ee73b82978f9897aff9f427f9518dad2ccee1301172d9c93074bb83aaaad070b52eab1a')
else
_iarch=i586
source=("https://4th.googlecode.com/files/${pkgname}-${pkgver}-$_iarch.tar.gz"
	'Makefile.patch')
sha512sums=('80dbe8f3c54baa9150226b7f555e37c0183695dec77adb562262bbad10572f60966b47f5c5db133184a00052a42aed48363a00be7f1ed6bf7d891e619e7eff30'
            '80d5b2da61b419be13c96cb5a89066a54c0d5abde85300eda625fd106ee73b82978f9897aff9f427f9518dad2ccee1301172d9c93074bb83aaaad070b52eab1a')
fi

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/sources"
  patch -uNi ${srcdir}/Makefile.patch || return 1
  if [ "$CARCH" == "x86_64" ]; then
    cp include/* . ; make clean || return 1
  fi
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/sources"
  install -d ${pkgdir}/usr/{share/{doc,man}/4th,{lib,bin}}
  make BINARIES=${pkgdir}/usr/bin \ || return 1
       LIBRARIES=${pkgdir}/usr/lib \ || return 1
       DOCDIR=${pkgdir}/usr/share/doc \ || return 1
       MANDIR=${pkgdir}/usr/share/man install || return 1
}