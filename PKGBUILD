# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Laurent Hilsz <laurent.hilsz@laposte.net> 

pkgname=fdutils
pkgver=5.5
pkgrel=5
arch=('i686' 'x86_64')
pkgdesc="Utilities for the Linux floppy driver, i.e. for formatting extra capacity disks"
url="http://fdutils.linux.lu/index.html"
makedepends=('texinfo' 'tcc' 'texlive-bin' 'texlive-core')
depends=('glibc' 'tcc' 'texinfo')
source=(http://deb.debian.org/debian/pool/main/f/fdutils/fdutils_5.5-20060227.orig.tar.gz
        http://deb.debian.org/debian/pool/main/f/fdutils/fdutils_5.5-20060227-7.debian.tar.xz)
md5sums=('cccab0f580659b91810a590436f688ee'
         '0168d881016bfde31c7f0d0c0667bf30')
install=fdutils.install
options=('!strip' '!makeflags' '!buildflags')
license=('GPL')

prepare() {
  cd "${srcdir}/fdutils-5.5-20060227"
  while read -r i 
  do
    patch -p1 -i "${srcdir}/debian/patches/${i}"
  done <"${srcdir}/debian/patches/series"
  sed -i '1i#include "../config.h"' src/*.c
}

build() {
  cd "${srcdir}/fdutils-5.5-20060227"
  autoreconf
  export CC=tcc
  ./configure --prefix=/usr --sysconfdir=/etc --infodir=/usr/share/info
  sed -i 's+-c -s -m+-c -m+g' src/Makefile
  make
}

package() {
  cd "${srcdir}/fdutils-5.5-20060227"
  install -d $pkgdir/etc
  make DESTDIR=$pkgdir install
  rm "${pkgdir}/usr/share/man/man4/fd.4"
}
