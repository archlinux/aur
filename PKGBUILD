# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>

pkgname=freeimage
pkgver=3.15.4
pkgrel=1
pkgdesc="Library project for developers who would like to support popular graphics image formats"
arch=('i686' 'x86_64')
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net/"
depends=('gcc-libs')
makedepends=('dos2unix')
source=("http://downloads.sourceforge.net/project/freeimage/Source%20Distribution/${pkgver}/FreeImage${pkgver//./}.zip")
md5sums=('9f9a3b2c3c1b4fd24fe479e8aaee86b1')

build() {
  cp -r FreeImage FreeImagefip

  export CFLAGS="$CFLAGS -fPIC -fexceptions -fvisibility=hidden -DNO_LCMS"
  export CXXFLAGS="$CXXFLAGS -fPIC -fexceptions -fvisibility=hidden -DNO_LCMS"

  cd FreeImage
  sed -i "1 i #include <cstring>" Source/OpenEXR/IlmImf/ImfAutoArray.h
  make

  cd ${srcdir}/FreeImagefip
  sed -i "1 i #include <cstring>" Source/OpenEXR/IlmImf/ImfAutoArray.h
  make -f Makefile.fip 
}

package() {
  cd FreeImage
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/FreeImagefip
  make -f Makefile.fip DESTDIR=${pkgdir} install

  install -D -m644 ${srcdir}/FreeImage/license-fi.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
