# Maintainer: Andrea Scarpino <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins' 'libkface' 'libkgeomap' 'libkvkontakte' 'libmediawiki')
pkgver=2.3.0
pkgrel=2
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('kdepimlibs' 'libkexiv2' 'libkdcraw' 'libkipi' 'libksane' 'liblqr'
             'kdeedu-marble' 'opencv' 'boost' 'libgpod' 'qjson' 'hugin'
             'cmake' 'automoc4' 'doxygen')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('15b8b16d7cce6ac50fb958d30166214f2f2b83ee')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  # Use internal lensfun (FS#21816)
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DLENSFUN_LIBRARY="" \
    -DLENSFUN_INCLUDE_DIR=""
  make
}

package_digikam() {
  pkgdesc="Digital photo management application for KDE"
  depends=('kdebase-runtime' 'kdepimlibs' 'libgphoto2' 'opencv' 'liblqr'
           'libkipi' 'libkexiv2' 'libkdcraw' 'libkface' 'libkgeomap')
  optdepends=('kipi-plugins: for more extras and plugins')
  install=digikam.install

  cd "${srcdir}"/build/core
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}"/build/doc
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}"/build/po
  make DESTDIR="${pkgdir}" install

  # these are in oxygen-icons
  rm -rf ${pkgdir}/usr/share/icons

}

package_libkface() {
  pkgdesc="A Qt/C++ wrapper around LibFace library to perform face recognition and detection over pictures"
  depends=('kdelibs' 'opencv')

  cd "${srcdir}"/build/extra/libkface
  make DESTDIR="${pkgdir}" install
}

package_libkgeomap() {
  pkgdesc="A wrapper around world map components for browsing and arranging photos on a map"
  depends=('kdelibs' 'kdeedu-marble' 'libkexiv2')

  cd "${srcdir}"/build/extra/libkgeomap
  make DESTDIR="${pkgdir}" install
}

package_libkvkontakte() {
  pkgdesc="KDE C++ library for asynchronous interaction with vkontakte.rusocial network"
  depends=('kdelibs')

  cd "${srcdir}"/build/extra/libkvkontakte
  make DESTDIR="${pkgdir}" install
}

package_libmediawiki() {
  pkgdesc="A KDE C++ interface for MediaWiki based web service as wikipedia.org"
  depends=('kdelibs')

  cd "${srcdir}"/build/extra/libmediawiki
  make DESTDIR="${pkgdir}" install
}

package_kipi-plugins() {
  pkgdesc="A collection of plugins extending the KDE graphics and image applications as digiKam"
  depends=('kdebase-runtime' 'kdepimlibs' 'libkdcraw' 'libkipi' 'libksane'
           'opencv' 'qjson' 'libkvkontakte' 'libkexiv2')
  optdepends=('libkgeomap'
              'libmediawiki'
              'libgpod'
              'hugin')
  install=kipi-plugins.install

  cd "${srcdir}"/build/extra/kipi-plugins
  make DESTDIR="${pkgdir}" install
}
