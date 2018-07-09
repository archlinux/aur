# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: shmilee <shmilee.zju at gmail dot com>
# Contributor: mcmillan <awmcmillan at gmail dot com>

_pkgbase='engauge-digitizer'

pkgname=('engauge' 'engauge-samples')
pkgbase='engauge'
pkgver=10.8
pkgrel=1
url="http://markummitchell.github.io/engauge-digitizer/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('qt5-tools' 'fftw' 'log4cpp' 'libjpeg-turbo' 'libpng' 'openjpeg2' 'poppler-qt5')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/markummitchell/$_pkgbase/archive/v$pkgver.tar.gz"
        "$pkgbase.sh"
        "$pkgbase.desktop")
sha256sums=('573648f525adbef91168dcbdaa04eb0be72dae7557f88ebcc6eff999cdcc842d'
            '6192374e8620c7c77d66c4313907bad305c6b03a80bb9244fd49753f8997aa31'
            '1b3f2675058693d5653b5aee50fbec1530791de5fcdfbb2f86056a5d748695a4')
install=engauge.install

build() {
  cd ${_pkgbase}-$pkgver
  export OPENJPEG_INCLUDE=/usr/include/openjpeg-2.3 OPENJPEG_LIB=/usr/lib 
  export POPPLER_INCLUDE=/usr/include/poppler/qt5 POPPLER_LIB=/usr/lib
  qmake-qt5 engauge.pro "CONFIG+=jpeg2000 pdf"
  make -j2
  lrelease engauge.pro
}

package_engauge() {
  pkgdesc="Extracts data points from images of graphs"
  depends=('qt5-tools' 'fftw' 'log4cpp' 'libpng' 'libjpeg-turbo' 'openjpeg2' 'poppler-qt5')

  cd ${_pkgbase}-$pkgver
  install -Dm755 ../$pkgbase.sh "$pkgdir"/usr/bin/$pkgbase
  install -Dm755 bin/engauge "$pkgdir"/usr/lib/$_pkgbase/engauge
  # translations
  install -dm755 "$pkgdir"/usr/lib/$_pkgbase/translations/
  install -Dm64 translations/*.qm -t "$pkgdir"/usr/lib/$_pkgbase/translations/
  # icon
  install -Dm644 src/img/$_pkgbase.svg \
    "$pkgdir"/usr/share/icons/$_pkgbase.svg
  # desktop
  install -Dm644 "$srcdir"/$pkgbase.desktop \
	  "$pkgdir"/usr/share/applications/$pkgbase.desktop
}

package_engauge-samples() {
  pkgdesc="sample image files for engauge copied into the doc subdirectory"
  arch=('any')

  cd ${_pkgbase}-$pkgver
  install -d "$pkgdir"/usr/share/doc/$_pkgbase
  cp -r samples "$pkgdir"/usr/share/doc/$_pkgbase
}
