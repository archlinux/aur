# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>

pkgname=freeimage
pkgver=3.18.0
pkgrel=1
pkgdesc="Library project for developers who would like to support popular graphics image formats"
arch=('x86_64')
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net/"
depends=('libjpeg-turbo' 'openexr' 'openjpeg2' 'libwebp' 'libraw' 'jxrlib')
makedepends=('mesa' 'glu')
source=("https://downloads.sourceforge.net/project/freeimage/Source%20Distribution/${pkgver}/FreeImage${pkgver//./}.zip"
        freeimage-unbundle.patch)
sha512sums=('9d9cc7e2d57552c3115e277aeb036e0455204d389026b17a3f513da5be1fd595421655488bb1ec2f76faebed66049119ca55e26e2a6d37024b3fb7ef36ad4818'
            '500007f5b751f79f96f8c5e1e5f0fcb5bb7e5aa2c453542989a2b29ada1dc328ed1aed863c240111e0dafb0957c53a4cf0d1e72e68e53fb3aa388fb437974dcf')

prepare() {
  cd FreeImage

  # TODO: This will only compile against libjpeg-turbo 2 but we will wait for that :D
  patch -p1 -i ../freeimage-unbundle.patch # Unbundle libraries (Fedora)
  rm -r Source/Lib* Source/ZLib Source/OpenEXR
  # can't be built due to private headers
  > Source/FreeImage/PluginG3.cpp
  > Source/FreeImageToolkit/JPEGTransform.cpp
}

build() {
  cd FreeImage
  sh gensrclist.sh
  sh genfipsrclist.sh
  make -f Makefile.gnu
  make -f Makefile.fip
}

package() {
  cd FreeImage
  make -f Makefile.gnu DESTDIR=${pkgdir} install
  make -f Makefile.fip DESTDIR=${pkgdir} install

  install -D -m644 ${srcdir}/FreeImage/license-fi.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
