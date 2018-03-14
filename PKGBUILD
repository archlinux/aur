# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=(digikam kipi-plugins)
_pkgver=5.8.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=2
pkgdesc="An advanced digital photo management application"
arch=(x86_64)
license=(GPL)
url="http://www.digikam.org/"
makedepends=(extra-cmake-modules libkipi libksane liblqr opencv doxygen lensfun eigen boost kdoctools marble-common
             kfilemetadata akonadi-contacts qtav threadweaver kcalcore knotifyconfig libmediawiki libkvkontakte)
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${_pkgver}.tar.xz"
        digikam-opencv-3.4.patch::https://github.com/KDE/digikam/commit/6ea9e428.patch)
sha256sums=('194a44cc3ca229d501acfba67a38d483d1d64069a85e0491dd28dc2b57091c6e'
            '629851cf57e06877ac2a68cac9d258223483d9e54bccfe5a6fdc17c7d323cbae')

prepare() {
  mkdir -p build

  cd $pkgname-$_pkgver/core
  patch -p1 -i ../../digikam-opencv-3.4.patch # Fix crash on face recognition
}

build() {
  cd build

  cmake ../$pkgname-${_pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
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
  depends=(liblqr libkipi lensfun opencv akonadi-contacts knotifyconfig libksane kfilemetadata qtav marble-common threadweaver kcalcore)
  optdepends=('kipi-plugins: export to various online services'
              'hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)')

  cd build/core
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/doc
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/po
  make DESTDIR="$pkgdir" install

# Provided by kipi-plugins
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/kipiplugin*.mo
}

package_kipi-plugins() {
  pkgdesc="A collection of plugins extending the KDE graphics and image applications as digiKam"
  depends=(kio libkipi)
  optdepends=('libmediawiki: MediaWiki Export plugin'
              'libkvkontakte: VKontakte.ru Exporter plugin')

  cd build/extra
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/po
  make DESTDIR="$pkgdir" install

# Provided by digikam
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/digikam.mo
}
