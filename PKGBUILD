# Maintainer: shmilee <shmilee.zju at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: mcmillan <awmcmillan at gmail dot com>

pkgname=engauge-digitizer
pkgver=10.0
pkgrel=1
pkgdesc="Extracts data points from images of graphs - with jpeg2000 and PDF support"
url="http://markummitchell.github.io/engauge-digitizer/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-tools' 'fftw' 'log4cpp' 'libjpeg-turbo' 'libpng' 'openjpeg2' 'poppler-qt5')
conflicts=('engauge')
source=("${pkgname}-$pkgver.tar.gz::https://github.com/markummitchell/${pkgname}/archive/v$pkgver.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
md5sums=('24ca9841ccefff0645c157e2fa72daa9'
         'baa6e2963962785d145b63510ba4ee51'
         '68d9a4e7fbddd9257902725df0355a52')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  export OPENJPEG_INCLUDE=/usr/include/openjpeg-2.1 OPENJPEG_LIB=/usr/lib
  export POPPLER_INCLUDE=/usr/include/poppler/qt5 POPPLER_LIB=/usr/lib
  qmake-qt5 engauge.pro "CONFIG+=jpeg2000 pdf"
  make -j2
  lrelease engauge.pro
  cd help/
  ./build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  install -Dm755 ../${pkgname}.sh "$pkgdir/usr/bin/${pkgname}"
  install -Dm755 bin/engauge "$pkgdir/usr/share/${pkgname}/engauge"

  install -dm755 "$pkgdir/usr/share/${pkgname}/translations/"
  cp translations/*.qm "$pkgdir/usr/share/${pkgname}/translations/"

  install -Dm644 bin/documentation/engauge.qhc \
    "$pkgdir/usr/share/${pkgname}/documentation/engauge.qhc"
  install -Dm644 bin/documentation/engauge.qch \
    "$pkgdir/usr/share/${pkgname}/documentation/engauge.qch"

  install -Dm644 src/img/${pkgname}.svg \
    "$pkgdir/usr/share/icons/${pkgname}.svg"

  #cp -r samples $pkgdir/usr/share/${pkgname}/

  install -Dm644 "$srcdir/${pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
