# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins' 'libkface' 'libkgeomap' 'libkvkontakte' 'libmediawiki')
pkgver=3.2.0
pkgrel=1
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('kdepimlibs' 'libkexiv2' 'libkdcraw' 'libkipi' 'libksane' 'liblqr'
             'kdeedu-marble' 'opencv' 'boost' 'libgpod' 'qjson' 'hugin'
             'cmake' 'automoc4' 'doxygen' 'lensfun' 'qt-gstreamer' 'imagemagick')
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "digikam-3.1.0-fixed-pngs.tar.gz")
noextract=("digikam-3.1.0-fixed-pngs.tar.gz")
sha1sums=('666f1d937dc033ddb880aed8a32e7943113d973f'
          'b0a1991e0df9b72c79562c719bc9d944a3b8bc78')

prepare() {
  mkdir build

  cd  ${pkgname}-${pkgver}

  # Fix invalid PNG images to work with libpng 1.6
  # https://bugs.kde.org/show_bug.cgi?id=319350
  tar xf "${srcdir}/digikam-3.1.0-fixed-pngs.tar.gz" --strip-components=1
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_tests=OFF \
    -DDIGIKAMSC_USE_PRIVATE_KDEGRAPHICS=OFF
  make
}

package_digikam() {
  pkgdesc="Digital photo management application for KDE"
  depends=('kdebase-runtime' 'kdepimlibs' 'libgphoto2' 'opencv' 'liblqr'
           'libkipi' 'libkexiv2' 'libkdcraw' 'libkface' 'libkgeomap' 'lensfun')
  optdepends=('kipi-plugins: more tools and plugins')
  install=digikam.install

  cd build/core
  make DESTDIR="${pkgdir}" install
  cd ../../build/doc
  make DESTDIR="${pkgdir}" install
  cd ../../build/po
  make DESTDIR="${pkgdir}" install
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
  install=kipi-plugins.install

  cd build/extra/kipi-plugins
  make DESTDIR="${pkgdir}" install
}
