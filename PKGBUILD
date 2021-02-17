# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: shmilee <shmilee.zju at gmail dot com>
# Contributor: mcmillan <awmcmillan at gmail dot com>

_pkgbase='engauge-digitizer'
pkgname=('engauge-git' 'engauge-samples-git')
pkgbase=engauge-git
pkgver=12.2.1.r116.ga7cb90f4
pkgrel=1
url="http://markummitchell.github.io/engauge-digitizer/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('qt5-tools' 'fftw' 'log4cpp' 'libjpeg-turbo' 'libpng' 'openjpeg2' 'poppler-qt5' 'git')
source=("git+https://github.com/markummitchell/${_pkgbase}.git"
        "${pkgbase%-git}.sh"
        )
sha256sums=('SKIP'
            '4b36a8aa23c5a95a552d33ce1bd75aa1a0be5fdf9ef06f321a060c753298dd18'
        )
install=engauge.install

pkgver() {
  cd $_pkgbase
  git describe --tags --long | sed 's+-+.r+'|tr - .|cut -c2-
}

build() {
  cd $_pkgbase
  export OPENJPEG_INCLUDE=/usr/include/openjpeg-2.4 OPENJPEG_LIB=/usr/lib 
  export POPPLER_INCLUDE=/usr/include/poppler/qt5 POPPLER_LIB=/usr/lib
  qmake-qt5 engauge.pro "CONFIG+=pdf"
  make -j2
  lrelease engauge.pro
}

package_engauge-git() {
  pkgdesc="Extracts data points from images of graphs"
  depends=('qt5-tools' 'fftw' 'log4cpp' 'libpng' 'libjpeg-turbo' 'openjpeg2' 'poppler-qt5')
  conflicts=('engauge')
  provides=('engauge')
  cd $_pkgbase
  install -Dm755 ../${pkgbase%-git}.sh "$pkgdir"/usr/bin/${pkgbase%-git}
  install -Dm755 bin/Engauge "$pkgdir"/usr/lib/$_pkgbase/${pkgbase%-git}
  # translations
  install -dm755 "$pkgdir"/usr/lib/$_pkgbase/translations/
  install -Dm64 translations/*.qm -t "$pkgdir"/usr/lib/$_pkgbase/translations/
  # icon
  install -Dm644 src/img/$_pkgbase.svg \
    "$pkgdir"/usr/share/icons/$_pkgbase.svg
  # desktop
  install -Dm644 "$srcdir"/${_pkgbase}/dev/${_pkgbase}.desktop \
	  "$pkgdir"/usr/share/applications/${pkgbase%-git}.desktop
}

package_engauge-samples-git() {
  pkgdesc="sample image files for engauge copied into the doc subdirectory"
  arch=('any')
  conflicts=('engauge-samples')
  provides=('engauge-samples')

  cd $_pkgbase
  install -d "$pkgdir"/usr/share/doc/$_pkgbase
  cp -r samples "$pkgdir"/usr/share/doc/$_pkgbase
}
