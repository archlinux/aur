# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=jdatestamp
pkgver=1.2
pkgrel=2
pkgdesc='losslessly imprint date/time of a picture into its JPEG image'
arch=(i686 x86_64)
url="http://sourceforge.net/projects/jdatestamp/"
license=(custom)
depends=(freetype2 libjpeg9)
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-src.tar.gz/download
        jpegtran_binary.patch)
md5sums=('eaf9075f17780c6ef50f40e0865b28d1'
         'e0036c42274bf6fd265fec8debd04803')

prepare() {
  cd ${srcdir}/$pkgname-$pkgver-src
  patch -p2 -i "${srcdir}/jpegtran_binary.patch"
}

build() {
  cd ${srcdir}/$pkgname-$pkgver-src
  sed -i -e 's/LIBJPEG =.*/LIBJPEG =\/usr/' -e 's/FREETYPE2 =.*/FREETYPE2 =\/usr/' -e '/STATICLIBS/s/-Wl,//' makefile
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver-src
  mkdir -p ${pkgdir}/usr/{share/{doc/jdatestamp,jdatestamp/installFiles},bin}
  install -Dm755 ./jdatestamp ${pkgdir}/usr/share/jdatestamp/jdatestamp
  install -Dm644 installFiles/*.txt ${pkgdir}/usr/share/jdatestamp
  install -Dm644 installFiles/docs/* ${pkgdir}/usr/share/doc/jdatestamp
  ln -s /usr/share/jdatestamp/jdatestamp ${pkgdir}/usr/bin/jdatestamp
}
