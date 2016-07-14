# Maintainer: Andy Kluger <andykluger@gmail.com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=digikam-without-akonadi-mediawiki-vkontakte
_pkgver=5.0.0
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=('liblqr' 'libkipi' 'lensfun' 'opencv'
'knotifyconfig' 'libksane' 'kfilemetadata' 'qt5-multimedia' 'marble' 'threadweaver' 'kcalcore')
optdepends=('kipi-plugins: more tools and plugins')
makedepends=('extra-cmake-modules' 'libkipi' 'libksane' 'liblqr' 'opencv' 'boost' 'grantlee-qt5'
             'libgpod' 'hugin' 'opencv' 'doxygen' 'lensfun' 'imagemagick' 'eigen' 'libusb' 'kio' 'kdoctools' 'marble'
             'kfilemetadata' 'qt5-multimedia' 'kdesignerplugin' 'threadweaver' 'kcalcore'
             'knotifyconfig' 'kdelibs4support' 'qt5-xmlpatterns' 'kqoauth')
source=("http://download.kde.org/stable/${_pkgname}/${_pkgname}-${_pkgver}.tar.xz")
sha1sums=('e0dec2eba9ab3a51d632b69b3dd6daf8dca64a45')

prepare() {
  mkdir -p build

# Build fails
  sed -e '/add_subdirectory(showfoto)/d' -i $_pkgname-${_pkgver}/doc-translated/digikam/CMakeLists.txt
}

build() {
  cd build

  cmake ../${_pkgname}-${_pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_OPENCV3=ON
  make
}

package() {
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
