# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins')
pkgver=4.14.0
pkgrel=6
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('kdepimlibs4' 'libkexiv2_4' 'libkdcraw4' 'libkipi4' 'libksane4' 'liblqr'
             'opencv' 'boost' 'libgpod' 'libkvkontakte' 'hugin' 'libgphoto2'
             'cmake' 'automoc4' 'doxygen' 'lensfun' 'imagemagick' 'eigen' 
	     'libbaloo4' 'libpgf' 'libusb-compat' 'libkface4' 'libkgeomap4' 'libmediawiki')
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	lensfun-0.3.2.patch::"https://quickgit.kde.org/?p=digikam.git&a=commitdiff&h=0f15998&o=plain")
sha1sums=('08bbded5433e442dce8ac00eb301606ef0924e8c'
          'b2e262ea5060ad5ffd7d92d41a9badcea6e6c299')

prepare() {
# Fix build with lensfun 0.3.2
  cd $pkgbase-$pkgver/core
  patch -p1 -i "$srcdir"/lensfun-0.3.2.patch
}

build() {
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_tests=OFF \
    -DENABLE_OPENCV3=ON
  make
}

package_digikam() {
  pkgdesc="Digital photo management application for KDE"
  depends=('kdebase-runtime' 'kdepimlibs4' 'libgphoto2' 'opencv' 'liblqr'
           'libkipi4' 'libkexiv2_4' 'libkdcraw4' 'libkface4' 'libkgeomap4' 'lensfun' 
	   'libpgf' 'libbaloo4')
  optdepends=('kipi-plugins: more tools and plugins')
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
