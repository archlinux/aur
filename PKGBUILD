# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins')
pkgver=4.14.0
pkgrel=3
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('kdepimlibs4' 'libkexiv2_4' 'libkdcraw4' 'libkipi4' 'libksane4' 'liblqr'
             'opencv' 'boost' 'libgpod' 'libkvkontakte' 'hugin' 'libgphoto2'
             'cmake' 'automoc4' 'doxygen' 'lensfun' 'qt4-gstreamer' 'imagemagick' 'eigen' 
	     'libbaloo4' 'libpgf' 'libusb-compat' 'libkface4' 'libkgeomap4' 'libmediawiki' 'clang')
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('08bbded5433e442dce8ac00eb301606ef0924e8c')

prepare() {
# Fix compilation with clang
  sed -e '/fno-tree-pre/d' -i $pkgname-$pkgver/core/CMakeLists.txt
}

build() {
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_tests=OFF \
    -DCMAKE_C_COMPILER=clang # Fix build with flex 2.6
  make
}

package_digikam() {
  pkgdesc="Digital photo management application for KDE"
  depends=('kdebase-runtime' 'kdepimlibs4' 'libgphoto2' 'opencv' 'liblqr'
           'libkipi4' 'libkexiv2_4' 'libkdcraw4' 'libkface4' 'libkgeomap4' 'lensfun' 
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

package_kipi-plugins() {
  pkgdesc="A collection of plugins extending the KDE graphics and image applications as digiKam"
  depends=('kdebase-runtime' 'kdepimlibs4' 'libkdcraw4' 'libkipi4' 'libksane4' 'libkexiv2_4')
  optdepends=('libkgeomap4: Geolocalize tool'
              'libmediawiki: MediaWiki Export plugin'
              'libkvkontakte: VKontakte.ru Exporter plugin'
              'libgpod: iPodExport plugin'
              'opencv: Remove Red Eyes plugin'
              'imagemagick: Video SlideShow plugin'
              'qt4-gstreamer: Video SlideShow plugin'
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
