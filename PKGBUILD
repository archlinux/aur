# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins')
_pkgver=5.4.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=2
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('extra-cmake-modules' 'libkipi' 'libksane' 'liblqr' 'opencv' 'boost'
             'doxygen' 'lensfun' 'eigen' 'kdoctools' 'marble-common' 'kdesignerplugin'
             'kfilemetadata' 'akonadi-contacts' 'qtav' 'threadweaver' 'kcalcore'
             'knotifyconfig' 'libmediawiki' 'libkvkontakte')
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${_pkgver}.tar.xz" digikam-find-qtav.patch)
sha1sums=('6c58ee30cd84b40acf4427f1bb9dbb8b891eb894'
          'b170e5eab5a8c40d1c8c8f2d2cfe5e911ad66939')

prepare() {
  mkdir -p build

# Fix QtAV location
  cd $pkgname-$pkgver
  patch -p1 -i ../digikam-find-qtav.patch
}

build() {
  cd build

  cmake ../${pkgname}-${_pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_OPENCV3=ON \
    -DENABLE_APPSTYLES=ON
  make
}

package_digikam() {
  pkgdesc="Digital photo management application for KDE"
  depends=('liblqr' 'libkipi' 'lensfun' 'opencv' 'akonadi-contacts'
	'knotifyconfig' 'libksane' 'kfilemetadata' 'qtav' 'marble-common' 'threadweaver' 'kcalcore')
  optdepends=('kipi-plugins: export to various online services'
              'hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)')

  cd build/core
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/doc
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/po
  make DESTDIR="$pkgdir" install

# Provided by kipi-plugins
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/{kipiplugin*,libkvkontakte}.mo
}

package_kipi-plugins() {
  pkgdesc="A collection of plugins extending the KDE graphics and image applications as digiKam"
  depends=('kio' 'libkipi')
  optdepends=('libmediawiki: MediaWiki Export plugin'
              'libkvkontakte: VKontakte.ru Exporter plugin')

  cd build/extra
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/po
  make DESTDIR="$pkgdir" install

# Provided by digikam
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/digikam.mo
}
