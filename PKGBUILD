# Maintainer: Andy Kluger <andykluger@gmail.com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=digikam-without-akonadi-mediawiki-vkontakte
_pkgver=5.1.0
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=('liblqr' 'libkipi' 'lensfun' 'opencv' 'knotifyconfig' 'libksane'
         'kfilemetadata' 'qt5-multimedia' 'marble' 'threadweaver' 'kcalcore')
optdepends=('kipi-plugins: export to various online services'
            'hugin: panorama tool')
makedepends=('extra-cmake-modules' 'libkipi' 'libksane' 'liblqr' 'opencv'
             'boost' 'opencv' 'doxygen' 'lensfun' 'eigen' 'kdoctools' 'marble'
             'kdesignerplugin' 'kfilemetadata' 'qt5-multimedia' 'threadweaver'
             'kcalcore' 'knotifyconfig')
source=("http://download.kde.org/stable/${_pkgname}/${_pkgname}-${_pkgver}.tar.xz"
        'digikam-5.1-fix-build.patch')
sha1sums=('87a843c39f45b8704ead6e6029e52fb03ee44680'
          '5b6644c8b5534a1712f46fc84948de9a0039a601')

prepare() {
  mkdir -p build

  cd "${_pkgname}-${_pkgver}"
  # Fix build on i686
  patch -p1 -i ../digikam-5.1-fix-build.patch
}

build() {
  cd build

  cmake "../${_pkgname}-${_pkgver}" \
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
  cd "$srcdir/build/doc/${_pkgname}"
  make DESTDIR="$pkgdir" install
  cd "$srcdir/build/doc-translated/${_pkgname}"
  make DESTDIR="$pkgdir" install
  cd "$srcdir/build/po"
  make DESTDIR="$pkgdir" install

# Provided by kipi-plugins
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/{kipiplugin*,libkvkontakte}.mo
}
