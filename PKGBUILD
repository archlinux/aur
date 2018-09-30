# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: shmilee <shmilee.zju at gmail dot com>
# Contributor: mcmillan <awmcmillan at gmail dot com>

_pkgbase='engauge-digitizer'

pkgname=('engauge' 'engauge-samples')
pkgbase='engauge'
pkgver=10.10
pkgrel=1
url="http://markummitchell.github.io/engauge-digitizer/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('qt5-tools' 'fftw' 'log4cpp' 'libjpeg-turbo' 'libpng' 'openjpeg2' 'poppler-qt5')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/markummitchell/$_pkgbase/archive/v$pkgver.tar.gz"
        "$pkgbase.sh"
        "$pkgbase.desktop")
sha256sums=('ef7919cdf999b9056cc7f36220bebd0e2e61fe773ba1ec115a15c44f5a27ba33'
            '4b36a8aa23c5a95a552d33ce1bd75aa1a0be5fdf9ef06f321a060c753298dd18'
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
