# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: 

pkgname=indent
pkgver=2.2.11
pkgrel=4
pkgdesc="C language source code formatting program"
arch=('x86_64')
url="https://www.gnu.org/software/indent/"
license=('GPL3')
depends=('glibc')
makedepends=('texi2html')
source=(http://ftp.de.debian.org/debian/pool/main/i/indent/${pkgname}_${pkgver}.orig.tar.gz
        indent-2.2.11-segfault.patch
        indent-2.2.11-LC_ALL.patch
        indent-2.2.11-decimal_format.patch)
sha1sums=('9b242528bbc4914464117c69ffae9df24d3fa4a7'
          '31a6dcd5edcac4decac81dbb52bc9415b8b148e4'
          '91b210b666de59ca44524288a4c1ebd213570daa'
          '2b7d5a725fe307ce81565f920a0a66b319b50c91')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../indent-2.2.11-segfault.patch

  # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=205692
  patch -Np1 -i ../indent-2.2.11-LC_ALL.patch

  # https://lists.gnu.org/archive/html/bug-indent/2011-08/msg00000.html
  patch -Np1 -i ../indent-2.2.11-decimal_format.patch
   
  sed -i 's/-number/-number-sections/' doc/Makefile.in
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/regression"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" docdir=/usr/share/doc/indent install
}
