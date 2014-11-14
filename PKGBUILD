# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins' 'libkface' 'libkgeomap' 'libkvkontakte' 'libmediawiki')
pkgver=4.5.0
pkgrel=2
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('kdepimlibs' 'libkexiv2' 'libkdcraw' 'libkipi' 'libksane' 'liblqr'
             'kdeedu-marble' 'opencv' 'boost' 'libgpod' 'qjson' 'hugin' 'libgphoto2'
             'cmake' 'automoc4' 'doxygen' 'lensfun' 'qt-gstreamer' 'imagemagick' 'eigen' 
	     'libbaloo4' 'libpgf')
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	"libkexiv2.patch")
sha1sums=('ba735f4b7bb0437c1676141ab78ea958e46f135e'
          '1bcef459bd400a04526aac9adf39d4d0a1c3549c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/libkexiv2.patch" 
}

build() {
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_tests=OFF \
    -DDIGIKAMSC_USE_PRIVATE_KDEGRAPHICS=OFF \
    -DDIGIKAMSC_USE_PRIVATE_SHAREDLIBS=ON
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
  cd ../../build/doc
  make DESTDIR="${pkgdir}" install
  cd ../../build/po
  make DESTDIR="${pkgdir}" install

  # Put these in the relevant splitted packages
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/kipiplugin*.mo
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/libkgeomap*.mo
  # Fix conflicts with kde-l10n-* (FS#33762)
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/libkipi.mo
}

package_libkface() {
  pkgdesc="A Qt/C++ wrapper around LibFace library to perform face recognition and detection over pictures"
  depends=('kdelibs' 'opencv')

  cd build/extra/libkface
  make DESTDIR="${pkgdir}" install
}

package_libkgeomap() {
  pkgdesc="A wrapper around world map components for browsing and arranging photos on a map"
  depends=('kdelibs' 'kdeedu-marble')

  cd build/extra/libkgeomap
  make DESTDIR="${pkgdir}" install

  cd ../../../build/po
  make DESTDIR="${pkgdir}" install
  # Put these in the relevant splitted packages
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/kipiplugin*.mo
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/digikam.mo
  # Fix conflicts with kde-l10n-* (FS#33762)
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/libkipi.mo
}

package_libkvkontakte() {
  pkgdesc="KDE C++ library for asynchronous interaction with vkontakte.rusocial network"
  depends=('kdelibs' 'qjson')

  cd build/extra/libkvkontakte
  make DESTDIR="${pkgdir}" install
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
              'qt-gstreamer: Video SlideShow plugin')
  options=('staticlibs')
  install=kipi-plugins.install

  cd build/extra/kipi-plugins
  make DESTDIR="${pkgdir}" install

  cd ../../../build/po
  make DESTDIR="${pkgdir}" install
  # Put these in the relevant splitted packages
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/libkgeomap.mo
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/digikam.mo
  # Fix conflicts with kde-l10n-* (FS#33762)
  rm "${pkgdir}"/usr/share/locale/kde4/*/LC_MESSAGES/libkipi.mo
}
