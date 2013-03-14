# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins' 'libkface' 'libkgeomap' 'libkvkontakte' 'libmediawiki')
pkgver=3.0.0
pkgrel=3
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('kdepimlibs' 'libkexiv2' 'libkdcraw' 'libkipi' 'libksane' 'liblqr'
             'kdeedu-marble' 'opencv' 'boost' 'libgpod' 'qjson' 'hugin'
             'cmake' 'automoc4' 'doxygen' 'mesa' 'lensfun')
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('45a9490b2b10b7b42fa9f90b7389eeb248326718')

build() {
  mkdir build
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
  optdepends=('kipi-plugins: for more extras and plugins')
  install=digikam.install

  cd build/core
  make DESTDIR="${pkgdir}" install
  cd ../../build/doc
  make DESTDIR="${pkgdir}" install
  cd ../../build/po
  make DESTDIR="${pkgdir}" install

  # Fix conflicts with kde-l10n-*
  rm "${pkgdir}"/usr/share/locale/*/LC_MESSAGES/libkipi.mo
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
  depends=('kdebase-runtime' 'kdepimlibs' 'libkdcraw' 'libkipi' 'libksane'
           'opencv' 'libkvkontakte' 'libkexiv2')
  optdepends=('libkgeomap'
              'libmediawiki'
              'libgpod'
              'hugin')
  install=kipi-plugins.install

  cd build/extra/kipi-plugins
  make DESTDIR="${pkgdir}" install
}
