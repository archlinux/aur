# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: shmilee <shmilee.zju at gmail dot com>
# Contributor: mcmillan <awmcmillan at gmail dot com>

_pkgbase='engauge-digitizer'

pkgname=('engauge' 'engauge-samples')
pkgbase='engauge'
pkgver=10.2
pkgrel=1
url="http://markummitchell.github.io/engauge-digitizer/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('qt5-tools' 'fftw' 'log4cpp' 'libjpeg-turbo' 'libpng' 'openjpeg2' 'poppler-qt5')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/markummitchell/$_pkgbase/archive/v$pkgver.tar.gz"
        "$pkgbase.sh"
        "$pkgbase.desktop")
md5sums=('dc1fb57151051ce60df29d8602198e27'
         'baa6e2963962785d145b63510ba4ee51'
         '95398291d4e0bb4adc1fec22a16625b9')
install=engauge.install

build() {
  cd "$srcdir/${_pkgbase}-$pkgver"
  export OPENJPEG_INCLUDE=/usr/include/openjpeg-2.2 OPENJPEG_LIB=/usr/lib 
  export POPPLER_INCLUDE=/usr/include/poppler/qt5 POPPLER_LIB=/usr/lib
  qmake-qt5 engauge.pro "CONFIG+=jpeg2000 pdf"
  make -j2
  lrelease engauge.pro
  cd help/
  ./build
}

package_engauge() {
  pkgdesc="Extracts data points from images of graphs"
  depends=('qt5-tools' 'fftw' 'log4cpp' 'libpng' 'libjpeg-turbo' 'openjpeg2' 'poppler-qt5')

  cd "$srcdir/${_pkgbase}-$pkgver"
  install -Dm755 ../$pkgbase.sh "$pkgdir/usr/bin/$pkgbase"
  install -Dm755 bin/engauge "$pkgdir/usr/share/$_pkgbase/engauge"
  # translations
  install -dm755 "$pkgdir/usr/share/$_pkgbase/translations/"
  cp translations/*.qm "$pkgdir/usr/share/$_pkgbase/translations/"
  # help
  install -Dm644 bin/documentation/engauge.qhc \
    "$pkgdir/usr/share/$_pkgbase/documentation/engauge.qhc"
  install -Dm644 bin/documentation/engauge.qch \
    "$pkgdir/usr/share/$_pkgbase/documentation/engauge.qch"
  # icon
  install -Dm644 src/img/$_pkgbase.svg \
    "$pkgdir/usr/share/icons/$_pkgbase.svg"
  # desktop
  install -Dm644 $srcdir/$pkgbase.desktop \
	  "$pkgdir/usr/share/applications/$pkgbase.desktop"
}

package_engauge-samples() {
  pkgdesc="sample image files for engauge copied into the doc subdirectory"
  arch=('any')

  cd "$srcdir/${_pkgbase}-$pkgver"
  install -d "$pkgdir/usr/share/doc/$_pkgbase"
  cp -r samples "$pkgdir/usr/share/doc/$_pkgbase"
}
