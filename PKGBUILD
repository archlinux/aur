# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>

pkgname=freeimage
pkgver=3.15.1
pkgrel=1
pkgdesc="Library project for developers who would like to support popular graphics image formats."
arch=('i686' 'x86_64')
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net/"
depends=('gcc-libs')
makedepends=('hd2u')
source=("http://downloads.sourceforge.net/project/freeimage/Source%20Distribution/${pkgver}/FreeImage${pkgver//./}.zip"
        'gcc4.5_ln.patch')
md5sums=('450d2ff278690b0d1d7d7d58fad083cc'
         'f85279b2572a0a9e03775909cd9cd759')

build() {
  cp -r FreeImage FreeImagefip

  cd FreeImage
  patch -Np1 < ${srcdir}/gcc4.5_ln.patch
  make

  cd ${srcdir}/FreeImagefip
  patch -Np1 < ${srcdir}/gcc4.5_ln.patch
  make -f Makefile.fip 
}

package() {
  cd FreeImage
  make DESTDIR=${pkgdir} install 

  cd ${srcdir}/FreeImagefip
  make -f Makefile.fip DESTDIR=${pkgdir} install

  install -D -m644 ${srcdir}/FreeImage/license-fi.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/license-fi.txt

  ln -s libfreeimage-${pkgver}.so ${pkgdir}/usr/lib/libfreeimage.so
  ln -s libfreeimageplus-${pkgver}.so ${pkgdir}/usr/lib/libfreeimageplus.so
}
