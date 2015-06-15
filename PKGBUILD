# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins' 'libmediawiki')
pkgver=4.11.0
pkgrel=1
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('kdepimlibs' 'libkexiv2' 'libkdcraw' 'libkipi' 'libksane' 'liblqr'
             'kdeedu-marble' 'opencv' 'boost' 'libgpod' 'libkvkontakte' 'hugin' 'libgphoto2'
             'cmake' 'automoc4' 'doxygen' 'lensfun' 'qt-gstreamer' 'imagemagick' 'eigen' 
	     'libbaloo4' 'libpgf' 'libusb-compat' 'libkface' 'libkgeomap')
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('8fa6e277b775b615f10403b30a1b6d45c957ff3c')

prepare() {
# Remove internal FindLibKVkontakte.cmake
  cd $pkgname-$pkgver
  rm cmake/modules/FindLibKVkontakte.cmake
}

build() {
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_tests=OFF \
    -DDIGIKAMSC_COMPILE_LIBMEDIAWIKI=ON 
  make
}

package_digikam() {
  pkgdesc="Digital photo management application for KDE"
  depends=('kdebase-runtime' 'kdepimlibs' 'libgphoto2' 'opencv' 'liblqr'
           'libkipi' 'libkexiv2' 'libkdcraw' 'libkface' 'libkgeomap' 'lensfun' 
	   'libpgf' 'libbaloo4')
  optdepends=('kipi-plugins: more tools and plugins' 'kdebase-workspace: Theme configuration dialog')
  install=digikam.install

  cd build/core
  make DESTDIR="${pkgdir}" install
  cd ../../build/doc/digikam/digikam
  make DESTDIR="${pkgdir}" install
  cd ../showfoto
  make DESTDIR="${pkgdir}" install
  cd ../../../../build/po
  make DESTDIR="${pkgdir}" install

  # Put these in the relevant splitted packages
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/kipiplugin*.mo
  #rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/libkgeomap*.mo
  # Fix conflicts with kde-l10n-* (FS#33762)
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/libkipi.mo
}

package_libmediawiki() {
  pkgdesc="A KDE C++ interface for MediaWiki based web service as wikipedia.org"
  depends=('kdelibs')

  cd build/extra/libmediawiki
  make DESTDIR="${pkgdir}" install
}

package_kipi-plugins() {
  pkgdesc="A collection of plugins extending the KDE graphics and image applications as digiKam"
  depends=('kdebase-runtime' 'kdepimlibs' 'libkdcraw' 'libkipi' 'libksane' 'libkexiv2')
  optdepends=('libkgeomap: Geolocalize tool'
              'libmediawiki: MediaWiki Export plugin'
              'libkvkontakte: VKontakte.ru Exporter plugin'
              'libgpod: iPodExport plugin'
              'opencv: Remove Red Eyes plugin'
              'imagemagick: Video SlideShow plugin'
              'qt-gstreamer: Video SlideShow plugin'
	      'hugin: panorama tools')
  options=('staticlibs')
  install=kipi-plugins.install

  cd build/extra/kipi-plugins
  make DESTDIR="${pkgdir}" install

  cd ../../../build/po
  make DESTDIR="${pkgdir}" install
  # Put these in the relevant splitted packages
  #rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/libkgeomap.mo
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/digikam.mo
  # Fix conflicts with kde-l10n-* (FS#33762)
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/libkipi.mo

  cd ../../build/doc/kipi-plugins
  make DESTDIR="${pkgdir}" install
}
