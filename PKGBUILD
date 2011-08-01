# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins' 'libkface' 'libkgeomap' 'libmediawiki')
pkgver=2.0.0
pkgrel=1
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('kdepimlibs' 'libkexiv2' 'libkdcraw' 'libkipi' 'libksane' 'liblqr'
             'kdeedu-marble' 'opencv' 'boost' 'cmake' 'automoc4' 'doxygen')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('7b1ab69fc2fb36a45dc3ca38b01d42d8')

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
           'libkipi' 'libkexiv2' 'libkdcraw')
  optdepends=('kipi-plugins: for more extras and plugins'
              'libkface')
  install=digikam.install

  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
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

package_libmediawiki() {
  pkgdesc="A KDE C++ interface for MediaWiki based web service as wikipedia.org"
  depends=('kdelibs')

  cd "${srcdir}"/build/extra/libmediawiki
  make DESTDIR="${pkgdir}" install
}

package_kipi-plugins() {
  pkgdesc="A collection of plugins extending the KDE graphics and image applications as digiKam"
  depends=('kdebase-runtime' 'kdepimlibs' 'libkdcraw' 'libkipi' 'libksane'
           'opencv')
  optdepends=('libkgeomap'
              'libmediawiki')
  install=kipi-plugins.install

  cd "${srcdir}"/build/extra/kipi-plugins
  make DESTDIR="${pkgdir}" install
}
