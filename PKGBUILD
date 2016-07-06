# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=('digikam' 'kipi-plugins')
_pkgver=5.0.0
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
makedepends=('extra-cmake-modules' 'libkipi' 'libksane' 'liblqr' 'opencv' 'boost' 'grantlee-qt5'
             'hugin' 'opencv' 'doxygen' 'lensfun' 'imagemagick' 'eigen' 'libusb' 'kio' 'kdoctools' 'marble'
             'kfilemetadata' 'akonadi-contact' 'qt5-multimedia' 'kdesignerplugin' 'threadweaver' 'kcalcore'
             'knotifyconfig' 'kdelibs4support' 'qt5-xmlpatterns' 'libmediawiki' 'libkvkontakte' 'kqoauth')
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${_pkgver}.tar.xz")
sha1sums=('e0dec2eba9ab3a51d632b69b3dd6daf8dca64a45')

prepare() {
  mkdir -p build

# Build fails
  sed -e '/add_subdirectory(showfoto)/d' -i $pkgname-${_pkgver}/doc-translated/digikam/CMakeLists.txt
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
  optdepends=('kipi-plugins: more tools and plugins')

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
              'libkvkontakte: VKontakte.ru Exporter plugin'
              'kqoauth: OAuth authentication for imgur')

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
