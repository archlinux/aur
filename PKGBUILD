# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins')
_pkgver=5.1.0
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('extra-cmake-modules' 'libkipi' 'libksane' 'liblqr' 'opencv' 'boost'
             'opencv' 'doxygen' 'lensfun' 'eigen' 'kdoctools' 'marble' 'kdesignerplugin'
             'kfilemetadata' 'akonadi-contact' 'qt5-multimedia' 'threadweaver' 'kcalcore'
             'knotifyconfig' 'libmediawiki' 'libkvkontakte')
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${_pkgver}.tar.xz" digikam-5.1-fix-build.patch)
sha1sums=('87a843c39f45b8704ead6e6029e52fb03ee44680'
          '5b6644c8b5534a1712f46fc84948de9a0039a601')

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  # Fix build on i686
  patch -p1 -i ../digikam-5.1-fix-build.patch
}

build() {
  cd build

  cmake ../${pkgname}-${_pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_OPENCV3=ON
  make
}

package_digikam() {
  pkgdesc="Digital photo management application for KDE"
  depends=('liblqr' 'libkipi' 'lensfun' 'opencv' 'akonadi-contact'
	'knotifyconfig' 'libksane' 'kfilemetadata' 'qt5-multimedia' 'marble' 'threadweaver' 'kcalcore')
  optdepends=('kipi-plugins: export to various online services'
              'hugin: panorama tool')

  cd build/core
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/doc/digikam
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/doc-translated/digikam
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
  cd $srcdir/build/doc/kipi-plugins
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/doc-translated/kipi-plugins
  make DESTDIR="pkgdir" install
  cd $srcdir/build/po
  make DESTDIR="$pkgdir" install

# Provided by digikam
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/digikam.mo
}
